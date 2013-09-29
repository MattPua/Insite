# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string(255)
#  email                  :string(255)
#  year                   :integer
#  program                :string(255)
#  faculty                :string(255)
#  phone                  :integer
#  registerterms          :boolean
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :company_id
  attr_accessible :faculty, :name, :phone, :program, :registerterms, :year, :position
 
  has_many :relationships, foreign_key: "user_id", dependent: :destroy 

  has_many :companies, through: :relationships, source: :company
  

  has_many  :interviews, through: :interview_relationships, source: :interview
  has_many  :interview_relationships, foreign_key: "interview_id", dependent: :destroy

 # validates :name, #:uniqueness => true,
 #    uniqueness: true,
 #    presence: true,
 #    length: { 
 #      maximum: 100, 
 #      minimum: 2,
 #      message: " must be a minimum: 2 letters and a maximum: 100 letters"},
 #    format: {
 #      with: /[\w\-\']+([\s]+[\w\-\']+){1}+/,
 #      message: "entered must be first and last name"
 #    }

  
 #  validates :email,
 #    uniqueness: {
 #      case_sensitive: false,
 #    },
 #    presence: true,
 #    format: {
 #      with: /^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$/i,
 #    }

 #  validates_presence_of :encrypted_password

 #  validates :phone,
 #    :allow_blank => true,
 #    length: {
 #      minimum: 10,
 #      maximum: 12,
 #      too_short:"must have %{count} numbers at minimum",
 #      too_long:"must have %{count} numbers at maximum"
 #    },
 #    format:{
 #      with:/\A[0-9]{3}-?[0-9]{3}-?[0-9]{4}\Z/,
 #      message:"Please enter your 10 digit phone number"
 #    }

def self.search(search)
  @user = User.find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
end

def works_for?(other_company)
	relationships.find_by_company_id(other_company.id)
end

def works_at!(other_company)
	relationships.create!(company_id: other_company.id)
  #relationships.save(:validate => false)
end 

def fired!(other_company)
  relationships.find_by_company_id(other_company.id).destroy!
end

def has_interview?(interview)
  interview_relationships.find_by_interview_id(interview.id)
end

def interviewing_with!(interview)
  interview_relationships.create!(interview: interview.id)
end

def finished_interview!(interview)
  interview_relationships.find_by_interview_id(interview.id).destroy!
end

end
