class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  include CanCan::ControllerAdditions

  # TODO: Remove this line.
  skip_before_action :verify_authenticity_token
end
