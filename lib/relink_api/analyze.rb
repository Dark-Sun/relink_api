# Methods for working with AnAlyze
# API docs: https://docs.relinklabs.com/marlowe/#Analyze
require 'httparty'

module RelinkApi
  module Analyze

    CREATE_REQUIRED_PARAMS         = %w(jobId profile)
    CREATE_PROFILE_REQUIRED_PARAMS = %w(name summary positions
                                      email skills educations)

    CREATE_URL             = "/analyze".freeze

    def self.create(params = {})
      params = RelinkApi.transform_params(params)

      RelinkApi.check_params_presence(present:  params,
                                      required: CREATE_REQUIRED_PARAMS)

      RelinkApi.check_params_presence(present:  params['profile'],
                                      required: CREATE_PROFILE_REQUIRED_PARAMS)

      HTTParty.post(RelinkApi.config.api_base_url + CREATE_URL,
                    body:    params.to_json,
                    headers: RelinkApi.authentication_header)
    end

  end
end
