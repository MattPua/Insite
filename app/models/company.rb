# == Schema Information
#
# Table name: companies
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  connections :integer
#  industry    :string(255)
#

class Company < ActiveRecord::Base
	after_initialize :default_values
  attr_accessible :name, :company_id, :connections, :industry

  has_many :users, through: :relationships, source: :user
  has_many :relationships, foreign_key: "company_id", dependent: :destroy

  validates :name, 
  	uniqueness: {
  		case_sensitive: false,
  	},
  	presence: true

  	private
  		def default_values
  			self.connections=0
  		end
end
