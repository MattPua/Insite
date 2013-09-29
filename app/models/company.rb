class Company < ActiveRecord::Base
  attr_accessible :name
  attr_accessible :company_id

  has_many :users, through: :relationships, source: :user
  has_many :relationships, foreign_key: "company_id", dependent: :destroy
end
