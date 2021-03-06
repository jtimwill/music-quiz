require 'rails_helper'

describe UsersController do
  describe "GET show" do
    let(:quiz1) {Fabricate(:quiz)}
    let(:quiz2) {Fabricate(:quiz)}
    let(:user) {Fabricate(:user)}
    
    before do
      get :show, id: user.id
    end

    it "sets @user" do
      expect(assigns(:user)).to eq(user)
    end

    it "sets @quiz" do 
      expect(assigns(:quiz)).to eq([quiz1,quiz2])
    end
  end

  describe "GET new" do
    it "sets @user" do 
      get :new
      expect(assigns(:user)).to be_instance_of(User)
    end
  end

  describe "POST create" do
    context "with valid input" do 
      before do
        post :create, user: Fabricate.attributes_for(:user)
      end

      it "creates the user" do 
        expect(User.count).to eq(1)
      end
      
      it "sets the notice" do
        expect(flash[:notice]).to be_present
      end
      
      it "redirects to the root page" do 
        expect(response).to redirect_to root_path
      end
    end

    context "with invalid input" do
      before do
        post :create, user: {username: "Kevin Wang"}
      end

      it "sets @user" do
        expect(assigns(:user)).to be_instance_of(User)
      end 

      it "does not create the user" do 
        expect(User.count).to eq(0)
      end

      it "renders the :new template" do
        expect(response).to render_template :new
      end
    end
  end
end
