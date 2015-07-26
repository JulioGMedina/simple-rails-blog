class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  has_many :sub_comments,
           class_name: "Comment",
           foreign_key: "parent_id"

  belongs_to :parent

  validates :content,
            :post_id,
            :user_id, presence: true

end
