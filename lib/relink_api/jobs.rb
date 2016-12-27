# Methods for working with Jobs
# API docs: https://docs.relinklabs.com/marlowe/#Jobs
require 'httparty'

module RelinkApi
  module Jobs

    CREATE_REQUIRED_PARAMS = %w(accountId companyName companyUrl
                                title description location)
    CREATE_LOCATION_PARAMS = %w(name cc coords)
    CREATE_COORDS_PARAMS   = %w(lat lon)

    CREATE_URL = "/jobs"
    INDEX_URL  = "/jobs"
    SHOW_URL   = "/jobs/"
    DELETE_URL = "/jobs/"

    def self.create(params = {})
      params = RelinkApi.transform_params(params)

      RelinkApi.check_params_presence(present:  params,
                                      required: CREATE_REQUIRED_PARAMS)
      RelinkApi.check_params_presence(present:  params["location"],
                                      required: CREATE_LOCATION_PARAMS)
      RelinkApi.check_params_presence(present:  params["location"]["coords"],
                                      required: CREATE_COORDS_PARAMS)


      HTTParty.post(RelinkApi.config.api_base_url + CREATE_URL,
                    body:    params.to_json,
                    headers: RelinkApi.authentication_header)
    end

    def self.index(params = {})
      params = RelinkApi.transform_params(params)

      HTTParty.get(RelinkApi.config.api_base_url + INDEX_URL,
                   query: params,
                   headers: RelinkApi.authentication_header)
     end

    def self.show(id)
      HTTParty.get(RelinkApi.config.api_base_url + SHOW_URL + id,
                   headers: RelinkApi.authentication_header)
    end

    def self.delete(id)
      HTTParty.get(RelinkApi.config.api_base_url + DELETE_URL + id,
                   headers: RelinkApi.authentication_header)
    end

  end
end
