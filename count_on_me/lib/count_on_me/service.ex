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

      :dec ->
        MapCore.dec(counter)
    end
  end

  def increment(pid) do
    send(pid, :inc)
  end

  def decrement(pid) do
    send(pid, :dec)
  end

  def state(pid) do
    send(pid, {:state, self()})

    receive do
      message ->
        message
    end
  end
end
