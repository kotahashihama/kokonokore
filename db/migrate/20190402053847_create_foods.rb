class CreateFoods < ActiveRecord::Migration[5.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :shop_name
      t.text :description

      t.timestamps
    end
  end
end
