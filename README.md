```
      .--.
   ."";  |
   |  |  |
   |  |  |
   |  |  |
   |  |  |--._
   |  | _|  | `|
   |  /` )  |  |
   | /  /'--:__/
   |/  /       |
   (  ' \      |
    \    `.   /
     |       |
     |       |

```

# Prodminder
Midterm Project for Lighthouse Labs Web Dev Feb 2015 Cohort

## Running Prodminder

1. Clone the repo into your local folder, e.g. `git clone (.git ssh url)`.
2. Run `bundle install` to setup gems.
3. Configure environment variables, (see note below.)
4. If using vagrant use `shotgun -p 3000 -o 0.0.0.0` or, if using locally on your Mac/*nix computer, run `bundle exec shotgun config.ru`.
5. In your local browser, go to `http://localhost:3000/`
6. Boom goes the dynamite.

## Dependent APIs:
- Heroku Postgres
- Mailgun
- Twilio

## Environment Variables
- In the base of your /prodminder/ folder, `touch .env` then `vim .env` and setup the following:
- DATABASE_HOST= (your Heroku Postgres url here)
- DATABASE_NAME= (your Heroku Postgres name here)
- DATABASE_USERNAME= (your Heroku Postgres username here)
- DATABASE_PASSWORD= (your Heroku Postgres password here)
- MAILGUN_API_KEY= (your Mailgun API key here)
- TWILIO_ACCOUNT_SID= (your Twilio Account SID here)
- TWILIO_AUTH_TOKEN= (your Twiilio authentication token here)
- In `vim`, write then quit editing `.env`. Continue with setup above.

## Support:
- Support isn't really available; our midterm app is just an academic development project and shouldn't be taken very seriously.
