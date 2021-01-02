Rails.application.config.session_store :cookie_store, key: "_shopping_app"
Rails.application.config.session_store :cookie_store, expire_after: 14.days
Rails.application.config.session_store :cookie_store, httponly: true