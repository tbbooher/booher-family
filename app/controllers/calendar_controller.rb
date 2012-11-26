class CalendarController < ApplicationController

  before_filter :find_user_and_month, only: [:index, :populate, :empty_out_month]
  before_filter :authenticate_user!

  def index
    @year = @inspection_date.year
    @month = @inspection_date.month - 1
  end

  def serve_events
    user_id = params[:user_id]
    @events = Event.where(user_id: user_id).scoped
    @events = @events.after(params['start'], user_id) if (params['start'])
    @events = @events.before(params['end'], user_id) if (params['end'])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
      format.js {render json: @events}
    end
  end

  def populate
    month = @inspection_date.month
    year = @inspection_date.year
    TimeSlot.where(user_id: @user_id).each do |ts|
      (@inspection_date.beginning_of_month.day..@inspection_date.end_of_month.day).to_a.each do |day|
        starts_at = Time.local(year,month,day,ts.starts_at.hour,ts.starts_at.min,0)
        if Event.date_match(ts,starts_at.strftime('%A')) && Event.does_not_exist(ts.id,starts_at)
          e = Event.new
          e.starts_at = Time.local(year,month,day, ts.starts_at.hour, ts.starts_at.min)
          e.ends_at = Time.local(year,month,day, ts.ends_at.hour, ts.ends_at.min)
          e.time_slot_id = ts.id
          e.user_id = @user_id
          e.event_type = ts.event_type
          e.title = ts.title.blank? ? "no title" : ts.title
          e.save!
        end
      end
    end
    #   match "calendar/index(/:user_id/month/:month_string)" => "calendar#index", as: :calendar_display
    redirect_to calendar_display_path(@user_id, @month_string)
  end

  def empty_out_month
    Event.destroy_all_in_month(@month_string, @user_id)
    redirect_to calendar_display_path(@user_id, @month_string)
  end

  def work_history
    @user = current_user
    @start_date = @user.events.first.starts_at
    @date = @start_date.beginning_of_week
    @today = Date.today()
  end

  def find_user_and_month
    unless @user_id = params[:user_id]
      @user_id = User.first.id
    end
    @month_string = params[:month_string] || Date.today.to_s(:for_cal)
    @inspection_date = Date.parse("1-#{@month_string}")
  end

end
