class Post < ApplicationRecord
  after_validation :set_slug, only: [:create, :update]
  belongs_to :user

  has_many :comments

  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :body, presence: true
  validates :title, presence: true

  def to_param
    "#{id}-#{slug}"
  end

  def set_slug
    self.slug = title.to_s.parameterize
  end
end
