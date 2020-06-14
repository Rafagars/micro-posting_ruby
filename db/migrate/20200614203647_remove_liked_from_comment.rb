class RemoveLikedFromComment < ActiveRecord::Migration[6.0]
  def change
    remove_column :comments, :liked, :string
  end
end
