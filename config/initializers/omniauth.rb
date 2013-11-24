OmniAuth.config.logger = Rails.logger

ENV['FACEBOOK_APP_ID'] = "221801117988594"
ENV['FACEBOOK_SECRET'] = "eb073f312e0c755c09d8a64c9901a215"

# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_SECRET']
# end