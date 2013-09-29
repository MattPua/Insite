class Interview < ActiveRecord::Base
  attr_accessible :company_name, :position

  belongs_to :user
  has_many :relationships, foreign_key:"interview_id", dependent: :destroy
end
