class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :faculty, :name, :phone, :program, :registerterms, :year, :position
  
  validates :name,
  	presence: true,
  	uniqueness: true

  validates :email,
  	presence: true,
  	uniqueness: true

  validates :password,
  	length: {
  		in: 2..20
  	},
  	presence: true





end
