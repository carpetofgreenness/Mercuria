class CreateBoats < ActiveRecord::Migration[5.0]
  def change
    create_table :boats do |t|
      t.string :name
      t.string :location
      t.integer :user_id
      t.integer :container_num

      t.timestamps
    end
  end
end
