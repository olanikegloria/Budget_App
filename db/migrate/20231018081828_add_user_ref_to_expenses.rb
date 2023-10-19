class AddUserRefToExpenses < ActiveRecord::Migration[7.1]
  def change
    add_reference :expenses, :author, null: false, foreign_key: {to_table: :users}
  end
end
