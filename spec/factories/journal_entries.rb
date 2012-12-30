# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :journal_entry do
    entry_date "2012-12-28"
    description "MyString"
    purity 1
    lack_of_discipline false
    fitness 1
    devotional 1
    chrissy 1
    relational 1
    discipline 1
    facepicking 1
    stress 1
    sick false
    flossed false
    workout false
    health_statement "MyString"
    to_do "MyString"
    memory_verse "MyString"
    friends_in_focus "MyString"
    problem_of_the_day "MyString"
    problem_attempted false
    problem_solved false
  end
end
