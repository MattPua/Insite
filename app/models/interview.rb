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

  def get_date
  	self.date.to_formatted_s(:date)
  end

  def is_scheduled?
  	self.date.present?
  end

end
