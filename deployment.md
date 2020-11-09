# Deployment

Deployment is done using `mix release`, Docker, Terraform and Nomad.

## Mix Release

The first step to ensure that your new code work is to compile a release. Make sure you have all the environment variables ready before running `mix release`.

```bash
# Initial setup
mix deps.get --only prod
MIX_ENV=prod mix compile

MIX_ENV=prod mix release
```

If all goes well, you should be able to start the production server in your local machine by running:

```bash
_build/prod/rel/api/bin/api start
```

## Docker

We use Docker to package the dependencies. To try out that it works in Docker:

```bash
# Build the Docker Image
docker build -t api .
```

To test that this works, you will can run the following:

```bash
# Create a dedicated docker network
docker network create --attachable api-default

# Run Postgres inside a docker container
docker run -d --restart unless-stopped --name database \
  --network api-default \
  --env POSTGRES_DB=postgres \
  --env POSTGRES_USER=postgres \
  --env POSTGRES_PASSWORD=postgres \
  postgres:13.0-alpine

# Run the web app
docker run -d --name web \
  --network api-default \
  -p 4000:4000 \
  --expose=4000 \
  --env APP_PORT=4000 \
  --env DB_NAME=postgres \
  --env DB_USER=postgres \
  --env DB_PASSWORD=postgres \
  --env DB_HOST=database \
  --env SECRET_KEY_BASE=GZ24IABhL75hluLJw5HhhKbnhz57gkU2ABiWPjaDdtkd3aA+hvYpicy0I/mRK0FO \
  --cap-drop ALL \
  api:latest
```