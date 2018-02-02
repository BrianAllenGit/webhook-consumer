# Webhook Testing App

## Prerequisites

### Ruby + Ruby manager
You will need to have ruby installed - installing via rbenv (or rvm) is the way to go here. If you only have system ruby you will not be able to install gems. We recommend rvm
```
\curl -sSL https://get.rvm.io | bash -s stable
rvm install "ruby-2.3.1"
rvm use
gem install bundler
```

### Git, Heroku
```
brew update
brew install heroku git
```

### GitHub
You should already have an account but ensure you have setup [SSH to your local machine](https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/)

## Setting the webhook testing app
```bash
$ git clone git@github.com:smile-io/webhook-testing-app.git
$ cd webhook-testing-app
$ bundle install
```

## Running the webhook testing app
- From with the webhook consumer repo directory
```bash
$ rails db:setup
$ rails s -p 8080
```

## Deployment

http:/webhook-consumer.herokuapps.com

```bash
# Setup (you only need to do this once)
$ heroku git:remote --app smile-webhook-auditor --remote production

# Deploy
$ git push heroku production
```
