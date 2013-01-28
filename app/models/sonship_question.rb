class SonshipQuestion < ActiveRecord::Base
  attr_accessible :answer, :question, :sonship_lesson_id
  belongs_to :sonship_lesson

end
