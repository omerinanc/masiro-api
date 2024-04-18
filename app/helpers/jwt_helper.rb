# app/helpers/jwt_helper.rb
module JwtHelper
    SECRET_KEY = Rails.application.secrets.secret_key_base
  
    def self.encode(payload)
      JWT.encode(payload, SECRET_KEY, 'HS256')
    end
  
    def self.decode(token)
      JWT.decode(token, SECRET_KEY, true, algorithm: 'HS256')
    rescue JWT::DecodeError
      nil
    end
  end
  