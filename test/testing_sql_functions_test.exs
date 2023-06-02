defmodule TestingSqlFunctionsTest do
  use ExUnit.Case
  doctest TestingSqlFunctions

  test "greets the world" do
    assert TestingSqlFunctions.hello() == :world
  end
end
