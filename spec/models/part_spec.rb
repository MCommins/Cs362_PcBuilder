<<<<<<< HEAD
require "rails_helper"

RSpec.describe Part do 

  let(:part) { Part.new("Sapphire 580", "GPU", 3) }

  it "has a name" do 
    expect(part.name).to be_a(String)
  end

  it "has a meaningful compatibility number" do
    expect(part.compatibility).to be_a(Integer)
	expect(part.compatibility).to be >= 0
  end

end
=======
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

  describe "unit test for Big_dependency" do
    let(:parta) {FactoryBot.build_stubbed(:part, :compatability2, :part1, :asus)}

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
>>>>>>> 958655b0d0ce8f00f1cde7d8b48c03fe4bb7e13c
