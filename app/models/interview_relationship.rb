class InterviewRelationship < ActiveRecord::Base
  attr_accessible :interview_id, :user_id
  belongs_to :user
  belongs_to :interview
  validates :user_id, presence: true
  validates :interview_id, presence: true
end
