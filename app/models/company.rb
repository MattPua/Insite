class Company < ActiveRecord::Base
  attr_accessible :name
  attr_accessible :company_id

  has_many :users
  has_many :relationships, foreign_key: "user_id", dependent: :destroy
end
