defmodule Enigma.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    IO.puts("application starting...")

    children = [
      Supervisor.child_spec({Enigma.Server, :superman}, id: 1),
      Supervisor.child_spec({Enigma.Server, :slickrick}, id: 2),
      Supervisor.child_spec({Enigma.Server, :wonderwoman}, id: 3),
      Supervisor.child_spec({Enigma.Server, :spiderman}, id: 4),
      Supervisor.child_spec({Enigma.Server, :deadpool}, id: 5)
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :rest_for_one, name: Enigma.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
