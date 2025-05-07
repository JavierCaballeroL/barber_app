class AppointmentsController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.json do
        appointments = Appointment.all
        render json: appointments.map { |a|
          {
            id: a.id,
            title: a.user.first_name,
            start: a.start_time,
            end: a.end_time
          }
        }
      end
    end
  end
  
  def new
    @appointment = Appointment.new(start_time: params[:date])
  end
end
