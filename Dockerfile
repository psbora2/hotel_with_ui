# Use an official Ruby runtime as a parent image
FROM rails:4.2.5

# Set environment variables
# ENV RAILS_ENV production
ENV APP_HOME /app

# # Install system dependencies
# RUN apt-get update -qq && apt-get install -y \
#   build-essential \
#   libpq-dev \
#   nodejs

# Set the working directory inside the container
WORKDIR $APP_HOME

# Copy the Gemfile and Gemfile.lock into the container
COPY Gemfile Gemfile.lock ./

# Install Ruby dependencies
# RUN gem install racc -v '1.8.1'
# RUN bundle update nokogiri


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
