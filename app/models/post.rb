class Post < ApplicationRecord
  belongs_to :user

  has_many :comments

  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :body, presence: true
  validates :title, presence: true
end
