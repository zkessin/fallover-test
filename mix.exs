defmodule Fallover.MixProject do
  use Mix.Project

  def project do
    [
      app: :fallover,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {Fallover.Application, []},
      extra_applications: [
        :logger,
        :runtime_tools,
        :wx,
        :observer
      ]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:distillery, "~> 2.0"}
    ]
  end
end
