class AddUserImageToCocktails < ActiveRecord::Migration[5.2]
  def change
    add_column :cocktails, :user_image, :string
  end
end
