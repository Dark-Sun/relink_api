# Methods for working with AnAlyze
# API docs: https://docs.relinklabs.com/marlowe/#Analyze
require 'httparty'

module RelinkApi
  module Analyze

    POST_REQUIRED_PARAMS         = %w(job_id profile)
    POST_PROFILE_REQUIRED_PARAMS = %w(name summary positions
                                      email skills educations)

    POST_URL             = "/analyze".freeze

    def self.post(*params)
      RelinkApi.check_params_presence(params, POST_REQUIRED_PARAMS)
      RelinkApi.check_params_presence(params['profile'], POST_PROFILE_REQUIRED_PARAMS)

      HTTParty.get(RelinkApi.api_base_url + POST_URL, params)
    end

  end
end
