Rails.application.config.middleware.use OmniAuth::Builder do
  provider :mail_ru, '750058', '8dd615c0cc2b7704ae88c2f008975eef'
end
