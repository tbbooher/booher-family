require 'spec_helper'

describe Event do
  it "should correctly populate events" do
    User.destroy_all
    Event.destroy_all
    TimeSlot.destroy_all
    ts = FactoryGirl.create(:time_slot)
    #e = FactoryGirl.create(:event)
    ts.user.name.should eq("test tim")
    ts.user.populate_next_two_weeks
    Event.all.size.should eq(2)
  end
end
