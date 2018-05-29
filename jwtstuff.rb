# frozen_string_literal: true

require 'rbnacl/libsodium'
require 'json'
require 'jwt'

payload = { data: 'test' }

# hmac_secret = 'my$ecretK3y'
# token = JWT.encode payload, hmac_secret, 'HS256'

seed = 'abcdefghijklmnopqrstuvwxyzABCDEF'
private_key = RbNaCl::Signatures::Ed25519::SigningKey.new(seed)
public_key = private_key.verify_key
puts "Private Key: #{private_key}"

token = JWT.encode payload, private_key, 'ED25519'

puts "Token:\n#{token}"

# decoded_token = JWT.decode token, hmac_secret, true, algorithm: 'HS256'

decoded_token = JWT.decode token, public_key, true, algorithm: 'ED25519'

puts "Decoded:\n#{decoded_token}"
