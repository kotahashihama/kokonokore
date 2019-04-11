class AddPictureToFoods < ActiveRecord::Migration[5.2]
  def change
    add_column :foods, :picture, :string
  end
end
