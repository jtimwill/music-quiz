shared_examples "require sign in" do 
  it "redirects to the sign in page" do 
    clear_current_user
    action
    expect(response).to redirect_to root_path
  end
end