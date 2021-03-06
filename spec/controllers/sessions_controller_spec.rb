require 'rails_helper'

describe SessionsController do
  describe "GET new" do
    it "renders the new template for unauthenticated users" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "POST create" do
    context "with valid credentials" do
      before do
        alice = Fabricate(:user)
        post :create, username: alice.username, password: alice.password
      end

      it "puts the signed in user in the session" do
        alice = Fabricate(:user)
        post :create, username: alice.username, password: alice.password
        expect(session[:user_id]).to eq(alice.id)
      end

      it "redirects to the root page" do
        expect(response).to redirect_to root_path
      end

      it "sets the notice" do
        expect(flash[:notice]).to be_present
      end
    end

    context "with invalid credentials" do 
      before do 
        alice = Fabricate(:user)
        post :create, username: alice.username, password: alice.password + 'asfas'
      end

      it "does not put te signed in user in the session" do 
        expect(session[:user_id]).to be_nil
      end

      it "sets the error message" do 
        expect(flash[:danger]).to be_present
      end

      it "redirects to the login page" do 
        expect(response).to redirect_to login_path
      end
    end
  end

  describe "GET destroy" do 
    before do 
      set_current_user
      get :destroy
    end

    it "clears the session for the user" do 
      expect(session[:user_id]).to be_nil
    end

    it "redirects to the root path" do 
      expect(response).to redirect_to root_path
    end

    it "sets the notice" do 
      expect(flash[:notice]).to be_present
    end
  end
end