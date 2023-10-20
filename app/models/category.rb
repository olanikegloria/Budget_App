class Category < ApplicationRecord
  has_many :category_expenses
  has_many :expenses, through: :category_expenses

  validates :name, presence: true, uniqueness: true
  validates :icon, presence: true

  def total_amount(user)
    expenses.where(author_id: user.id).eager_load(:category_expenses).sum('expenses.amount')
  end
end
