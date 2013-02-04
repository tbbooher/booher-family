class CalendarController < ApplicationController

  before_filter :find_month, only: [:index, :populate, :empty_out_month]
  before_filter :authenticate_user!

  def index
    @year = @inspection_date.year
    @month = @inspection_date.month - 1
    week_start = Date.today.beginning_of_week(start_day = :sunday)
    week_end = Date.today.next_week(day = :sunday).beginning_of_week(start_day = :sunday)
    worked = Event.seconds_worked(week_start, week_end)/(60*60)
    @time_worked = "#{worked} hours for week starting #{week_start.to_s}"
  end

  def serve_events
    @events = Event.scoped
    @events = @events.after(params['start']) if (params['start'])
    @events = @events.before(params['end']) if (params['end'])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
      format.js {render json: @events}
    end
  end

  #def populate
  #  Event.populate_next_two_weeks
  #  redirect_to calendar_display_path(@month_string)
  #end

  def add_week
    w = params[:week_build]
    events_added = 0
    %w{sunday monday tuesday wednesday thursday friday saturday}.each_with_index do |weekday, index|
      s = w["#{weekday}_start"]
      e = w["#{weekday}_stop"]
      unless s.nil? || e.nil? || s.empty? || e.empty?
        #begin
          start = Chronic.parse(s)
          stop = Chronic.parse(e)
          st = Date.parse(w['week_start']) + index.days
          starts_at = DateTime.new(st.year, st.month, st.day, start.hour, start.min)
          ends_at = DateTime.new(st.year, st.month, st.day, stop.hour, stop.min)
          Event.create! title: 'Vivi Works', starts_at: starts_at, ends_at: ends_at, event_type_id: 1, description: 'vivi work time'
        #rescue
          events_added = events_added + 1
        #end
      end
    end
    flash[:notice] = "#{events_added} events added"
    redirect_to calendar_display_path
  end

  def empty_out_month
    Event.destroy_all_in_month(@month_string)
    redirect_to calendar_display_path(@month_string)
  end

  def work_history
    @start_date = Event.aupair.first.starts_at
    @date = @start_date.beginning_of_week
    @today = Date.today()
  end

  def find_month
    @month_string = params[:month_string] || Date.today.to_s(:for_cal)
    @inspection_date = Date.parse("1-#{@month_string}")
  end

  def weekly_hours
    week_start = Date.parse(params[:week_start]).beginning_of_week(start_day = :sunday)
    week_end = week_start.next_week(day = :sunday).beginning_of_week(start_day = :sunday)
    render json: {hours: Event.seconds_worked(week_start, week_end)/(60*60), week_start: week_start, week_end: week_end}
  end

  def build_week

  end

  def find_duration
    start_time = Chronic.parse(params[:start_time])
    end_time = Chronic.parse(params[:end_time])
    st = start_time.hour*60*60 + start_time.min*60
    ed = end_time.hour*60*60 + end_time.min*60
    if ed < st
      message = "The end time must be after the start time"
    elsif (ed - st) > (10*60*60)
      message = "Au pairs can not work more than 10 hours"
      duration = ChronicDuration.output(ed - st, format: :short)
    else
      duration = ChronicDuration.output(ed - st, format: :short)
      message = nil
    end
    render json: {duration: duration, message: message}
  end

end
