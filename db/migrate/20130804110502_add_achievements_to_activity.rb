class AddAchievementsToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :achievements, :int
  end
end
