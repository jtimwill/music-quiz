require 'rails_helper'

describe QuizzesController do
  context "with authenticated users" do
    let(:my_quiz) {Fabricate(:quiz)}
    let(:current_user) {Fabricate(:user)}
    before {set_current_user(current_user)} 

    describe "POST create" do
      context "with valid input" do 
        before do
          post :create, quiz: Fabricate.attributes_for(:quiz)
        end

        it "creates a quiz associated with the signed in user" do
          expect(Quiz.first.user).to eq(current_user)
        end

        it "creates the quiz" do 
          expect(Quiz.count).to eq(1)
        end

        it "redirects to the show page" do 
          expect(response).to render_template :show
        end
      end

      it_behaves_like "require sign in" do 
        let(:action) {post :create, quiz: my_quiz}
      end
    end

  describe "GET show" do
    before do
      get :show, id: my_quiz.id
    end

    it "sets @quiz for authenticated users" do
      expect(assigns(:quiz)).to eq(my_quiz)
    end

    it "sets @puzzle for authenticated users" do
      expect(assigns(:puzzle)).to be_instance_of(Puzzle)
    end

    it_behaves_like "require sign in" do 
      let(:action) {get :show, id: my_quiz.id}
    end
  end
end

  describe "GET index" do 
    before do
      get :index
    end

    it "sets @quiz" do
      expect(assigns(:quiz)).to be_instance_of(Quiz)
    end
  end
end