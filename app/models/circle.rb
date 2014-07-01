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

class Circle < ActiveRecord::Base
  validates :owner_id, presence: true
  
  belongs_to(
    :owner,
    class_name: "User",
    primary_key: :id,
    foreign_key: :owner_id
  )
  
  has_many(
    :circle_memberships,
    class_name: "CircleMembership",
    primary_key: :id,
    foreign_key: :circle_id,
    inverse_of: :circle
  )
  
  has_many(
    :users, 
    through: :circle_memberships, 
    source: :user
  )

  
  has_many(
    :shares, 
    class_name: "Share", 
    primary_key: :id, 
    foreign_key: :circle_id
  )
  
  has_many( 
    :posts, 
    through: :shares, 
    source: :post
  )
  
end
