require 'limonad/version'

class LiMonad

  def initialize(f=nil)
    self.fn = f
  end

  def [](*args)
    fn[*args]
  end

  def >>(g)
    do_bind(g)
  end

  def self.>>(g)
    self.new >> g
  end

  def self.unit(f, *args)
    self.new.unit(f, *args)
  end

  protected

  # child monads should override these methods
  def unit(f, *args)
    f[*args]
  end

  def bind(f, g, *args)
    g[f[*args]]
  end

  private

  attr_accessor :fn

  def do_unit(f)
    self.class.new -> *args { unit(f, *args) }
  end

  def do_bind(g)
    fn ? self.class.new(-> *args { bind(fn, g, *args) }) : self.class.new(g)
  end
end

