class ApplicationController
  # This default ApplicationController is here to give you some helper methods
  # This means if your controller inherits from ApplicationController (which they should)
  # You will always have access to the request and params methods
  def initialize(request)
    @request = request
  end

  def request
    @request
  end

  def params
    @request[:params]
  end
end
