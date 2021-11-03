defmodule Enigma.Score do
  defstruct [:reds, :whites]

  def new(solution, guess) do
    reds =
      solution
      |> Enum.zip(guess)
      |> Enum.count(fn {x, y} -> x == y end)

    total = Enum.count(solution)
    wrong = (guess -- solution) |> Enum.count()
    whites = total - reds - wrong
    %{reds: reds, whites: whites}
  end

  def as_string(%{reds: reds, whites: whites}) do
    String.duplicate("R", reds) <> String.duplicate("W", whites)

  end
end
