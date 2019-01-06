defmodule Fallover.Server do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false
  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, [])
  end

  def get() do
    :global.whereis_name(__MODULE__)
    |> GenServer.call(:get)
  end

  def init([]) do
    {:ok, 0}
  end

  def handle_call(:get, _from, state) do
    {:reply, {:ok, state}, state + 1}
  end
end
