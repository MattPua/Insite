class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :faculty, :name, :phone, :program, :registerterms, :year, :position


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


end
