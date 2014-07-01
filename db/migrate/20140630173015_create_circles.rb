class CreateCircles < ActiveRecord::Migration
  def change
    create_table :circles do |t|
      t.string :name, null: false
      t.timestamps
    end
  end
end
