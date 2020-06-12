# SwiftRx Responder

## Create .env files:
    - `.env/development/database`
    - `.env/development/web`
    - See `.env.example` for all the environment variables
  
## Database setup:
    - `docker-compose up -d responder_database`
    - `docker-compose run responder bundle exec rake db:create`

## Open bash console for responder_database:
    - `docker-compose run --rm responder_database bash`

## Open bash console for responder:
    - `docker-compose run --rm responder bash`

## Run specs:
    - inside a responder bash console:
      - `./test.sh`
      - connect to test db while in a running test: `psql -U postgres -h responder_database responder_test`
   
## Run Responder:
    - `docker-compose up -d`
    - Browser to: localhost:3002
