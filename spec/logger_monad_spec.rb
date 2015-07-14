require 'spec_helper'

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

RSpec.describe LoggerMonad do

  let(:op) do
    LoggerMonad >>
        -> x { [x * x, "#{x} was squared"] } >>
        -> x { [x / 2, "#{x} was halved"]  }
  end

  it 'computes the correct result' do
    result, _ = op[100]
    expect(result).to eq(5000)
  end

  it 'does the correct logging' do
    _, log = op[100]
    expect(log).to eq("100 was squared\n10000 was halved")
  end
end