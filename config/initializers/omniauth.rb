OmniAuth.config.full_host = Rails.env.production? ? 'https://dive-squad.herokuapp.com' : 'http://localhost:3000'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2,
    ENV['GOOGLE_CLIENT_ID'],
    ENV['GOOGLE_CLIENT_SECRET'],
    {
      skip_jwt: true,
      scope: [
      'https://www.googleapis.com/auth/drive',
      'https://spreadsheets.google.com/feeds/',
      'email'
    ] }
end
