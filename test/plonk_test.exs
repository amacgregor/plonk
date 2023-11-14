defmodule PlonkTest do
  use ExUnit.Case
  doctest Plonk

  test "greets the world" do
    assert Plonk.hello() == :world
  end
end
