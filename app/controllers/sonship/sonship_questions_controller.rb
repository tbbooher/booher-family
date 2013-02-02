class Sonship::SonshipQuestionsController < InheritedResources::Base
  belongs_to :sonship_lesson

  def update
    update!{ sonship_lesson_sonship_questions_path(@sonship_lesson) }
  end

  def create
    create! { sonship_lesson_sonship_questions_path(@sonship_lesson) }
  end
end
