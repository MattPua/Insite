class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :year
      t.boolean :alumni
      t.string :program
      t.string :faculty
      t.integer :phone
      t.boolean :registerterms
      t.boolean :admin, :default => false
      t.timestamps
    end

    create_table :companies do |t|
      t.string :name
      t.string :industry
      t.string :location
      t.timestamps
    end

    create_table :interviews do |t|
      t.belongs_to :company
      t.belongs_to :user
      t.string :comment
      t.integer :user_id
      t.integer :company_id
      t.string :company_name
      t.string :position
      t.datetime :date
      t.integer :status
      t.string :interview_type
      t.timestamps  
    end
    
  end
end
