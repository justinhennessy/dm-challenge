OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '143993919122908', 'a6c2ca03d8d93818f99e1f08162179ca'
end
