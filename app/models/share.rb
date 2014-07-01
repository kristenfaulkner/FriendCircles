# == Schema Information
#
# Table name: shares
#
#  id         :integer          not null, primary key
#  post_id    :integer
#  circle_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

class Share < ActiveRecord::Base
  
  belongs_to(
     :circle,
     class_name: "Circle",
     primary_key: :id,
     foreign_key: :circle_id
   )
   
  belongs_to(
    :post,
    class_name: "Post",
    primary_key: :id,
    foreign_key: :post_id
  )
end