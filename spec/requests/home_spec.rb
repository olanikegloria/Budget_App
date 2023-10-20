require 'rails_helper'

RSpec.describe '/', type: :feature do
  before :each do
    @category = Category.create(name: 'Utilities', icon: 'https://source.unsplash.com/random')
    @user = User.create(name: 'Tester', email: 'foo@bar.com', password: 'password', confirmed_at: Time.now)
    @expense1 = Expense.create(name: 'Food', amount: 50, author_id: @user.id)
    @expense2 = Expense.create(name: 'Water', amount: 10, author_id: @user.id)
    @expense3 = Expense.create(name: 'Groceries', amount: 30, author_id: @user.id)

    CategoryExpense.create(expense_id: @expense1.id, category_id: @category.id)
    CategoryExpense.create(expense_id: @expense2.id, category_id: @category.id)
    CategoryExpense.create(expense_id: @expense3.id, category_id: @category.id)
  end

  describe 'GET /' do
    it 'should have the splash screen' do
      visit root_url
      expect(page).to have_content('Wallet Aid')
      expect(page).to have_content('Log in')
      expect(page).to have_content('Sign up')
    end

    it 'should should have the category list' do
      sign_in @user
      visit root_url
      expect(page).to have_content(@category.name)
      expect(page).to have_content(@category.total_amount(@user))
    end

    it 'should redirect to category page' do
      sign_in @user
      visit root_url
      click_link @category.name
      expect(page).to have_content(@category.name)
      expect(page).to have_content(@category.total_amount(@user))
      expect(page).to have_content(@expense1.name)
      expect(page).to have_content(@expense2.name)
      expect(page).to have_content(@expense3.name)
    end

    it 'should have a add new category button' do
      sign_in @user
      visit root_url
      expect(page).to have_content('Add new category')
    end
  end
end
