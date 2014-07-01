# == Schema Information
#
# Table name: links
#
#  id         :integer          not null, primary key
#  url        :string(255)
#  post_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Link < ActiveRecord::Base
  
  belongs_to(
    :post,
    class_name: "Post",
    primary_key: :id,
    foreign_key: :post_id
  )
end
