class AddFieldsToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :distance, :int
  end
end
