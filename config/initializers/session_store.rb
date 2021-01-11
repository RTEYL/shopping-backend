Rails.application.config.session_store :cookie_store, {
  key: "_shopping_app_session",
  expire_after: 14.days,
  cookie_only: true,
  httponly: true,
<<<<<<< HEAD
  domain: '.devtylerjones.com',
=======
  domain: :all,
  secure: Rails.env.production?
>>>>>>> 1f2bcfc0cb6fbf2c0b53fe7b2db8d59e879682b4
}
