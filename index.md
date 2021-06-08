## Welcome to Ruby Fundamentals

Today, we'll be interacting with ruby and learning how we can accomplish tasks related to data traversal. We'll be drawing on our knowledge of JavaScript frequently and comparing and contrasting how these fundamentals work in Ruby.

Moving from JavaScript, one of the first things to note is that the package manager we'll be using is called `bundler`. Bundler is generally used to install gems from [RubyGems](https://rubygems.org), though it can also install gems from other sources (like git repositories for example). So:

| Concept  | JS  | Ruby |
|---|---|---|
| Package Manager | npm  | bundler |
| Package Repository  | [npmjs.com](https://npmjs.com)  | [rubygems.org](https://rubygems.org)  |
| Package Generator  | `npm init`  | `bundle gem insert_gem_name_here`  |
| Install Dependencies| `npm install` | `bundle install` |
| Add a Dependency | `npm install react-router-dom` | `bundle add pry` |

I've generated the source code for today's discussion using the command `bundle gem ruby_fundamentals`. We'll be talking a bit about the directory structure and how the files interact with one another, but if you want to refer to that on its own, I've recorded a quick video explaining how the `bundle gem` command works:

<iframe width="560" height="315" src="https://www.youtube.com/embed/zIzhh1h8ZGE" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

I also have a longer video on how you can [publish a gem](https://www.youtube.com/watch?v=RrAOlk6qoiM) for later reference.

## Variables
let const or var keyword to indicate what kind of variable we're declaring

| Concept  | JS  | Ruby |
|---|---|---|
| Variable Declaration | let (something that can change), const (don't change or get an error!), var (potential scoping issues) `const name ="Dakota"` | no keywords for declaration. `name = "Dakota"` |
| constant | const varName (throws an error if you try to reassign) | ALL_CAPS_NAME (doesn't throw an error if you reassign it) |

## Data Types
- String
- Boolean
- Integer
- Float
- Object (key value pair) => Hash in Ruby
- Array
- Symbol (:name)
- Function


## Methods vs Functions
Unlike in JavaScript, you can't refer to a method without calling it. Generally, we use a symbol matching the name of the method to refer to the method when we need to have a reference to but we don't want to call it.

Last expression in ruby method is its return value. UNLESS, you have an explicit return before that point. Usually, the only reason you would do that is if you want to stop a method execution early. Implicit returns are the rule.

When you're calling in JS you do what?
```js
function myFunction() {
  return "Yeah!!!"
}
```
```
myFunction()
```
in Ruby

```rb
def my_method
  "Yeah!!!"
end
```

We call my_method directly:

```
my_method
```



## Scope

When we're loading code from another file using `require`, local variables don't make the trip, but constants (defined with ALL_CAPS) do. If we require a file that defines a constant, we'll be able to access it from the file we add the require in. 
```rb
# one_file.rb
require 'another_file'
puts name

# another_file.rb
name = "Dakota"
```

will raise an error:

```
undefined local variable or method `another file' for main:Object
```

whereas:

```rb
# one_file.rb
require 'another_file'
puts NAME

# another_file.rb
NAME = "Dakota"
```

will print "Dakota" to the console.

## Iterators

| Concept  | JS  | Ruby |
|---|---|---|
| Basic |  forEach (returns undefined) | each (returns original array) |
| transforming | map | map (alias called collect)  |
| searching for one | find  | find (alias called detect)  |
| searching for multiple | filter | select |
| reducing to a single value | reduce | reduce (alias called inject) |

## Truthiness vs Falseyness

| Concept  | JS  | Ruby |
|---|---|---|
| Truthy | non empty strings, non zero numbers, arrays, objects, symbols  | everything but nil, & false  |
| Falsey  | "", 0, null, undefined, false, NaN  | nil, false  |


## Hashes vs Objects

If you need to access a value inside of a Hash, dot notation doesn't work (if you try to pass the key name)
JS objects => keys are always strings.
Ruby Hashes => keys can be what you want them to be (symbols, strings, integers, float

If you use this syntax:

```rb
def favorite_meals
  {
    breakfast: ["Scrambled Eggs"],
    lunch: ["Ramen"],
    dinner: ["Burritos", "Grilled Octopus"]
  }
end
```
Then the keys are actually symbols
If you need string keys, you have to use the hash rocket syntax:

```rb
def favorite_meals
  {
    "breakfast" => ["Scrambled Eggs"],
    "lunch" => ["Ramen"],
    "dinner" => ["Burritos", "Grilled Octopus"]
  }
end
```

We access values inside of a hash using the brackets method:

```rb
def favorite_meals
  {
    breakfast: ["Scrambled Eggs"],
    lunch: ["Ramen"],
    dinner: ["Burritos", "Grilled Octopus"]
  }
end
favorite_meals[:breakfast]
```

## Navigating through data in a hash

```
hash.keys # => returns an array of the keys inside the hash
friends.keys
 => ["id", "url", "name", "type", "language", "genres", "status", "runtime", "averageRuntime", "premiered", "officialSite", "schedule", "rating", "weight", "network", "webChannel", "dvdCountry", "externals", "image", "summary", "updated", "_links", "_embedded"] 
```

How do we get the embedded episodes?

```rb
:[], single argument (within brackets) of the key where the value you want inside of the hash resides.
:[]=, two arguments (one within brackets, one after the =) of the key where you want to store a value, and the value you want to store.

friends[:_embedded]
```

## Iteration trick for arrays

Pry is annoying inside of a large array (you'd have to exit 236 times). What I like to do is store the first element in the array in a variable named the same as my block parameter that I'm planning to use.

```rb
# if we're going to do this:
friends["_embedded"]["episodes"].map {|episode| }
# I'd start with this:
episode = friends["_embedded"]["episodes"].first
Then we do this:
episode["name"]
 => "The One Where Monica Gets a Roommate" 
 And fill in our block:
 
friends["_embedded"]["episodes"].map {|episode| episode["name"] }
```


## Errors

### Could not locate Gemfile on `bundle install`

If you run `bundle install` and see an error that says 'Could not locate Gemfile'. Make sure to `cd` into the directory where the Gemfile. 

`pwd` (print working directory) => shows the full path to the folder your terminal is inside of at the moment.
You'll want to make sure that is the folder where your Gemfile is.

If you see this, you need to actually load `pry`
```
/Users/dakotamartinez/Development/flatiron/lectures/ruby_fundamentals/lib/ruby_fundamentals/accessing_data.rb:9:in `<top (required)>': undefined method `pry' for #<Binding:0x00007fcf748a7dc0> (NoMethodError)
```
then we add
```
require 'pry'
```
run again and you should see something like this:

```
     5: 
     6: def print_name
     7:   puts name
     8: end
     9: 
 => 10: binding.pry
```

### ArgumentError

```
ArgumentError:
       wrong number of arguments (given 2, expected 0)
     # ./lib/ruby_fundamentals/accessing_data.rb:32:in `get_episode_name'
     # ./spec/ruby_fundamentals_spec.rb:17:in `block (2 levels) in <top (required)>'
```
1. Given arguments (2 in this case) => the number of arguments the method was invoked with
2. Expected number (0 in this case) => the number of arguments the method was defined to accept.
3. Line number (line 32 is where the method is defined) 
4. Line number (line 17 is where the method is called)

### NoMethodError

```rb
1: from /Users/dakotamartinez/Development/flatiron/lectures/ruby_fundamentals/lib/ruby_fundamentals/accessing_data.rb:40:in `get_episode_name'
NoMethodError (undefined method `[]' for nil:NilClass)
```
1. Method name (in this case '[]')
2. receiving object (in this case nil:NilClass)
3. Line number

You're looking for that line number and the place where that method appears. The error is telling you that the expression right before that method call returns the receiving object (nil in this case).

The way around this particular error is to add a `nil` guard:

```rb
episode && episode["name"]
```
We had tried this really strange line of code in the afternoon lecture:

```rb
episode.try(:[], "name")
```

and we got:

```rb
NoMethodError (undefined method `try' for nil:NilClass)
Did you mean?  pry
```

The [try method](https://www.rubydoc.info/docs/rails/4.1.7/Object:try) is actually built into the Ruby on Rails library and I was mistakenly trying to use it here, so that's why we saw this error.

