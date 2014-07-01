# == Schema Information
#
# Table name: circle_memberships
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  circle_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

class CircleMembership < ActiveRecord::Base
  validates :circle, :user_id, presence: true
  
  belongs_to( 
    :user,
    class_name: "User",
    primary_key: :id,
    foreign_key: :user_id
  )
  
  belongs_to( 
    :circle,
    class_name: "Circle",
    primary_key: :id,
    foreign_key: :circle_id
  )
end
