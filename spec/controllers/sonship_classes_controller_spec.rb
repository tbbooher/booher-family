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

describe SonshipClassesController do

  # This should return the minimal set of attributes required to create a valid
  # SonshipClass. As you add validations to SonshipClass, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { "start_date" => "2013-01-28" }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SonshipClassesController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all sonship_classes as @sonship_classes" do
      sonship_class = SonshipClass.create! valid_attributes
      get :index, {}, valid_session
      assigns(:sonship_classes).should eq([sonship_class])
    end
  end

  describe "GET show" do
    it "assigns the requested sonship_class as @sonship_class" do
      sonship_class = SonshipClass.create! valid_attributes
      get :show, {:id => sonship_class.to_param}, valid_session
      assigns(:sonship_class).should eq(sonship_class)
    end
  end

  describe "GET new" do
    it "assigns a new sonship_class as @sonship_class" do
      get :new, {}, valid_session
      assigns(:sonship_class).should be_a_new(SonshipClass)
    end
  end

  describe "GET edit" do
    it "assigns the requested sonship_class as @sonship_class" do
      sonship_class = SonshipClass.create! valid_attributes
      get :edit, {:id => sonship_class.to_param}, valid_session
      assigns(:sonship_class).should eq(sonship_class)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new SonshipClass" do
        expect {
          post :create, {:sonship_class => valid_attributes}, valid_session
        }.to change(SonshipClass, :count).by(1)
      end

      it "assigns a newly created sonship_class as @sonship_class" do
        post :create, {:sonship_class => valid_attributes}, valid_session
        assigns(:sonship_class).should be_a(SonshipClass)
        assigns(:sonship_class).should be_persisted
      end

      it "redirects to the created sonship_class" do
        post :create, {:sonship_class => valid_attributes}, valid_session
        response.should redirect_to(SonshipClass.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved sonship_class as @sonship_class" do
        # Trigger the behavior that occurs when invalid params are submitted
        SonshipClass.any_instance.stub(:save).and_return(false)
        post :create, {:sonship_class => { "start_date" => "invalid value" }}, valid_session
        assigns(:sonship_class).should be_a_new(SonshipClass)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        SonshipClass.any_instance.stub(:save).and_return(false)
        post :create, {:sonship_class => { "start_date" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested sonship_class" do
        sonship_class = SonshipClass.create! valid_attributes
        # Assuming there are no other sonship_classes in the database, this
        # specifies that the SonshipClass created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        SonshipClass.any_instance.should_receive(:update_attributes).with({ "start_date" => "2013-01-28" })
        put :update, {:id => sonship_class.to_param, :sonship_class => { "start_date" => "2013-01-28" }}, valid_session
      end

      it "assigns the requested sonship_class as @sonship_class" do
        sonship_class = SonshipClass.create! valid_attributes
        put :update, {:id => sonship_class.to_param, :sonship_class => valid_attributes}, valid_session
        assigns(:sonship_class).should eq(sonship_class)
      end

      it "redirects to the sonship_class" do
        sonship_class = SonshipClass.create! valid_attributes
        put :update, {:id => sonship_class.to_param, :sonship_class => valid_attributes}, valid_session
        response.should redirect_to(sonship_class)
      end
    end

    describe "with invalid params" do
      it "assigns the sonship_class as @sonship_class" do
        sonship_class = SonshipClass.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        SonshipClass.any_instance.stub(:save).and_return(false)
        put :update, {:id => sonship_class.to_param, :sonship_class => { "start_date" => "invalid value" }}, valid_session
        assigns(:sonship_class).should eq(sonship_class)
      end

      it "re-renders the 'edit' template" do
        sonship_class = SonshipClass.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        SonshipClass.any_instance.stub(:save).and_return(false)
        put :update, {:id => sonship_class.to_param, :sonship_class => { "start_date" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested sonship_class" do
      sonship_class = SonshipClass.create! valid_attributes
      expect {
        delete :destroy, {:id => sonship_class.to_param}, valid_session
      }.to change(SonshipClass, :count).by(-1)
    end

    it "redirects to the sonship_classes list" do
      sonship_class = SonshipClass.create! valid_attributes
      delete :destroy, {:id => sonship_class.to_param}, valid_session
      response.should redirect_to(sonship_classes_url)
    end
  end

end
