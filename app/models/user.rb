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
#  position               :string(255)
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
  before_save { self.email = email.downcase }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :company_id
  attr_accessible :faculty, :name, :phone, :program, :registerterms, :year, :position
 
  # A user has many interviews, and the interviews are dependent on the user (if the user is destroyed, the interviews are destroyed)
  has_many :interviews, dependent: :destroy
  # A user has many companies through interviews
  has_many :companies, through: :interviews
  accepts_nested_attributes_for :companies, :interviews
  # Lets companies be created from users view

 validates :name,
    uniqueness: true, #Might need to not enable this, all dem asians.
    presence: true,
    length: { 
      maximum: 100, 
      minimum: 2,
      message: " must be a minimum: 2 letters and a maximum: 100 letters"},
    format: {
      with: /[\w\-\']+([\s]+[\w\-\']+){1}+/,
      message: "entered must be first and last name"
    }
  
   validates :email,
     uniqueness: {
       case_sensitive: false,
     },
     presence: true,
     format: {
      # only make @utoronto or @mail.utoronto emails valid
       with: /^[_a-z0-9-]+(\.[_a-z0-9-]+)*@(mail.)?(utoronto)(\.[a-z0-9-]+)*(\.[a-z]{2,4})$/i,
     }

   validates_presence_of :encrypted_password

  validates :phone,
    :allow_blank => true,
    length: {
      minimum: 10,
      maximum: 12,
      too_short:"must have %{count} numbers at minimum",
      too_long:"must have %{count} numbers at maximum"
    },
    format:{
      with:/\A[0-9]{3}-?[0-9]{3}-?[0-9]{4}\Z/,
      message:"Please enter your 10 digit phone number"
    }

def self.search(search)
  @user = User.find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
end

# Get the next active interview
def next_interview
  self.interviews.where(:status=>1).order("date").first
end

# Does the user has active interviews
def has_active_interview?
  self.interviews.where(:status=>1).present?
end

# does the user have any finished/archived interviews
def has_finished_interview?
  self.interviews.where(:status=>2).present?
end

# Grab all the active interviews
def active_interviews
  self.interviews.where(:status=>1).order("date")
end

def finished_interviews
  self.interviews.where(:status=>2).order("date")
end

def has_work_experience?
  self.interviews.where(:status=>3).present?
end

def work_experiences
  self.interviews.where(:status=>3).order("date")
end


end
