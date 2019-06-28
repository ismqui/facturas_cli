defmodule FacturasCliTest do
  use ExUnit.Case
  doctest FacturasCli

  test "greets the world" do
    assert FacturasCli.hello() == :world
  end
end
