Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :developer unless Rails.env.production?
  provider :cas, url: "https://auth.berkeley.edu/cas",
           login_url: "/login",
           logout_url: "/logout",
           on_single_sign_out: lambda { |strategy, options, ticket, user_info|
             redirect_to root_url
           }
end