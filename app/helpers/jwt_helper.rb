# jwt_helper.rb
module JwtHelper
  def self.encode(payload)
    JWT.encode(payload, ENV['JWT_SECRET_KEY'], 'HS256')
  end

  def self.decode(token)
    JWT.decode(token, ENV['JWT_SECRET_KEY'], true, algorithm: 'HS256')
  rescue JWT::DecodeError
    nil
  end
end
