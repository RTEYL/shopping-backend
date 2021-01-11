Rails.application.config.session_store :cookie_store, {
  key: "_shopping_app_session",
  expire_after: 14.days,
  cookie_only: true,
  httponly: true,
  domain: :all,
}
