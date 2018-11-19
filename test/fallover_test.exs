defmodule FalloverTest do
  use ExUnit.Case
  doctest Fallover

  test "greets the world" do
    assert Fallover.hello() == :world
  end
end
