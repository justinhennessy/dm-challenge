class RemoveValueFromActivities < ActiveRecord::Migration
  def change
    remove_column :activities, :value, :integer
  end
end
