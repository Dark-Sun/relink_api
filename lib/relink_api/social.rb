# Methods for working with Social
# API docs: https://docs.relinklabs.com/marlowe/#Social
require 'httparty'

module RelinkApi
  module Social

    GET_URL    = "/social".freeze

    def self.show(email:)
      HTTParty.get(RelinkApi.config.api_base_url + GET_URL + "?email=" + email,
                   headers: RelinkApi.authentication_header)
    end

  end
end
