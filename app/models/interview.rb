class Interview < ActiveRecord::Base
  attr_accessible :company_name, :position

  belongs_to :user
  has_many 	 :interview_relationships, foreign_key:"interview_id", dependent: :destroy
end
