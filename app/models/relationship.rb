# == Schema Information
#
# Table name: relationships
#
#  id           :integer          not null, primary key
#  company_id   :integer
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  interview_id :integer
#

class Relationship < ActiveRecord::Base
  belongs_to :company
  belongs_to :user
  belongs_to :interview
  validates :company_id, presence: true
  validates :user_id, presence: true
  validates :interview_id, presence: true
  # Do i need to Validate their presence?

end
