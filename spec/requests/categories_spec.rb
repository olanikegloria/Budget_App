require 'rails_helper'

RSpec.describe '/categories', type: :feature do
  before :each do
    @category = Category.create(name: 'Utilities', icon: 'https://source.unsplash.com/random')
    @user = User.create(name: 'Tester', email: 'foo@bar.com', password: 'password', confirmed_at: Time.now)
    @expense1 = Expense.create(name: 'Food', amount: 50, author_id: @user.id)
    @expense2 = Expense.create(name: 'Water', amount: 10, author_id: @user.id)
    @expense3 = Expense.create(name: 'Groceries', amount: 30, author_id: @user.id)

    CategoryExpense.create(expense_id: @expense1.id, category_id: @category.id)
    CategoryExpense.create(expense_id: @expense2.id, category_id: @category.id)
    CategoryExpense.create(expense_id: @expense3.id, category_id: @category.id)

    sign_in @user
    visit category_expenses_path(@category)
  end

  describe 'GET /index' do
    it 'should have the list of all expense for this category' do
      expect(page).to have_content(@expense1.name)
      expect(page).to have_content(@expense2.name)
      expect(page).to have_content(@expense3.name)
    end

    it 'should have the total amount of this category' do
      expect(page).to have_content(@category.total_amount(@user))
    end

    it 'should have a button add new expense' do
      expect(page).to have_content('New expense')
    end
  end
end
