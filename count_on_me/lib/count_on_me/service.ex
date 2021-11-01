defmodule CountOnMe.Service do
  alias CountOnMe.MapCore

  def start(input) do
    spawn(fn -> run(MapCore.new(input)) end)
  end

  def run(counter) do
    counter
    |> listen()
    |> run()
  end

  def listen(counter) do
    receive do
      {:state, from} ->
        send(from, MapCore.message(counter))
        counter
      :inc ->
        MapCore.inc(counter)
    end

  end
end
