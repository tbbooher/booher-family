class JournalEntry < ActiveRecord::Base
  attr_accessible :chrissy, :description, :devotional, :discipline, :entry_date, :facepicking, :fitness, :flossed, :friends_in_focus, :health_statement, :lack_of_discipline, :memory_verse, :problem_attempted, :problem_of_the_day, :problem_solved, :purity, :relational, :sick, :stress, :to_do, :workout
  # require entry_date

end
