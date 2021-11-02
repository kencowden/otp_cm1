defmodule Enigma.Board do
  defstruct [:solution, :guesses]

  defp generate() do
    1..8 |> Enum.shuffle() |> Enum.take(4)
  end

  def new(answer \\ generate()) do
    %__MODULE__{solution: answer, guesses: []}
  end

  def move(board, guess) do
    %{board | guesses: [guess | board.guesses]}
  end

end
