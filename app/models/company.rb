# == Schema Information
#
# Table name: companies
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  industry   :string(255)
#  location   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Company < ActiveRecord::Base
  include PgSearch
  multisearchable :against => [:name,:industry]
  pg_search_scope :search_by_company, :against=>[:name,:industry]
	
  attr_accessible :name, :company_id, :connections, :industry

	has_many :interviews, dependent: :destroy
	has_many :users, through: :interviews  
  # Company has many interviews
  # Company has many users through interviews

  # Get active and most recent interviews
  def latest_interviews
    self.interviews.order("DATE DESC").where(:status=>1)
  end

  def past_interviews
    self.interviews.order("DATE DESC").where(:status=>2)
  end

  def employees
    self.interviews.order("DATE DESC").where(:status=>3)
  end



  validates :name, 
  	uniqueness: {
  		case_sensitive: false,
  	},
  	presence: true


end



