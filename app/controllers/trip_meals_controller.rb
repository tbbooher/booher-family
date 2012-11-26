class TripMealsController < InheritedResources::Base
  #belongs_to :trip_day
  nested_belongs_to :trip, :trip_day
end
