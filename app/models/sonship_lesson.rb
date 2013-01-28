class SonshipLesson < ActiveRecord::Base
  attr_accessible :goals, :impact, :memory_verse, :start_date, :title
  belongs_to :sonship_class
  has_many :sonship_questions
end
