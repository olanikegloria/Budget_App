require 'rails_helper'

describe Expense, type: :model do
  before :each do
    user = User.create(name: 'Tester', email: 'foo@bar.com', password: 'password')
    @expense = Expense.create(name: 'Food', amount: 50, author_id: user.id)
  end

  context 'When Testing new user validity' do
    it 'should be valid' do
      expect(@expense).to be_valid
    end

    it 'should have a name' do
      @expense.name = nil
      expect(@expense).to_not be_valid
    end

    it 'should have an amount' do
      @expense.amount = nil
      expect(@expense).to_not be_valid
    end

    it 'should have a author_id' do
      @expense.author_id = nil
      expect(@expense).to_not be_valid
    end
  end
end
