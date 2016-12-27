require "base64"
require "httparty"

module RelinkApi

  class Client

    attr_reader :token

    def authenticate
      raise MissingAPICredentials unless RelinkApi.config.api_key &&
                                         RelinkApi.config.api_secret

      response = HTTParty.get(RelinkApi.config.api_base_url + "/token",
                         headers: authentication_header)

      if response.code == 200
        body = JSON.parse(response.body)
        @token = body['token']
      else
        raise AuthenticationError
      end

    end

    private

      def authentication_header
        plain_string = RelinkApi.config.api_key + ':' +
                       RelinkApi.config.api_secret
        b64_string   = Base64.strict_encode64(plain_string)

        {"Authorization" => "Basic #{b64_string}"}
      end
  end

end
