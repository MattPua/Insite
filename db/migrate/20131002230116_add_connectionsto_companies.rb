class AddConnectionstoCompanies < ActiveRecord::Migration
def self.up
    change_table(:companies) do |t|
      t.integer :connections, :default => 0
      t.string :industry
    end

  end

  def self.down

  end
end

