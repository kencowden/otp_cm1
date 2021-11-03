defmodule CountOnMe.Server do
  use GenServer
  alias CountOnMe.MapCore
  # Callbacks

  @impl true
  def init(input) do
    {:ok, MapCore.new(input)}
  end

  @impl true
  def handle_call(:state, _from, counter) do
    {:reply, MapCore.message(counter), counter}
  end

  @impl true
  def handle_cast(:inc, counter) do
    {:noreply, MapCore.inc(counter)}
  end

  def handle_cast(:dec, counter) do
    {:noreply, MapCore.dec(counter)}
  end

  # Client functions
  def start_link(input) do
    GenServer.start_link(__MODULE__, input)
  end
end
