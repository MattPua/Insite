class AddCompaniestoUsers < ActiveRecord::Migration
def self.up
    change_table(:users) do |t|
      t.string :companies, :null => false, :default => ""

    end

  end

  def self.down

  end
end
