class AdminController < ApplicationController
  before_action :authorize_admin!
  def index
    @services = Service.all
  end

  def destroy_user
    if params[:user_id].present?
      User.where(id: params[:user_id]).delete_all
      flash[:notice] = "Usuario eliminado correctamente"
    else
      flash[:alert] = "No se seleccionó un usuario"
    end
    redirect_to admin_path
  end

  def cancel_appointment
    if params[:appointment_id].present?
      Appointment.where(id: params[:appointment_id]).delete_all
      flash[:notice] = "Cita cancelada correctamente"
    else
      flash[:alert] = "No se seleccionó una cita"
    end
    redirect_to admin_path
  end

  def delete_service
    @service = Service.find(params[:id])
    @service.destroy
    redirect_to admin_path, notice: "Servicio eliminado correctamente."
  end

  def update_service

    @service = Service.find(params[:id])

    if @service.update(service_params)
      redirect_to admin_path, notice: "Servicio actualizado correctamente."
    else
      redirect_to admin_path, alert: "Error al actualizar el servicio."
    end
  end

  def create_service
    @service = Service.new(service_params)

    if @service.save
      redirect_to admin_path, notice: "Servicio creado correctamente"
    else
      redirect_to admin_path, alert: "Error al crear el servicio"
    end
  end

  private

  def authorize_admin!
    unless current_user&.role == "admin"
      redirect_to root_path, alert: "Acceso no autorizado"
    end
  end
  
  def service_params
    params.require(:service).permit(:name, :description, :price)
  end

end
