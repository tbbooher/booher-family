class CalendarController < ApplicationController

  before_filter :find_month, only: [:index, :populate, :empty_out_month]
  before_filter :authenticate_user!

  def index
    @year = @inspection_date.year
    @month = @inspection_date.month - 1
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

  def populate
    Event.populate_next_two_weeks
    redirect_to calendar_display_path(@month_string)
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
    week_end = week_start.end_of_week(start_day = :sunday)
    render json: {hours: Event.seconds_worked(week_start, week_end)/(60*60), week_start: week_start, week_end: week_end}
  end

end
