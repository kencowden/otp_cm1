defmodule Enigma.Server do
  use GenServer
  alias Enigma.Board
  # Callbacks

  @impl true
  def init(_answer) do
    {:ok, Board.new(:generate)}
  end

  @impl true
  def handle_call({:move, guess}, _from, board) do
    new_board = Board.move(board, guess)
    {:reply, Board.rows(new_board), new_board}
  end

  # Client side
  def move(pid, guess) do
    GenServer.call(pid, {:move, guess})|> IO.puts()
  end
end
