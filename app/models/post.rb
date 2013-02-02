class Post < ActiveRecord::Base
  belongs_to :user
  attr_accessible :body, :title, :user_id
  has_and_belongs_to_many :tags
end
