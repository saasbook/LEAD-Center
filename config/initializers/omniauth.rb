Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :developer unless Rails.env.production?
  provider :cas, url: "https://auth-test.berkeley.edu/cas"
end