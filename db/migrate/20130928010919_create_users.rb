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
      t.string :position

      t.timestamps
    end
  end
end
