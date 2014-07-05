class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name
      t.decimal :price
      t.string :memo
      t.string :image

      t.timestamps
    end
  end
end
