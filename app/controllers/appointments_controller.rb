class AppointmentsController < ApplicationController
  def index
    @appointments = Appointment.all
  end

  def create
    appointment_datetime = DateTime.parse(params[:datetime])
    @appointment = Appointment.new(user: current_user, scheduled_at: appointment_datetime)

    if @appointment.save
      redirect_to appointments_path, notice: "Cita reservada correctamente"
    else
      redirect_to appointments_path, alert: "No se pudo reservar la cita"
    end

    respond_to do |format|
      if @appointment.save
        format.js
      else
        format.js { render js: "alert('No se pudo crear la cita');" }
      end
    end

  end

    def destroy
    @appointment = current_user.appointments.find(params[:id])
    @appointment.destroy
    redirect_to "/users/#{current_user.id}", notice: 'Cita cancelada correctamente.'
  end
end
