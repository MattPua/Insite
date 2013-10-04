# == Schema Information
#
# Table name: interviews
#
#  id           :integer          not null, primary key
#  company_name :string(255)
#  position     :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Interview < ActiveRecord::Base
  attr_accessible :company_name, :position

  belongs_to :user
  belongs_to :company
  has_many 	 :relationships, foreign_key:"interview_id", dependent: :destroy
end
