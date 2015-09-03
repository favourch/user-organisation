# mailcatcher defaults
mail_config = {
  host: 'localhost',
  port: 1025
}

Mail.defaults { delivery_method :smtp, mail_config }

Mail.defaults { delivery_method :test } if Rails.env.test?
