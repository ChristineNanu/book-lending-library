class AddDueDateAndReturnedToBorrowings < ActiveRecord::Migration[8.0]
  def change
    add_column :borrowings, :due_date, :datetime
    add_column :borrowings, :returned, :boolean
  end
end
