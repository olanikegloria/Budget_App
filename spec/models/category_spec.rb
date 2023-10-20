require 'rails_helper'

describe Category, type: :model do
  before :each do
    @category = Category.create(name: 'Utilities', icon: 'https://source.unsplash.com/random')
    @user = User.create(name: 'Tester', email: 'foo@bar.com', password: 'password')
    @expense1 = Expense.create(name: 'Food', amount: 50, author_id: @user.id)
    @expense2 = Expense.create(name: 'Water', amount: 10, author_id: @user.id)
    @expense3 = Expense.create(name: 'Groceries', amount: 30, author_id: @user.id)

    CategoryExpense.create(expense_id: @expense1.id, category_id: @category.id)
    CategoryExpense.create(expense_id: @expense2.id, category_id: @category.id)
    CategoryExpense.create(expense_id: @expense3.id, category_id: @category.id)
  end

  context "When Testing new Category's validity" do
    it 'should be valid' do
      expect(@category).to be_valid
    end

    it 'should have a name' do
      @category.name = nil
      expect(@category).to_not be_valid
    end

    it 'should have an icon' do
      @category.icon = nil
      expect(@category).to_not be_valid
    end
  end

  context "when testing Category's methods" do
    it 'should have the total amount' do
      expect(@category.total_amount(@user)).to eq(90)
    end
  end
end
