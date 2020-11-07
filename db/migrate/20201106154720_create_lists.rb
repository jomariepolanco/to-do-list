class CreateLists < ActiveRecord::Migration[6.0]
  def change
    create_table :lists do |t|
      t.string :category
      t.boolean :complete
      t.timestamps
    end
  end
end
