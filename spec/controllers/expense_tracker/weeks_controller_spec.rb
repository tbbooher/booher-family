require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe ExpenseTracker::WeeksController do

  # This should return the minimal set of attributes required to create a valid
  # ExpenseTracker::Week. As you add validations to ExpenseTracker::Week, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { "start_date" => "2013-02-18" }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ExpenseTracker::WeeksController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all expense_tracker_weeks as @expense_tracker_weeks" do
      week = ExpenseTracker::Week.create! valid_attributes
      get :index, {}, valid_session
      assigns(:expense_tracker_weeks).should eq([week])
    end
  end

  describe "GET show" do
    it "assigns the requested expense_tracker_week as @expense_tracker_week" do
      week = ExpenseTracker::Week.create! valid_attributes
      get :show, {:id => week.to_param}, valid_session
      assigns(:expense_tracker_week).should eq(week)
    end
  end

  describe "GET new" do
    it "assigns a new expense_tracker_week as @expense_tracker_week" do
      get :new, {}, valid_session
      assigns(:expense_tracker_week).should be_a_new(ExpenseTracker::Week)
    end
  end

  describe "GET edit" do
    it "assigns the requested expense_tracker_week as @expense_tracker_week" do
      week = ExpenseTracker::Week.create! valid_attributes
      get :edit, {:id => week.to_param}, valid_session
      assigns(:expense_tracker_week).should eq(week)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new ExpenseTracker::Week" do
        expect {
          post :create, {:expense_tracker_week => valid_attributes}, valid_session
        }.to change(ExpenseTracker::Week, :count).by(1)
      end

      it "assigns a newly created expense_tracker_week as @expense_tracker_week" do
        post :create, {:expense_tracker_week => valid_attributes}, valid_session
        assigns(:expense_tracker_week).should be_a(ExpenseTracker::Week)
        assigns(:expense_tracker_week).should be_persisted
      end

      it "redirects to the created expense_tracker_week" do
        post :create, {:expense_tracker_week => valid_attributes}, valid_session
        response.should redirect_to(ExpenseTracker::Week.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved expense_tracker_week as @expense_tracker_week" do
        # Trigger the behavior that occurs when invalid params are submitted
        ExpenseTracker::Week.any_instance.stub(:save).and_return(false)
        post :create, {:expense_tracker_week => { "start_date" => "invalid value" }}, valid_session
        assigns(:expense_tracker_week).should be_a_new(ExpenseTracker::Week)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        ExpenseTracker::Week.any_instance.stub(:save).and_return(false)
        post :create, {:expense_tracker_week => { "start_date" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested expense_tracker_week" do
        week = ExpenseTracker::Week.create! valid_attributes
        # Assuming there are no other expense_tracker_weeks in the database, this
        # specifies that the ExpenseTracker::Week created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        ExpenseTracker::Week.any_instance.should_receive(:update_attributes).with({ "start_date" => "2013-02-18" })
        put :update, {:id => week.to_param, :expense_tracker_week => { "start_date" => "2013-02-18" }}, valid_session
      end

      it "assigns the requested expense_tracker_week as @expense_tracker_week" do
        week = ExpenseTracker::Week.create! valid_attributes
        put :update, {:id => week.to_param, :expense_tracker_week => valid_attributes}, valid_session
        assigns(:expense_tracker_week).should eq(week)
      end

      it "redirects to the expense_tracker_week" do
        week = ExpenseTracker::Week.create! valid_attributes
        put :update, {:id => week.to_param, :expense_tracker_week => valid_attributes}, valid_session
        response.should redirect_to(week)
      end
    end

    describe "with invalid params" do
      it "assigns the expense_tracker_week as @expense_tracker_week" do
        week = ExpenseTracker::Week.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        ExpenseTracker::Week.any_instance.stub(:save).and_return(false)
        put :update, {:id => week.to_param, :expense_tracker_week => { "start_date" => "invalid value" }}, valid_session
        assigns(:expense_tracker_week).should eq(week)
      end

      it "re-renders the 'edit' template" do
        week = ExpenseTracker::Week.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        ExpenseTracker::Week.any_instance.stub(:save).and_return(false)
        put :update, {:id => week.to_param, :expense_tracker_week => { "start_date" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested expense_tracker_week" do
      week = ExpenseTracker::Week.create! valid_attributes
      expect {
        delete :destroy, {:id => week.to_param}, valid_session
      }.to change(ExpenseTracker::Week, :count).by(-1)
    end

    it "redirects to the expense_tracker_weeks list" do
      week = ExpenseTracker::Week.create! valid_attributes
      delete :destroy, {:id => week.to_param}, valid_session
      response.should redirect_to(expense_tracker_weeks_url)
    end
  end

end
