defmodule CountOnMe.IntegerCore do

  def new(string) do
    String.to_integer(string)
  end

  def inc(acc, int \\ 1) do
    acc + int
  end

  def message(count) do
    "The count is #{count}"
  end

end
