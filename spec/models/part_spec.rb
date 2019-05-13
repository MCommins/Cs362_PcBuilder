require 'rails_helper'

RSpec.describe Part, type: :model do

  describe "unit testing for part" do 
    let(:partFAKE) {FactoryBot.build_stubbed(:part)}
    let(:partFAKE2) {FactoryBot.build_stubbed(:part)}
    let(:partPART2) {FactoryBot.build_stubbed(:part, :part2)}
    let(:partCOMPAT3) {FactoryBot.build_stubbed(:part)}
    let(:parta) {FactoryBot.build_stubbed(:part, :compatability2, :part1, :asus)}
    let(:partb) {FactoryBot.build_stubbed(:part, :compatability2, :part2, :gygabite)}
    let(:partc) {FactoryBot.build_stubbed(:part, :compatability2, :part3, :amd)}

    it "doesn't allow a NULL input" do
      expect(parta.compare(partb,nil)).to be_falsey
    end

    it "doesn't allow parts with the same name" do
      expect(parta.compare(partFAKE,partFAKE2)).to be_falsey
    end

    it "doesn't allow parts with the same part type" do
      expect(parta.compare(partPART2,partb)).to be_falsey
    end

    it "doesn't allow parts that don't share the same compatability number" do
      expect(parta.compare(partCOMPAT3,partc)).to be_falsey
    end 

    it "This is the happy path where all parts names and types are diffrent but compatability number is the same" do
      expect(parta.compare(partb,partc)).to be_truthy
    end

  end 

end
