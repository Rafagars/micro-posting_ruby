class AddLikedToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :liked, :string
  end
end
