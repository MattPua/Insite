class RemoveCompaniesfromUsers < ActiveRecord::Migration
  def up
  	remove_column :companies
  end

  def down
  end
end
