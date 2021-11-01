defmodule CountOnMeTest do
  use ExUnit.Case

  alias CountOnMe.IntegerCore
  doctest CountOnMe

  test "greets the world" do
    assert CountOnMe.hello() == :world
  end

  test "make sure new function works" do
    assert IntegerCore.new("42") == 42
  end

  test "make sure we can increment with a default number" do
    assert IntegerCore.inc(42) == 43
  end

  test "make sure we can increment with our own number" do
    assert IntegerCore.inc(42, 13) == 55
  end

  test "make sure we can print out our stringified message" do
      assert IntegerCore.message(55) == "The count is 55"
  end
end
