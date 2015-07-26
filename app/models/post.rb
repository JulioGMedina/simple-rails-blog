class Post < ActiveRecord::Base
  belongs_to :user
  validates :content,
            :user_id, presence: true

  has_many :comments
  has_many :sub_comments, :through => :comments


  def total_comment_count
    comments.size + sub_comments.size
  end
end
