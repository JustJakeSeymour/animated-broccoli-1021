class DoctorPatientsController < ApplicationController
  def destroy
    # id's have been reversed in params using button_to helper... 
    # I will investigate how to propperly swap these if I have time.
    
    DoctorPatient.destroy(params[:doctor_id])
    
    redirect_to doctor_path(params[:id])
  end
end