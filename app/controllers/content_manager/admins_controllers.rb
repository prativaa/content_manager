# rubocop:disable Style/ClassAndModuleChildren
require_dependency "content_manager/application_controller"

module ContentManager
  class AdminsController < ApplicationController
  include SessionsHelper
  helper_method :log_in
  helper_method :site_name
  layout 'admin'

  protected

  def authenticate_admin!
    return true if logged_admin_in?
    redirect_to admin_login_path
  end
end
