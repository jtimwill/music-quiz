require 'rails_helper'

feature "User signs in" do 
  scenario "with existing username" do 
    alice = Fabricate(:user)
    sign_in(alice)
    expect(page).to have_content("Welcome, you've logged in!")
  end
end
