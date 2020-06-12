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
    
## Design & Development
* [Architecture](https://app.lucidchart.com/documents/edit/f80c7234-06f9-405e-928d-8c4de0ab15e9/0_0?beaconFlowId=B2623CA71FD04A67#?folder_id=home&browser=icon)
* [Release plan](https://miro.com/app/board/o9J_krJSjOo=/)    

## Tasks
- [x] Rails app
- [x] Dockerize
- [ ] Terraform (sandbox)
- [ ] Terraform (staging)
- [ ] Terraform (production)
- [ ] Hardcoded EHR request/PBM response calls Direct @ Staging
- [ ] Response is compared to expected result
- [ ] User can specify Expected Response (with persistence)
- [ ] User can specify EHR request (with persistence)
- [ ] User can specify PBM response (with persistence)
- [ ] CLI
