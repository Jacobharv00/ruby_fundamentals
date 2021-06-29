def secret_method
  secret = "i won't tell!"
  binding.pry
end

NAMES = ["Dakota", "Darren", "Arthur", "Terry"]

def print_names names
  puts names
end

def favorite_meals
  {
    breakfast: ["Pancakes", "Omelette"],
    lunch: ["Gyro", "Noodles"],
    dinner: ["Burrito!!!", "Pizza"]
  }
end

def favorites_as_a_sentence
  favorite_meals.map.with_index(1) do |data,i| 
    meal, favorites = data
    "#{i}. For #{meal} I want to have #{favorites.join(' and ')}"
  end
end