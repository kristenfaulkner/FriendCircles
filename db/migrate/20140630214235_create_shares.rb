class CreateShares < ActiveRecord::Migration
  def change
    create_table :shares do |t|
      t.integer :post_id
      t.integer :circle_id
      t.timestamps
    end
  end
end
