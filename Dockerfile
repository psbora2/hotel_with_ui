# Use an official Ruby image as the base
FROM ruby:2.6

# Set environment variables
ENV BUNDLE_PATH=/gems \
    BUNDLE_BIN=/gems/bin \
    PATH=/gems/bin:$PATH

# Install system dependencies
RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs \
    yarn

ENV APP_HOME /app


# Set the working directory inside the container
WORKDIR $APP_HOME

# Copy the Gemfile and Gemfile.lock into the container
COPY Gemfile ./

RUN ruby -v

# # RUN bundle update --bundler

RUN bundle install
# Copy the Rails application into the container
COPY . $APP_HOME

# Expose port 3000 for the app

RUN bundle exec rake assets:precompile
EXPOSE 3000

# Command to run the app
CMD ["rails", "server", "-b", "0.0.0.0", "-p", "3000"]
