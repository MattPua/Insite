class CreateInterviewRelationships < ActiveRecord::Migration
  def change
    create_table :interview_relationships do |t|
      t.integer :interview_id
      t.integer :user_id

      t.timestamps
    end
    add_index :interview_relationships, :interview_id
    add_index :interview_relationships, :user_id
    add_index :interview_relationships, [:user_id, :interview_id], unique: true
  end
end
