def get_episodes
  friends["_embedded"]["episodes"].map |episodes|
    binding.pry
  end
end

