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

class Post < ActiveRecord::Base
  
  belongs_to(
    :user,
    class_name: "User",
    primary_key: :id,
    foreign_key: :owner_id
  )
  
  has_many(
     :shares,
     class_name: "Share",
     primary_key: :id,
     foreign_key: :post_id
  )
    
  has_many( 
    :links,
    class_name: "Link",
    primary_key: :id,
    foreign_key: :post_id
  )
  
  has_many(
    :circles, 
    through: :shares, 
    source: :circle
  )
end
