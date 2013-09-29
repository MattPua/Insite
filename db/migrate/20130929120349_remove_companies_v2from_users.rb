class RemoveCompaniesV2fromUsers < ActiveRecord::Migration
  def up
  	remove_column :users, :companies
  end

  def down
  end
end
