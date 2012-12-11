# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :location do
    name "Tipp City Ohio"
    #latitude "31.22"
    #longitude "72.22"
    description "The coolest place on earth"
    address "1050 Wilderness Bluff, Tipp City, OH 45371"
    gmaps true
  end
end
