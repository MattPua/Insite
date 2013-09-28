class User < ActiveRecord::Base
  attr_accessible :email, :faculty, :name, :phone, :program, :registerterms, :year, :position
  has_many :companies


end
