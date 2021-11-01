defmodule CountOnMe.MapCore do

  def new (count) do
    %{count: String.to_integer(count)}
  end

  def inc (%{count: count})do
    %{count: count + 1}
  end

  def dec (%{count: count})do
    %{count: count - 1}
  end

  def message (%{count: count}) do
    "The count is #{count}"
  end
end
