class EventsController < InheritedResources::Base
  respond_to :html, :json
  belongs_to :user
  has_scope :page, :default => 1
  before_filter :authenticate_user!
end
