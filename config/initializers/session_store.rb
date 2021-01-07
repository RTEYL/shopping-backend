Rails.application.config.session_store :cookie_store, key: "_shopping_app_session", secure: true
Rails.application.config.session_store :cookie_store, expire_after: 14.days
Rails.application.config.session_store :cookie_store, httponly: true
Rails.application.config.session_store :cookie_store, domain: :all