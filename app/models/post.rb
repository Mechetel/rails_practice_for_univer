class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates_presence_of :title, :body
  validates :title, length: { minimum: 5 }
end
