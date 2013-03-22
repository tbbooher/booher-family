# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :journal_entry do
    entry_date "2012-12-28"
    description "MyString"
    purity {(rand*4).round + 1}
    lack_of_discipline false
    fitness {(rand*4).round + 1}
    devotional {(rand*4).round + 1}
    chrissy {(rand*4).round + 1}
    relational {(rand*4).round + 1}
    discipline {(rand*4).round + 1}
    facepicking {(rand*4).round + 1}
    stress {(rand*4).round + 1}
    sick {rand > 0.5 ? false : true}
    flossed {rand > 0.5 ? false : true}
    workout {rand > 0.5 ? false : true}
    health_statement "MyString"
    to_do "MyString"
    memory_verse "MyString"
    friends_in_focus "MyString"
    problem_of_the_day "MyString"
    problem_attempted {rand > 0.5 ? false : true}
    problem_solved {rand > 0.5 ? false : true}
  end
end
