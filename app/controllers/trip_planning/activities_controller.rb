class TripPlanning::ActivitiesController < InheritedResources::Base
  nested_belongs_to :trip, :trip_day

  def create
    create! { trip_trip_day_activities_path(@trip, @trip_day) }
  end

  def update
    update! { trip_trip_day_activities_path(@trip, @trip_day) }
  end

end
