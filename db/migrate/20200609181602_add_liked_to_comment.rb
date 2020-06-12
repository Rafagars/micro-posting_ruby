class AddLikedToComment < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :liked, :string
  end
end
