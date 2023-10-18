class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :confirmable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Validations
  validates :name, presence: true, length: { in: 2..40 }

  # Associations
  has_many :payments, dependent: :destroy
  has_many :categories, class_name: 'Category', foreign_key: 'author_id', dependent: :destroy
  has_many :payment_categories, through: :payments
end
