class Post < ApplicationRecord
  after_validation :set_slug, only: [:create, :update]
  belongs_to :user

  has_many :comments
  has_many :likes, dependent: :destroy
  has_rich_text :content

  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :title, presence: true

  def to_param
    "#{id}-#{slug}" #So in the route for the post appears its unique slug instead of its id
  end

  def set_slug
    self.slug = title.to_s.parameterize
  end
end
