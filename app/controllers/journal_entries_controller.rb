class JournalEntriesController < InheritedResources::Base

  before_filter :only_tim
  respond_to :js, :html, :json

  def new
    @journal_entry = JournalEntry.new
    @last_entry = JournalEntry.last
    if @last_entry
      @journal_entry.memory_verse = @last_entry.memory_verse
      # @journal_entry.to_do = @last_entry.to_do
      @journal_entry.friends = @last_entry.friends
      @journal_entry.at_work = @last_entry.at_work
      @journal_entry.at_home_pc = @last_entry.at_home_pc
      @journal_entry.at_home = @last_entry.at_home
      @journal_entry.at_work = @last_entry.at_work
      @journal_entry.blog_post_ideas = @last_entry.blog_post_ideas
      @journal_entry.someday_maybe = @last_entry.someday_maybe
      @journal_entry.networking = @last_entry.networking
      @journal_entry.consulting = @last_entry.consulting
      @journal_entry.to_read = @last_entry.to_read
      @journal_entry.goals = @last_entry.goals
    end
    new!
  end

  def index
    @journal_entries = JournalEntry.order("entry_date desc").page(params[:page])
    index!
  end

  def create
    create! do |format|
      format.html { redirect_to journal_entries_path }
      format.js { render :json => @journal_entry.map(&:attributes) }
    end
  end

  def update
    update! { journal_entries_path }
  end

  def data
    d = Date.new(0,1,1)-1
    months = params[:months].to_i
    respond_to do |format|
      format.json {render json: JournalEntry.build_stairs(months).to_json}
      #format.csv {render csv: 'foo'}
      format.text  { render :text => JournalEntry.all.map{|j| "#{(j.entry_date - d).to_i} #{j.fitness ? j.fitness : "NaN"} #{j.purity ? j.purity : "NaN"} #{j.chrissy ? j.chrissy : "NaN"}" }.join(";") }
    end

  end

  def report
    @months = (params[:months].nil? ? 2 : params[:months]).to_i
  end

  def month_data
    #params[:month_string] = Time.local(2013, 11,1).strftime("%b-%g") if params[:month_string] == "undefined"
    render json: JournalEntry.monthly_report(params[:month_string]).to_json(only: [:entry_date, :purity, :fitness, :chrissy, :devotional])
  end

  def month_report
    @month_string = params[:month_string]
  end

  def form_update
    # only requested via json
    # just a json response -- no redirect
    JournalEntry.find(params[:id]).update_attributes(params[:journal_entry])
    head :no_content
  end

  def calendar_report
    @events = JournalEntry.all
    month = params[:month]
    year = params[:year]
    params[:month_string] = Time.local(year, month, 1).strftime('%b-%Y') if month && year
    @month_string = params[:month_string].nil? ? Date.today.strftime('%b-%Y') : params[:month_string]
  end

  def only_tim
    unless current_user && current_user.id == 1
      redirect_to root_url, :alert => "Access denied."
    end
  end

end
