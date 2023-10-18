class JoiningTransactionToExpenses < ActiveRecord::Migration[7.1]
  def change
    create_join_table :expenses, :categories do |t|
      t.index :expense_id
      t.index :category_id
    end

    create_table :category_expenses do |t|
      t.references :category, null: false, foreign_key: true
      t.references :expense, null: false, foreign_key: true

      t.timestamps
    end

  end
end
