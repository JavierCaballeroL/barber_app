class AppointmentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @appointments = Appointment.all
  end

  def create
  appointment_datetime = DateTime.parse(params[:datetime])
  @appointment = Appointment.new(user: current_user, scheduled_at: appointment_datetime)

  respond_to do |format|
    if appointment_datetime.present? && appointment_datetime > Time.current
      if @appointment.save
        format.html { redirect_to user_path(current_user), notice: "Cita reservada correctamente" }
        format.js
      else
        format.html { redirect_to appointments_path, alert: "No se pudo reservar la cita" }
        format.js { render js: "alert('No se pudo crear la cita');" }
      end
    else
      format.html { redirect_to appointments_path, alert: "No se puede reservar una fecha pasada" }
      format.js { render js: "alert('No se puede reservar una fecha pasada');" }
    end
  end
end


    def destroy
    @appointment = current_user.appointments.find(params[:id])
    @appointment.destroy
    redirect_to "/users/#{current_user.id}", notice: 'Cita cancelada correctamente.'
  end
end
