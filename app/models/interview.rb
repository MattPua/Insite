# == Schema Information
#
# Table name: interviews
#
#  id           :integer          not null, primary key
#  company_id   :integer
#  user_id      :integer
#  company_name :string(255)
#  position     :string(255)
#  date         :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Interview < ActiveRecord::Base
  attr_accessible :company_name, :position, :user_id, :company_id, :date
  
  belongs_to :user
  belongs_to :company

  # Need to place in date time variable for when the interview is

  #has_many 	 :relationships, foreign_key:"interview_id", dependent: :destroy
end
