# Variables in JS
require 'pry'

NAME = "Dakota"
NAMES = ["Victoria", "Mo", "Nicholas", "Sue", "Greg", "Paul", "Jimmy", "Dakota"]

def print_name(name)
  puts name
end

print_name "Dakota"

def say_greeting(name)
  puts "My name is #{name}"
  "My name is #{name}"
end
name = "Mo"

def favorite_meals
  {
    breakfast: ["Scrambled Eggs"],
    lunch: ["Ramen"],
    dinner: ["Burritos", "Grilled Octopus"]
  }
end
# binding.pry

def get_episodes
  friends["_embedded"]["episodes"]
end

def get_episode_names
  get_episodes.map {|episode| episode["name"] }
end

def get_episode_name(season_number, episode_number)
  episode = get_episodes.find do |e| 
    e["season"] == season_number && e["number"] == episode_number 
  end
  episode && episode["name"]
end

def get_episodes_by_season(season_number)
  get_episodes.select do |e|
    e["season"] == season_number
  end
end