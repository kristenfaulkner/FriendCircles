# == Schema Information
#
# Table name: circles
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#  owner_id   :integer
#

require 'test_helper'

class CircleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
