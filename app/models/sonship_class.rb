class SonshipClass < ActiveRecord::Base
  attr_accessible :start_date, :user_id
  has_many :sonship_lessons
  belongs_to :user

end
