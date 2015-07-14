require 'spec_helper'

class MaybeMonad < LiMonad
  def bind(f, g, *args)
    result = f[*args]
    g[result] if result
  end
end

RSpec.describe MaybeMonad do

  let(:math_op) do
    MaybeMonad >>
        -> x { 5 / x unless x == 0 } >>
        -> x { x + 1 } >>
        -> x { 3 * x } >>
        -> x { Math.log(x) unless x < 0 } >>
        -> x { x.round }

  end

  it 'propagates not nil values' do
    expect(math_op[0.01]).to eq(7)
  end

  it 'does not propagate nil values' do
    expect(math_op[0]).to be_nil
  end

  it 'does not propagate nil values' do
    expect(math_op[-0.8]).to be_nil
  end
end