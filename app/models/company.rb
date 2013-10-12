# == Schema Information
#
# Table name: companies
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  industry   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Company < ActiveRecord::Base
	
  attr_accessible :name, :company_id, :connections, :industry

	has_many :interviews, dependent: :destroy
	has_many :users, through: :interviews  
  # Company has many interviews
  # Company has many users through interviews



  validates :name, 
  	uniqueness: {
  		case_sensitive: false,
  	},
  	presence: true


end
