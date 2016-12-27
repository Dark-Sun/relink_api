require "extensions/string"
require "extensions/hash"

require "relink_api/version"
require "relink_api/configuration"
require "relink_api/client"
require "relink_api/jobs"
require "relink_api/social"
require "relink_api/analyze"
require "relink_api/exceptions"

module RelinkApi

  def self.authenticate
    raise MissingAPICredentials unless self.config
                                       self.config.api_key    &&
                                       self.config.api_secret &&
                                       self.config.account_id

    self.client.authenticate
  end

  def self.authentication_header
    raise NotAuthorized         unless client.token

    { "Authorization" => "Bearer #{client.token}",
      "Content-Type"  => "application/json",
      "Accept"        => "application/json" }
  end

  def self.client
    @client ||= Client.new
    @client
  end

  protected

  def self.check_params_presence(present:, required:)
    required.each do |key|
      raise "#{key} key missing" unless present.has_key?(key)
    end
  end

  def self.camelize_params(params)
    new_params = {}

    params.each do |key, value|
      new_value = value.is_a?(Hash) ? camelize_params(value) : value
      new_params[key.to_s.camelizify] = new_value
    end

    new_params
  end

  def self.transform_params(params)
    params.merge({"accountId": RelinkApi.config.account_id})
          .deep_stringify_keys
          .deep_camelize_keys
  end

end
