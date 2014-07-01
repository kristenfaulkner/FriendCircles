# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  owner_id   :integer
#  created_at :datetime
#  updated_at :datetime
#  name       :string(255)
#

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
