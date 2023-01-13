class PatientsController < ApplicationController
  def index
    @patients = Patient.all_adults_alphabetical
  end
end