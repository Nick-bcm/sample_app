class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.integer :weight
      t.integer :price, default: 30

      t.timestamps
    end
  end
end
