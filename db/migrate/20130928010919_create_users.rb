class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, :null =>false
      t.string :email, :null =>false
      t.integer :year, :null =>false
      t.boolean :alumni
      t.string :program, :null=>false
      t.string :faculty, :null=>false
      t.integer :phone, :limit => 12
      t.boolean :privacy, :default=>false
      t.boolean :registerterms, :default=>false
      t.boolean :admin, :default=>false
      t.timestamps
    end

    create_table :companies do |t|
      t.string :name, :null=>false
      t.string :industry
      t.string :location
      t.timestamps
    end

    create_table :interviews do |t|
      t.belongs_to :company
      t.belongs_to :user
      t.string :comment
      t.integer :user_id, :null =>false
      t.integer :company_id, :null =>false
      t.string :company_name, :null =>false
      t.string :position, :null=>false
      t.datetime :date
      t.integer :status
      t.string :interview_type
      t.timestamps  
    end
    
  end
end
