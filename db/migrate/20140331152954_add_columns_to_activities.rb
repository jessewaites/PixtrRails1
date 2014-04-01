class AddColumnsToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :actor_id, :integer
    add_column :activities, :target_type, :string
    add_column :activities, :target_id, :integer
  end
end