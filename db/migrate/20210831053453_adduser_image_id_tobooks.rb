class AdduserImageIdTobooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :user_image_id, :string
  end
end
