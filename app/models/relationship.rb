class Relationship < ActiveRecord::Base
  belongs_to :company, class_name: "Company"
  belongs_to :user, class_name: "User"
  validates :company_id, presence: true
  validates :user_id, presence: true

end
