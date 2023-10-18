class Category < ApplicationRecord
    validates :name, presence: true, length: { maximum: 250 }
    validates :icon, presence: true

    has_many :category_expenses
   has_many :expenses, through: :category_expenses

   def total_amount(user)
    self.expenses.where(author_id: user.id).eager_load(:category_expenses).sum("expenses.amount")
   end
end
