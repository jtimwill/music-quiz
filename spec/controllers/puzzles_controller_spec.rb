require 'rails_helper'

describe PuzzlesController do
  describe "POST create" do
    let(:quiz) {Fabricate(:quiz)}

    context "with authenticated users" do
      let(:current_user) {Fabricate(:user)}
      before {set_current_user(current_user)}

      context "with valid inputs" do 
        before do
          post :create, puzzle: Fabricate.attributes_for(:puzzle), quiz_id: quiz.id
        end

        it "score should be 1" do 
          expect(Puzzle.first.quiz.score).to eq(1)
        end

        it "creates a puzzle" do 
          expect(Puzzle.count).to eq(1)
        end

        it "creates a puzzle associated with the quiz" do 
          expect(Puzzle.first.quiz).to eq(quiz)
        end

        it "redirects to the quiz show page" do
          expect(response).to redirect_to quiz
        end
      end

      context "with invalid inputs" do 
        before do
          post :create, puzzle: {question: 'B0T1', answer: '11'}, quiz_id: quiz.id
        end

        it "creates a puzzle" do 
          expect(Puzzle.count).to eq(1)
        end

        it "creates a puzzle associated with the quiz" do 
          expect(Puzzle.first.quiz).to eq(quiz)
        end

        it "sets the error message" do 
          expect(flash[:danger]).to be_present
        end

        it "redirects to the user show page" do
          expect(response).to redirect_to user_path(current_user)
        end
      end
    end
    
    it_behaves_like "require sign in" do 
      let(:action) {post :create, puzzle: Fabricate.attributes_for(:puzzle), quiz_id: quiz.id}
    end
  end
end
