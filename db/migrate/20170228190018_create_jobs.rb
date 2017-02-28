class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
    	t.integer :user_id
    	t.string :origin
    	t.string :destination
    	t.integer :cost
    	t.integer :containers, default: 0, null: false

      t.timestamps
    end
  end
end
