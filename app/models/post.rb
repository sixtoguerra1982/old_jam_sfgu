class Post < ApplicationRecord
  has_many :comments
  belongs_to :user

  def to_s
    self.title
  end
end
