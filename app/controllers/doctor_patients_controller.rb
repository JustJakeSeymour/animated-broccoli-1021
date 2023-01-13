class DoctorPatientsController < ApplicationController
  def destroy
    DoctorPatient.destroy(params[:doctor_id])
    
    redirect_to doctor_path(params[:id])
  end
end