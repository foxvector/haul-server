# JapanHaul Rails
Managing backend API for Japan Haul frontend.

## Stacks
* Ruby 2.3.x
* Rails 5.1.2
* MySQL2
* Rspec
* Puma
* Redis
* Sidekiq

## Installation
Clone the repository
```
$ git clone git@github.com:movefast-llc/japanhaul-rails.git
```

Initialize a new gemset then install bundler
```
$ gem install bundler
```

Install dependencies
```
bundle install
```

Ask for secrets.yml
```
$ vim config/secrets.yml
```

Install redis
```
Follow this link: https://redis.io/topics/quickstart
```

Install MySQL
```
$ brew install mysql
```

## Setup
Setup database
```
$ bundle exec rake db:setup
```

## Testing
Install phantomjs for headless browser testing
```
For Mac OSX,
$ brew install phantomjs
```

Run the tests
```
$ bundle exec rspec spec
```

## Protocol
1. Ask someone on the team to add you to Jira.
2. Login to the TokyoTreat Jira account here: https://tokyotreat.atlassian.net/
3. Look for cards in the current sprint that are assigned to you.
4. When you start a card, move the card to In Progress
5. When opening a pull request, move the card to the Code Review list and ask in Slack for a review.
6. Once your pull request passes CI, ask someone to review your code.
7. Once someone has reviewed your code and approved to merge it to master, you can then deploy it to staging and move the card to the Acceptance Testing list.
8. When the card is in Acceptance Testing it should be assigned to someone on the product side to review.
9. The person accepting the feature will then leave an "Approved" comment and assign the card back or give feedback to work on.
10. Finally, once acceptance testing is complete, let everyone know you are about to deploy to production and deploy

## Start-Up Everything
```
$ redis-server
$ bundle exec sidekiq -C config/sidekiq.yml
$ rails s
```

## Deployment
Staging: `cap staging deploy`
Production: `cap production deploy`
