# HashToStruct

[![Gem Version](https://badge.fury.io/rb/hash_to_struct.svg)](https://badge.fury.io/rb/hash_to_struct)
[![Ruby](https://github.com/a-bohush/hash_to_struct/actions/workflows/ruby.yml/badge.svg?branch=main)](https://github.com/a-bohush/hash_to_struct/actions/workflows/ruby.yml)

It enables recursive conversion of a ruby `Hash` to a Struct-like object and back.

Stop thinking about symbols vs strings when accessing values in your hash. Simply call a method.

It is built on top of standard `Struct` and `OpenStruct` classes with all their features preserved while adding a few on top for conveniences like handling nested hashes/arrays, unified constructor interface, immutability.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hash_to_struct'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install hash_to_struct

## Usage

`Struct` based conversion:

```ruby
struct = HashToStruct.struct({q: 1})

struct.q # => 1
struct[:x] # => NameError: no member 'x' in struct
```

`OpenStruct` based conversion:

```ruby
ostruct = HashToStruct.ostruct({q: 1})

ostruct.q # => 1
ostruct[:x] = 5
ostruct.x # => 5
```

Convert back to `Hash`:

```ruby
ostruct.to_h # => { :q => 1, :x => 5 }
```

Recursive conversion:

```ruby
struct = HashToStruct.struct({q: 1, w: { e: 2 }})

struct.q.w.e # => 2
```
**Note!** It will only convert objects of type Hash, not Hash derivatives or some acting like a Hash.

Recursive conversions inside `Array`:

```ruby
struct = HashToStruct.struct({q: 1, w: [{ e: 2 }]}, including_arrays: true)

struct.q.w.first.e # => 2
```
**Note!** It will only iterate over objects of type Array, not Array derivatives or other enumerables.

Make immutable:
```ruby
struct = HashToStruct.struct({q: 1}, immutable: true)

struct.q = 2 # => FrozenError: can't modify frozen #<struct q=1>
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/a-bohush/hash_to_struct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
