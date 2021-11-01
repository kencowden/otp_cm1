defmodule CountOnMeTest do
  use ExUnit.Case
  doctest CountOnMe

  test "greets the world" do
    assert CountOnMe.hello() == :world
  end
end
