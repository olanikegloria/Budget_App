class Expense < ApplicationRecord
    validates :name, presence: true, length: { maximum: 250 }
    validates :amount, presence: true, numericality: { only_integer: true }

    belongs_to :author, class_name: 'User', foreign_key: 'author_id'
    has_many :category_expenses
    has_many :categories, through: :category_expenses
end
