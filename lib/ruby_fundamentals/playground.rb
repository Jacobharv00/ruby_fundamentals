# const / let before variable declaration in JS
# Constants in ruby are all caps
NAME = "Dakota"

# global var (don't do this!)
$names = ["Dakota", "Sandra", "Grant", "Kyle"]

def print_names names
  secret = "hi there"
  binding.pry
  puts names
end

print_names($names)