# frozen_string_literal: true

require 'json'
require 'jwt'

payload = { data: 'test' }

hmac_secret = 'my$ecretK3y'

token = JWT.encode payload, hmac_secret, 'HS256'

puts "Token:\n#{token}"

decoded_token = JWT.decode token, hmac_secret, true, algorithm: 'HS256'

puts "Decoded:\n#{decoded_token}"
