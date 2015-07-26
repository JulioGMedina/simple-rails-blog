class Post < ActiveRecord::Base
  belongs_to :user

  has_many :comments
  has_many :sub_comments, :through => :comments

  validates :content,
            :user_id, presence: true

  def total_comment_count
    comments.size + sub_comments.size
  end
end
