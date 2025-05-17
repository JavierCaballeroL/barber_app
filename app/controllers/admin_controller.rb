class AdminController < ApplicationController
  before_action :authorize_admin!
  def index
  end



  private

  def authorize_admin!
    unless current_user&.role == "admin"
      redirect_to root_path, alert: "Acceso no autorizado"
    end
  end

end
