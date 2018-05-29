# frozen_string_literal: true

require 'rspec'
require 'rbnacl/libsodium'
require 'json'
require 'jwt'

RSpec.describe 'foo' do
  context 'with HMAC' do
    let(:secret) { 'my$ecretK3y' }
    let(:token) { JWT.encode payload, secret, 'HS256' }
    let(:payload) { { 'data' => 'test' } }

    it 'creates a JWT string' do
      expect(token).to be_a(String)
      expect(token).to start_with('ey')
    end

    it 'can do a simple roundtrip' do
      decoded_payload, header = JWT.decode token, secret, true, algorithm: 'HS256'
      expect(header['alg']).to eq('HS256')
      expect(decoded_payload).to eq(payload)
    end
  end
end
