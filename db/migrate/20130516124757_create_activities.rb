class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.date :date
      t.integer :value
      t.references :user, index: true

      t.timestamps
    end
  end
end
