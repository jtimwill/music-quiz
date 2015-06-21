def set_current_user(user = nil)
  session[:user_id] = (user || Fabricate(:user)).id
end

def clear_current_user
  session[:user_id] = nil
end

def sign_in(a_user = nil)
  user = a_user || Fabricate(:user)
  visit '/login'
  fill_in "Username", with: user.username
  fill_in "Password", with: user.password
  click_button "Login"
end

