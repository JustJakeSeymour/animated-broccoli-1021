require 'rails_helper'

RSpec.describe Patient, type: :model do
  let!(:patient1) {create(:patient, name: "Albert", age: 36)}
  let!(:patient2) {create(:patient, name: "Norbert", age: 70)}
  let!(:patient3) {create(:patient, name: "Hubert", age: 45)}
  let!(:patient4) {create(:patient, name: "Bert", age: 8)}

  describe "class methods" do
    it "all_adults" do
      expect(Patient.all_adults).to eq([patient1, patient2, patient3])
      expect(Patient.all_adults.include?(patient4)).to be false
    end
    
    it "all_adults_alphabetical" do
      expect(Patient.all_adults_alphabetical).to eq([patient1, patient3, patient2])

    end
  end
end
