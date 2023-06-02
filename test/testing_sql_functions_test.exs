defmodule TestingSqlFunctionsTest do
  use ExUnit.Case

  alias Ecto.Adapters.SQL
  alias TestingSqlFunctions.Repo

  describe "try_convert_to_decimal (v_input text)" do
    test "converts a string containing an integer to decimal" do
      query = """
        SELECT try_convert_to_decimal ('250') AS result;
      """

      result = Decimal.new("250")

      assert {:ok,
              %{
                columns: ["result"],
                rows: [[^result]]
              }} = run_query(query)
    end

    test "converts a string not containing an integer to null" do
      query = """
        SELECT try_convert_to_decimal ('not a number') AS result;
      """

      assert {:ok,
              %{
                columns: ["result"],
                rows: [[nil]]
              }} = run_query(query)
    end
  end

  defp run_query(query), do: SQL.query(Repo, query, [])
end
