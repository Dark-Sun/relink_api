# Methods for working with Jobs
# API docs: https://docs.relinklabs.com/marlowe/#Jobs
require 'httparty'

module RelinkApi
  module Jobs

    CREATE_REQUIRED_PARAMS = %w(account_id company_name company_url
                                title description location)
    CREATE_URL = "/jobs"

    def create(*params)
      RelinkApi.check_params_presence(CREATE_REQUIRED_PARAMS)

      HTTParty.post(RelinkApi.config.api_base_url + CREATE_URL,
                    params.camelize)
    end      

  end
end
