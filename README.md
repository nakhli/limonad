# LiMonad

LiMonad is a tiny library for building monads.

Here are some examples of how to build common monads with LiMonad:

## Maybe Monad

Example:

```ruby
MaybeMonad >>
    -> x { 5 / x unless x == 0 } >>
    -> x { x + 1 } >>
    -> x { 3 * x } >>
    -> x { Math.log(x) unless x < 0 } >>
    -> x { x.round }
```

Monad Definition:

```ruby
class MaybeMonad < LiMonad
  def bind(f, g, *args)
    result = f[*args]
    g[result] if result
  end
end
```

## Logger Monad

Example:
```ruby
LoggerMonad >>
    -> x { [x * x, "#{x} was squared"] } >>
    -> x { [x / 2, "#{x} was halved"]  }
```
Monad Definition:

```ruby
class LoggerMonad < LiMonad
  def bind(f, g, *args)
    f_result, f_log = f[*args]
    g_result, g_log = g[f_result]
    [g_result, "#{f_log}\n#{g_log}"]
  end

  def unit(g, *args)
    [g[*args], args.inspect]
  end
end
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'limonad'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install limonad



## Contributing

1. Fork it ( https://github.com/nakhli/limonad/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License

Licensed under the [MIT License](http://opensource.org/licenses/MIT).

Copyright Chaker Nakhli.