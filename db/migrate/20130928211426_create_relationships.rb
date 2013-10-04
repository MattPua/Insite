class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :company_id
      t.integer :user_id
      t.integer :interview_id
      t.timestamps
    end
    add_index :relationships, :company_id
    add_index :relationships, :user_id
    add_index :relationships, :interview_id
    add_index :relationships, [:company_id, :user_id], unique: true
    add_index :relationships, [:interview_id, :company_id], unique: true
  end
end
