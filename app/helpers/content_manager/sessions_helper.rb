module ContentManager
  module SessionsHelper
    def log_in(admin)
      session[:admin_id] = admin.id
    end

    def current_admin
      @current_admin ||= Admin.find_by(id: session[:admin_id])
    end

    def logged_admin_in?
      !current_admin.nil?
    end
  end
end
