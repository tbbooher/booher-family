class TimeSlotsController < InheritedResources::Base
  belongs_to :user
  respond_to :html, :json
  before_filter :authenticate_user!
end
