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

require 'spec_helper'

describe Relationship do
  pending "add some examples to (or delete) #{__FILE__}"
end
