require 'rails_helper'

RSpec.describe PaymentCategory, type: :model do
  let(:user) { User.new(name: 'Munish', email: 'munish@yahoo.com', password: 'munish123', confirmed_at: Time.now) }
  before { user.save }

  let(:category) { Category.new(id: 5, name: 't-shirts', icon: 'clothes.svg') }
  before { category.save }

  let(:payment) { Payment.new(id: 7, name: 'checks', amount: 10) }
  before { payment.save }

  let(:payment_category) { PaymentCategory.new(category_id: 1, payment_id: 1) }
  before { payment_category.save }

  it 'valid category_id' do
    payment_category.category_id = 5
    expect(payment_category).to_not be_valid
  end

  it 'valid payment_id' do
    payment_category.category_id = 7
    expect(payment_category).to_not be_valid
  end
end
