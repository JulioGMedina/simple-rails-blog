class Post < ActiveRecord::Base
  belongs_to :user
  validates :content,
            :user_id, presence: true

  has_many :comments
end
