class EventsController < InheritedResources::Base
  respond_to :html, :json
  has_scope :page, :default => 1
  before_filter :authenticate_user!

  def create
    create! { calendar_display_path(Date.today.to_s(:for_cal)) }
  end

  #def update
  #  create! { calendar_display_path(Date.today.to_s(:for_cal)) }
  #end

  def destroy
    destroy! { calendar_display_path(Date.today.to_s(:for_cal)) }
  end
end
