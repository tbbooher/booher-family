class JournalEntriesController < InheritedResources::Base

  before_filter :only_tim
  respond_to :js, :html, :json

  def new
    @journal_entry = JournalEntry.new
    @last_entry = JournalEntry.last
    @journal_entry.to_do = @last_entry.to_do if @last_entry
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
    respond_to do |format|
      format.json {render json: JournalEntry.smooth_results.to_json}
      format.csv {render csv: 'foo'}
      format.text  { render :text => JournalEntry.all.map{|j| "#{(j.entry_date - d).to_i} #{j.fitness ? j.fitness : "NaN"} #{j.purity ? j.purity : "NaN"} #{j.chrissy ? j.chrissy : "NaN"}" }.join(";") }
    end

  end

  def report

  end

  def form_update
    # only requested via json
    # just a json response -- no redirect
    JournalEntry.find(params[:id]).update_attributes(params[:journal_entry])
    head :no_content
  end

  def only_tim
    unless current_user && current_user.id == 1
      redirect_to root_url, :alert => "Access denied."
    end
  end

end
