# == Schema Information
#
# Table name: interview_relationships
#
#  id           :integer          not null, primary key
#  interview_id :integer
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class InterviewRelationship < ActiveRecord::Base
  attr_accessible :interview_id, :user_id
  belongs_to :user
  belongs_to :interview
  validates :user_id, presence: true
  validates :interview_id, presence: true
end
