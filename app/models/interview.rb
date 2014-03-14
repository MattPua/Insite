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
  include PgSearch
  multisearchable :against =>[:company_name, :position]
	pg_search_scope :search_by_interview ,:against =>[:company_name, :position]
  # Status represents the current state of interviews. 
	# 1 represents an active interview
	# 2 represents a finished/past interview
  # 3 represents past work experience ( not yet implemented )


  attr_accessible :company_name, :position, :user_id, :company_id, :date, :status
  after_initialize :default_values
  before_save :default_date

  belongs_to :user
  belongs_to :company

  # get the date of the interview

  validates :company_name, 
    presence: true

  validates :position,
    presence: true

  def get_interviewee
    User.find(self.user_id).name
  end


  def get_date
  	self.date.to_formatted_s(:date)
  end

  # Has an interview been scheduled
  def is_scheduled?
  	self.date.present?
  end

  private
    def default_values
      self.status||=1
    end

    def default_date
      
      #date= self.date.to_s.gsub!(/([A-Z][a-z]*, [0-9]{2} [A-Z][a-z]* [0-9]{4})/,"")
      newDate=self.date.to_s.sub!(/(00:00:00)/,"").sub!(/(UTC)/,"").gsub!(/\s/,"")
      self.date=Date.parse(newDate)
    end


end
