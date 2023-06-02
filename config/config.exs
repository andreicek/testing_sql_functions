import Config

config :testing_sql_functions, TestingSqlFunctions.Repo,
  database: "testing_sql_functions_repo",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"

config :testing_sql_functions, ecto_repos: [TestingSqlFunctions.Repo]

config :logger, level: :info
