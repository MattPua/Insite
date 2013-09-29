class Relationship < ActiveRecord::Base
  belongs_to :company
  belongs_to :user
  validates :company_id, presence: true
  validates :user_id, presence: true


  belongs_to :interview
  validates	:interview_id, presence: true 
end
