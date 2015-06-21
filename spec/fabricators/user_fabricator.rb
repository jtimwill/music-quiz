Fabricator(:user) do 
  username {Faker::Name.name}
  password 'password'
end

