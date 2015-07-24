class Comment < ActiveRecord::Base
  belongs_to :post

  has_many :sub_comments,
           class_name: "Comment",
           foreign_key: "parent_id"

  belongs_to :parent

end
