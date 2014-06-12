require 'dawn/api/base_api'

module Dawn
  class Key

    include BaseApi

    attr_reader :data

    def initialize(data)
      @data = data
    end

    data_key :id
    data_key :created_at
    data_key :updated_at
    data_key :fingerprint
    data_key :key

    def destroy
      request(
        method: :delete,
        expects: 200,
        path: "/account/keys/#{id}"
      )
    end

    def self.add(pubkey)
      new json_request(
        method: :post,
        expects: 200,
        path: '/account/keys',
        query: { key: pubkey }
      )["key"]
    end

    def self.get(id)
      new json_request(
        method: :get,
        expects: 200,
        path: "/account/keys/#{id}"
      )["key"]
    end

    def self.all(options={})
      json_request(
        method: :get,
        expects: 200,
        path: '/account/keys',
        query: options
      ).map { |hsh| new(hsh["key"]) }
    end

    def self.destroy(options={})
      request(
        method: :delete,
        expects: 200,
        path: "/account/keys/#{options[:id]}"
      )
    end

    class << self
      private :new
    end

  end
end
