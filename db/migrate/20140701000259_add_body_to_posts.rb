class AddBodyToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :body, :text, null: false, default: ""
  end
end
