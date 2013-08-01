class AddFieldToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :ascent, :int
  end
end
