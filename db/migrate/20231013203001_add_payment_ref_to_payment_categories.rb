class AddPaymentRefToPaymentCategories < ActiveRecord::Migration[7.0]
  def change
    add_reference :payment_categories, :payment, null: false, foreign_key: true
  end
end
