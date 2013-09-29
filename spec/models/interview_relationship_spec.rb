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

require 'spec_helper'

describe InterviewRelationship do
  pending "add some examples to (or delete) #{__FILE__}"
end
