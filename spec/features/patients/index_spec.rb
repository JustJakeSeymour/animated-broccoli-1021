require 'rails_helper'

RSpec.describe "Patients Index" do
  let!(:patient1) {create(:patient, name: "Albert", age: 36)}
  let!(:patient2) {create(:patient, name: "Norbert", age: 70)}
  let!(:patient3) {create(:patient, name: "Hubert", age: 45)}
  let!(:patient4) {create(:patient, name: "Bert", age: 8)}

  describe "User Story 3" do
    it "lists all patients over 18" do
      visit patients_path

      expect(page).to have_content(patient1.name)
      expect(page).to have_content(patient2.name)
      expect(page).to have_content(patient3.name)
      expect(page).to_not have_content(patient4.name)
    end
    
    it "visible patients are sorted alphabetically (A-Z)" do
      visit patients_path

      expect(patient1.name).to appear_before(patient2.name)
      expect(patient1.name).to appear_before(patient3.name)
      expect(patient3.name).to appear_before(patient2.name)
      expect(page).to_not have_content(patient4.name)
    end
  end
end