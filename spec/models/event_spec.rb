require 'spec_helper'

describe Event do
  it "should calculate the time correctly" do
    time = 0
    [["2013-02-01 07:00:00 UTC", "2013-02-01 16:00:00 UTC"],
    ["2013-01-29 10:30:00 UTC","2013-01-29 17:30:00 UTC"],
    ["2013-01-28 10:30:00 UTC","2013-01-28 17:00:00 UTC"],
    ["2013-02-02 08:30:00 UTC","2013-02-02 14:30:00 UTC"],
    ["2013-01-30 13:15:00 UTC", "2013-01-30 21:15:00 UTC"],
    ["2013-01-27 16:30:00 UTC", "2013-01-27 20:00:00 UTC"]].each do |st, ed|
      sd, ed =  DateTime.parse(st), DateTime.parse(ed)
      FactoryGirl.create(:event, starts_at: sd, ends_at: ed)
      time += (ed-sd)
    end
    Event.all.size.should == 6
    ref_date = Date.parse("2013-01-28")
    week_start = ref_date.beginning_of_week(start_day = :sunday)
    week_end = ref_date.next_week.beginning_of_week(start_day = :sunday)
    puts "hours: #{time*24} ***********************"
    elapsed_time = time*24*60*60.to_f
    Event.seconds_worked(week_start, week_end).to_f.should be == elapsed_time
  end
end
