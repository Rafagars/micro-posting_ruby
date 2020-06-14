class RemoveBodyFromPost < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :body, :text
  end
end
