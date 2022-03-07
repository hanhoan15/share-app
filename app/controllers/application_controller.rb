class ApplicationController < ActionController::Base
  before_action :set_current_user

  def set_current_user
    @current_user = current_user
    @new_user = User.new
  end
end
