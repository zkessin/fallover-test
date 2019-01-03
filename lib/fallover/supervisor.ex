defmodule Fallover.Supervisor do
  use Supervisor

  def start_link(_) do
    Supervisor.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(_arg) do
    {:ok, %{strategy: :one_for_one, intensity: 10, period: 1000},
     %{
       id: :module1,
       start: {SomeModule1, :init, []},
       restart: :permanent,
       type: :worker,
       modules: [SomeModule1]
     }}
  end
end
