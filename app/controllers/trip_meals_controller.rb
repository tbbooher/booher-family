class TripMealsController < InheritedResources::Base
  #belongs_to :trip_day
  nested_belongs_to :trip, :trip_day

  def create
    create! { trip_trip_day_path(@trip, @trip_day) }
  end

  def update
    update! { trip_trip_day_path(@trip, @trip_day) }
  end
end
