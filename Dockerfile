FROM ruby:3.1.2-alpine3.16

RUN apk -U --no-cache upgrade

RUN gem install octokit -v 4.24.0

COPY action.rb /action.rb
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
