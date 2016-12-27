module RelinkApi

  API_BASE_URL = "http://marlowe.relinklabs.com".freeze

  class << self
    attr_accessor :config
  end

  def self.configure
    self.config ||= Configuration.new
    yield(config)
  end

  class Configuration
    attr_accessor :api_key
    attr_accessor :api_secret
    attr_accessor :api_base_url
    attr_accessor :notification_url
    attr_accessor :account_id

    def initialize
      @api_base_url = API_BASE_URL
    end
  end

end
