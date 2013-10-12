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
#  status       :integer          default(1)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Interview < ActiveRecord::Base
	# Status represents the current state of interviews. 
	# 1 represents an active interview
	# 2 represents a finished interview/ or if a user has previously interviewed/worked at a company


  attr_accessible :company_name, :position, :user_id, :company_id, :date, :status
  
  belongs_to :user
  belongs_to :company

  # get the date of the interview
  def get_date
  	self.date.to_formatted_s(:date)
  end

  # Has an interview been scheduled
  def is_scheduled?
  	self.date.present?
  end

end
