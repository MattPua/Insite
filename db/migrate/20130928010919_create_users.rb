class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :year
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

      t.timestamps
    end

    create_table :interviews do |t|
      t.belongs_to :company
      t.belongs_to :user
      t.integer :user_id
      t.integer :company_id
      t.string :company_name
      t.string :position
      t.datetime :date
      t.integer :status, :default =>1
      t.timestamps
    end
    
  end
end
