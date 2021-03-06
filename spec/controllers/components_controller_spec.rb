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

describe ComponentsController do

  # This should return the minimal set of attributes required to create a valid
  # Component. As you add validations to Component, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { "length_in_inches" => "9.99" }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ComponentsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all components as @components" do
      component = Component.create! valid_attributes
      get :index, {}, valid_session
      assigns(:components).should eq([component])
    end
  end

  describe "GET show" do
    it "assigns the requested component as @component" do
      component = Component.create! valid_attributes
      get :show, {:id => component.to_param}, valid_session
      assigns(:component).should eq(component)
    end
  end

  describe "GET new" do
    it "assigns a new component as @component" do
      get :new, {}, valid_session
      assigns(:component).should be_a_new(Component)
    end
  end

  describe "GET edit" do
    it "assigns the requested component as @component" do
      component = Component.create! valid_attributes
      get :edit, {:id => component.to_param}, valid_session
      assigns(:component).should eq(component)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Component" do
        expect {
          post :create, {:component => valid_attributes}, valid_session
        }.to change(Component, :count).by(1)
      end

      it "assigns a newly created component as @component" do
        post :create, {:component => valid_attributes}, valid_session
        assigns(:component).should be_a(Component)
        assigns(:component).should be_persisted
      end

      it "redirects to the created component" do
        post :create, {:component => valid_attributes}, valid_session
        response.should redirect_to(Component.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved component as @component" do
        # Trigger the behavior that occurs when invalid params are submitted
        Component.any_instance.stub(:save).and_return(false)
        post :create, {:component => { "length_in_inches" => "invalid value" }}, valid_session
        assigns(:component).should be_a_new(Component)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Component.any_instance.stub(:save).and_return(false)
        post :create, {:component => { "length_in_inches" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested component" do
        component = Component.create! valid_attributes
        # Assuming there are no other components in the database, this
        # specifies that the Component created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Component.any_instance.should_receive(:update_attributes).with({ "length_in_inches" => "9.99" })
        put :update, {:id => component.to_param, :component => { "length_in_inches" => "9.99" }}, valid_session
      end

      it "assigns the requested component as @component" do
        component = Component.create! valid_attributes
        put :update, {:id => component.to_param, :component => valid_attributes}, valid_session
        assigns(:component).should eq(component)
      end

      it "redirects to the component" do
        component = Component.create! valid_attributes
        put :update, {:id => component.to_param, :component => valid_attributes}, valid_session
        response.should redirect_to(component)
      end
    end

    describe "with invalid params" do
      it "assigns the component as @component" do
        component = Component.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Component.any_instance.stub(:save).and_return(false)
        put :update, {:id => component.to_param, :component => { "length_in_inches" => "invalid value" }}, valid_session
        assigns(:component).should eq(component)
      end

      it "re-renders the 'edit' template" do
        component = Component.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Component.any_instance.stub(:save).and_return(false)
        put :update, {:id => component.to_param, :component => { "length_in_inches" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested component" do
      component = Component.create! valid_attributes
      expect {
        delete :destroy, {:id => component.to_param}, valid_session
      }.to change(Component, :count).by(-1)
    end

    it "redirects to the components list" do
      component = Component.create! valid_attributes
      delete :destroy, {:id => component.to_param}, valid_session
      response.should redirect_to(components_url)
    end
  end

end
