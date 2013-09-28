class User < ActiveRecord::Base
  attr_accessible :email, :faculty, :name, :phone, :program, :registerterms, :year
  has_many :companies


end
