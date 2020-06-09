class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  has_many :hearts, dependent: :destroy
end
