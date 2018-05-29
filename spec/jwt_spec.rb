# frozen_string_literal: true

require 'rspec'
require 'jwt'

RSpec.describe 'JWT' do
  it 'can be used from different threads' do
    results = []
    mutex = Mutex.new

    threads = []
    8.times do
      threads << Thread.new do
        secret = "secret#{Thread.current.object_id}"
        payload = { 'data' => Thread.current.object_id }
        token = JWT.encode payload, secret, 'HS256'
        decoded, = JWT.decode token, secret, true, algorithm: 'HS256' do
          # Comment the following line (or switch back to jwt 2.1.0) to
          # make the spec pass:
          sleep(0.001)
          secret
        end
        mutex.synchronize { results << decoded['data'] }
      end
    end

    threads.each(&:join)
    thread_ids = threads.map(&:object_id)

    expect(results).to match_array(thread_ids)
  end
end
