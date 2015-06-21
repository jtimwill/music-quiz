Fabricator(:quiz) do 
  category {Faker::Name.name}
  score {Faker::Number.number(2)}
end


