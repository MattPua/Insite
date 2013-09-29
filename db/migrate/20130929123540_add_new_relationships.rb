class AddNewRelationships < ActiveRecord::Migration
  def up
    change_table :relationships do |t|
      t.integer :interview_id
    end
    add_index :relationships, :interview_id
    add_index :relationships, [:user_id, :interview_id], unique: true
  end

  def down
  end
end
