require 'spec_helper'

describe Event do
  context "when there are a bunch of events" do
    before {
      @time = 0
      [["2013-02-03 07:00:00 UTC", "2013-02-03 16:00:00 UTC"],
       ["2013-02-04 10:30:00 UTC","2013-02-04 17:30:00 UTC"],
       ["2013-02-05 10:30:00 UTC","2013-02-05 17:00:00 UTC"],
       ["2013-02-06 08:30:00 UTC","2013-02-06 14:30:00 UTC"],
       ["2013-02-07 13:15:00 UTC", "2013-02-07 21:15:00 UTC"],
       ["2013-02-08 16:30:00 UTC", "2013-02-08 20:00:00 UTC"]].each do |st, ed|
        sd, ed =  DateTime.parse(st), DateTime.parse(ed)
        FactoryGirl.create(:event, starts_at: sd, ends_at: ed)
        @time += (ed-sd)
      end
    }
    it "should calculate the time correctly" do
      Event.all.size.should == 6
      ref_date = Date.parse("2013-02-08")
      week_start = ref_date.beginning_of_week(start_day = :sunday)
      #week_end = ref_date.next_week.beginning_of_week(start_day = :sunday)
      puts "hours: #{@time*24} ***********************"
      elapsed_time = @time*24.to_f
      Event.weekly_hours(week_start).to_f.should be == elapsed_time
    end

    context "with extra events" do
      before {
        [[1,7,13],[2,8,16],[10,9,15]].each do |day, st, ed|
          FactoryGirl.create(:event, starts_at: DateTime.new(2013,2,day,st), ends_at: DateTime.new(2013,2,day,ed))
        end
      }

      it "should list all events in the week" do
        # week is from 3 to 9 feb
        # create three
        Event.all.size.should eq(9)
        Event.all_in_week(Date.parse("2013-02-04")).size.should eq(6)
      end

      it "should list the durations of events in the week" do
        Event.weekly_hours(Date.parse("2013-02-04")).should eq(40.0)
      end

      it "should not be thrown off by a non-aupair event" do
        st = DateTime.parse("2013-02-05 5:00am")
        ed = DateTime.parse("2013-02-05 9:00am")
        puts "#{st} to #{ed}"
        FactoryGirl.create(:event, event_type_id: 2, starts_at: st, ends_at: ed)
        Event.weekly_hours(Date.parse("2013-02-04")).should eq(40.0)
      end

    end

  end

  it "should have a duration" do
    e = FactoryGirl.create(:event)
    duration = e.ends_at - e.starts_at
    e.duration.should eq(duration)
  end

  it "should not allow for a negative duration" do
    e = Event.new
    e.starts_at = Time.parse("Sun, 10 Feb 2013 21:30:00 UTC +00:00")
    e.ends_at = Time.parse("Sun, 10 Feb 2013 19:30:00 UTC +00:00")
    e.title = "test event"
    e.should_not be_valid
    e.errors[:ends_at].first.should eq("end of event must be greater than start")
  end

  it "should not let an au pair work more than 10 hours a day" do
    e = Event.new
    e.starts_at = Time.parse("Sun, 10 Feb 2013 21:30:00 UTC +00:00")
    e.ends_at = Time.parse("Sun, 11 Feb 2013 19:30:00 UTC +00:00")
    e.title = "long test event"
    e.event_type_id = 1
    e.should_not be_valid
    e.errors[:ends_at].first.should eq("au pairs can not work more than 10 hours a day")
  end

  it 'au pair events can not go past mid night' do
    e = Event.new
    e.starts_at = Time.parse("Sun, 10 Feb 2013 23:30:00 UTC +00:00")
    e.ends_at = Time.parse("Sun, 11 Feb 2013 00:30:00 UTC +00:00")
    e.title = "long test event"
    e.event_type_id = 1
    e.should_not be_valid
    e.errors[:ends_at].last.should eq("au pair events can not go past mid night")
  end

end
