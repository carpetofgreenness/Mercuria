class AddDescriptionToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :description, :string
  end
end
