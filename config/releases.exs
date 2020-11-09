import Config

secret_key_base = System.fetch_env!("SECRET_KEY_BASE")
app_port = System.fetch_env!("APP_PORT")
db_user = System.fetch_env!("DB_USER")
db_name = System.fetch_env!("DB_NAME")
db_password = System.fetch_env!("DB_PASSWORD")
db_host = System.fetch_env!("DB_HOST")

config :api, ApiWeb.Endpoint,
  http: [
    port: String.to_integer(app_port),
    transport_options: [socket_opts: [:inet6]]
  ],
  secret_key_base: secret_key_base

config :api, app_port: app_port

config :api, Api.Repo,
  username: db_user,
  password: db_password,
  database: db_name,
  hostname: db_host,
  pool_size: 10
