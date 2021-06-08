## Welcome to Ruby Fundamentals

Today, we'll be interacting with ruby and learning how we can accomplish tasks related to data traversal. We'll be drawing on our knowledge of JavaScript frequently and comparing and contrasting how these fundamentals work in Ruby.

Moving from JavaScript, one of the first things to note is that the package manager we'll be using is called `bundler`. Bundler is generally used to install gems from [RubyGems](https://rubygems.org), though it can also install gems from other sources (like git repositories for example). So:

| Concept  | JS  | Ruby |
|---|---|---|
| Package Manager | npm  | bundler |
| Package Repository  | [npmjs.com](https://npmjs.com)  | [rubygems.org](https://rubygems.org)  |
| Package Generator  | `npm init`  | `bundle gem insert_gem_name_here`  |

I've generated the source code for today's discussion using the command `bundle gem ruby_fundamentals`. We'll be talking a bit about the directory structure and how the files interact with one another, but if you want to refer to that on its own, I've recorded a quick video explaining how the `bundle gem` command works:

<iframe width="560" height="315" src="https://www.youtube.com/embed/zIzhh1h8ZGE" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

I also have a longer video on how you can [publish a gem](https://www.youtube.com/watch?v=RrAOlk6qoiM) for later reference.

## Variables

Declaring variables:
JS: const/let (earlier you might see var)
Ruby: no keywords

## Data Types
String
Boolean
Integer
Float
Method
Arrays
Hashes
Symbols

## Iterators

| Concept  | JS  | Ruby |
|---|---|---|
| Simple | forEach | each  |
| transform  | map  | map (collect is an alias)  |
| reduce to single value | reduce  | reduce (inject is an alias)  |
| finding (singular)  | find  | find (detect is an alias) |
| finding (plural)  | filter  | select  |

Iterators are defined in the [Enumerable module](https://ruby-doc.org/core-2.6.6/Enumerable.html) and they are available on both Arrays and Hashes.

## Truthiness & Falsiness

| Concept  | JS  | Ruby |
|---|---|---|
| Truthy | non empty strings, non-zero numbers, objects, arrays | Everything but nil & false  |
| Falsey  | 0, '', undefined, false, null, NaN  | nil, false |

## Errors
```
NoMethodError (undefined method `let' for main:Object)
```
3 pieces of a NoMethodError you want to pay attention to:
1. method name (in this case let)
2. object name (in this case main:Object)
3. Line number (not visible here, but usually be–this tells you where the error occurred in your code)
```
undefined method `pry' for #<Binding:0x00007f92bc13f3c0> (NoMethodError)
```
Need to bundle install and make sure pry is in gemfile

```
ArgumentError:
       wrong number of arguments (given 1, expected 0)
     # ./lib/ruby_fundamentals/accessing_data.rb:37:in `get_episodes'
     # ./spec/ruby_fundamentals_spec.rb:9:in `block (2 levels) in <top (required)>'
```
1. Given number of arguments => how many arguments the method was called with.
2. Expected number of arguments => number of arguments the method is defined to accept.
3. Line number of method definition
4. Line number of method call

```
NoMethodError:
       undefined method `first' for nil:NilClass
     # ./spec/ruby_fundamentals_spec.rb:10:in `block (2 levels) in <top (required)>'
```
1. method name: first
2. object name: nil:nilClass
3. line 10.
