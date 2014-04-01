class AddIndexToActivities < ActiveRecord::Migration
  def change
    add_index :activities, [:target_id, :target_type]
    add_index :activities, :actor_id
  end
end
