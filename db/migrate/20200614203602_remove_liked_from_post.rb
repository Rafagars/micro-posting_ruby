class RemoveLikedFromPost < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :liked, :string
  end
end
