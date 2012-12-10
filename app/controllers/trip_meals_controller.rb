class TripMealsController < InheritedResources::Base
  #belongs_to :trip_day
  nested_belongs_to :trip, :trip_day

  def create
    create! { trip_trip_day_trip_meals_path(@trip, @trip_day) }
  end
end
