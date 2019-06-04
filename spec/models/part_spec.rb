require 'rails_helper'

RSpec.describe Part, type: :model do

  describe "compatible?" do
    let(:partFAKE) {FactoryBot.build_stubbed(:part)}
    let(:partFAKE2) {FactoryBot.build_stubbed(:part)}
    let(:partPART2) {FactoryBot.build_stubbed(:part, :part2)}
    let(:partCOMPAT3) {FactoryBot.build_stubbed(:part)}
    let(:parta) {FactoryBot.build_stubbed(:part, :compatibility2, :part1, :asus)}
    let(:partb) {FactoryBot.build_stubbed(:part, :compatibility2, :part2, :gygabite)}
    let(:partc) {FactoryBot.build_stubbed(:part, :compatibility2, :part3, :amd)}

    it "allows the parts array to contain nil" do
      expect(Part.compatible? [parta, partb,nil]).to be_truthy
    end

    it "allows parts with the same name" do
      expect(Part.compatible? [partFAKE, partFAKE2]).to be_truthy
    end

    it "doesn't allow parts with the same part type" do
      expect(Part.compatible? [partPART2, partb]).to be_falsey
    end

    it "doesn't allow parts that don't share the same compatibility number" do
      expect(Part.compatible? [partCOMPAT3, partc]).to be_falsey
    end 

    it "This is the happy path where all parts names and types are diffrent but compatibility number is the same" do
      expect(Part.compatible? [partb, partc]).to be_truthy
    end

  end 

  describe "unit test for Big_dependency" do
    let(:parta) {FactoryBot.build_stubbed(:part, :compatibility2, :part1, :asus)}

    #it "gets value from performace that is 42" do
      #expect(parta.perform(BigDependency.new)).to eq(42)
    #end
    
    it "gets value from perform with out waiting (mock)" do
      expect(parta).to receive(:perform).and_return(42)
      result = parta.perform(BigDependency.new)
    end

    it "stubs parta" do 
      allow(parta).to receive(:perform).and_return(42)
      result = parta.perform(BigDependency.new)
      expect(result).to eq(42)
    end

  end

end
