class Interview < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :user
  
  has_many :relationships, foreign_key: "user_id", dependent: :destroy
 
end
