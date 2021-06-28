# define a method called favorite_meals that returns a hash with three keys:
# - breakfast
# - lunch
# - dinner
# each of these three keys should have a value of an array of strings. Each string will represent the name of a favorite meal of that fits into the appropriate category of breakfast, lunch of dinner

# to test out your code as you go, you can run the `rspec --fail-fast` command in your terminal.

def favorite_meals 
  {
    "breakfast": ["Plantains", "French Toast", "Cinnamon Rolls"],
    lunch: ["French Toast", "Leftovers", "Salad/Sandwich"],
    dinner: ["Rice and Beans with chicken!", "Steak and Potatoes", "French Toast"],
    "secret" => "hello there!"
  }
end

NUMBER_MAP = { 
  "one" => 1,
  "two" => 2,
  1 => "one",
  2 => "two",
  word => "hi"
}