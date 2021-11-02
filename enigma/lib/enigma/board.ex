defmodule Enigma.Board do
  defstruct [:solution, :guesses]

  alias Enigma.Score

  defp generate() do
    1..8 |> Enum.shuffle() |> Enum.take(4)
  end

  def new(answer \\ generate()) do
    %__MODULE__{solution: answer, guesses: []}
  end

  def move(board, guess) do
    %{board | guesses: [guess | board.guesses]}
  end

  def row(solution, guess) do
    "|#{inspect(guess)} | #{Score.new(solution, guess) |> Score.as_string()} |"
  end

  def rows(board) do
    Enum.map(board.guesses, &row(board.solution, &1))
    |> Enum.join("\n")
  end
end
