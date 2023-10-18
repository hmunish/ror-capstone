class PaymentCategory < ApplicationRecord
  belongs_to :category
  belongs_to :payment
end
