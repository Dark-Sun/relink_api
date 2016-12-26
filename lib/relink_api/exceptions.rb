module RelinkApi

  class MissingAPICredentials < StandardError
  end

  class AuthenticationError < StandardError
  end

  class NotAuthorized < StandardError
  end

  class MissingParams < StandardError
  end

end
