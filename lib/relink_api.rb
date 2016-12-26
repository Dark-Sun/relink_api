require "extensions/string"

require "relink_api/version"
require "relink_api/configuration"
require "relink_api/client"
require "relink_api/jobs"
require "relink_api/social"
require "relink_api/analyze"
require "relink_api/exceptions"

module RelinkApi

  def self.authenticate
    self.client.authenticate
  end

  def self.authentication_header
    raise NotAuthorized unless client.token
    {"Authorization" => "Bearer #{client.token}"}
  end

  def self.client
    @client ||= Client.new
    @client
  end

  protected

  def self.check_params_presence(present:, required:)
    result = !required.each { |key| present.has_key?(key) }.include?(false)
    raise MissingParams unless result
    result
  end

end
