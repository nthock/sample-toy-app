# Api

This is the boilerplate repository for Phoenix Backend API.

To set up:
* Install necessary dependencies
  * Mox for mocking (done)
  * Mix Test Watch for re-running tests when the code is updated (done)
  * Credo for static code analysis (done)
  * exCoveralls for coverage (done)
  * Dialyzer for Typespec (done)
  * ExMachina for test factories (done)
* Set up dependabot to manage dependencies (done)
* Set up test coverage (done)
* Configure Mix Release (done)
* Dockerfile using Mix Release (done)
* Terraform in AWS with Nomad cluster
* CircleCI config that run test, credo, build docker image, and push the docker image to ECR
* Features
  * A blank endpoint returning just the version (done)
  * User Authentication with Firebase
  * Organisations management logic
  * Producer-Consumer pattern
  * Sending email

## Development

1. Install your dependencies with `mix deps.get`
2. Setup and migrate your database with `mix ecto.setup`
3. Start Phoenix server with `iex -S  mix phx.server`

### Running Tests

```bash
# Run all the tests
mix test

# Test Coverage
MIX_ENV=test mix coveralls.html
```

### Credo

Credo is the static code analysis tool.

```bash
mix credo --strict
```

### Sobelow

Sobelow is a security scanning package

```bash
mix sobelow
```

## Deployment

Please read the deployment guide.

## To use this boilerplate

1. Create from template in Github (if you have access)
2. Change the database name