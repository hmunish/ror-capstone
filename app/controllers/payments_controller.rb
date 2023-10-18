class PaymentsController < ApplicationController

  def index
    @payments = Payment.all
    @categories = Category.all
  end


  def show
    @category_id = params[:id]
    @category = Category.find(@category_id)
    @category_name = @category.name
    payment_categories = PaymentCategory.where(category_id: @category_id)
    @payments = Payment.where(id: payment_categories.pluck(:payment_id)).order(created_at: :desc)
    @sum = @payments.sum(:amount)
  end


  def new
    @payment = Payment.new
    @categories = Category.all
  end

  def create
    @payment = Payment.new(author_id: current_user.id, **payment_params)
    category_ids = params[:payment][:category_ids].reject(&:empty?)

    if @payment.save
      category_ids.each do |category_id|
        PaymentCategory.create(payment: @payment, category_id:)
      end
      my_category = category_ids.first
      flash[:success] = 'Successfully captured payment.'
      redirect_to user_payment_url(author_id: current_user.id, id: my_category)
    else
      flash[:error] = 'There was an error while capturing the payment.'
      render :new
    end
  end

  def destroy
    return unless @payment.destroy
    redirect_to user_payments_url
  end

  private

  def payment_params
    params.require(:payment).permit(:name, :amount, category_ids: [])
  end
end
