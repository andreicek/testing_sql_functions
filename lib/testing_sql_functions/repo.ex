defmodule TestingSqlFunctions.Repo do
  use Ecto.Repo,
    otp_app: :testing_sql_functions,
    adapter: Ecto.Adapters.Postgres
end
