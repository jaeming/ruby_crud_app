class Post < ActiveRecord::Base
  validates :title, presence: true, uniqueness: {case_insensitive: true}
  validates :body, presence: true
end