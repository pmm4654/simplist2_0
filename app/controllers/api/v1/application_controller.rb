class Api::V1::ApplicationController < ActionController::API
  include Response
  include ExceptionHandler

  # called before every action on controllers
  before_action :authorize_request
  attr_reader :current_user

  private

  # Check for valid request token and return user
  def authorize_request
    # TODO: Implement API auth
    # @current_user = (AuthorizeApiRequest.new(request.headers).call)[:user]
  end
end