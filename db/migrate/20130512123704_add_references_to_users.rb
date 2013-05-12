class AddReferencesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :challenge_id, :integer
  end
end
