class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :isbn, unique: true
      t.boolean :available, default: true

      t.timestamps
    end

    add_index :books, :isbn, unique: true 
  end
end
