require 'rails_helper'

RSpec.describe Computer, type: :model do
  let(:partA) {FactoryBot.build_stubbed(:part, :compatibility2, :part1, :asus)}
  let(:partB) {FactoryBot.build_stubbed(:part, :compatibility2, :part2, :gygabite)}
  let(:partC) {FactoryBot.build_stubbed(:part, :compatibility3, :part3, :amd)}
  let(:compyA) {FactoryBot.build_stubbed(:computer)}
  let(:compyB) {FactoryBot.build_stubbed(:computer, :owner1, :myPC)}
  let(:compyC) {FactoryBot.build_stubbed(:computer, :owner1, :myPC, parts: [partA, partB])}

  describe "computer unit tests" do
    it "can add parts" do
      compyA.add_part(partA)
      expect(compyA.sizeOf).to eql(1)
    end

    it "doesn't allow NULL entries" do
      # uses the custom matcher "return_an_error"
      expect(compyA.add_part(nil)).to return_an_error
    end

    it "allows multiple parts with the same name" do
      # there are some things like RAM, video cards, or even CPUs that
      # a computer can have duplicates of. If we want, we can later
      # filter things out like motherboards that should be a one-of
      compyB.add_part(partA)
      compyB.add_part(partA)
      expect(compyB.sizeOf).to eql(2)
      expect(compyB).to be_valid
    end

    it "can check the compatibility of parts inside it" do
      # good case
      compyB.add_part(partA)
      compyB.add_part(partB)
      expect(compyB.valid?).to be_truthy

      # add a bad part
      compyB.add_part(partC)
      expect(compyB.valid?).to be_falsey
    end

    it "can start with parts inside it" do
      expect(compyC.sizeOf).to eql(2)
      expect(compyC.valid?).to be_truthy
    end

    it "is valid with no data" do
      my_computer = Computer.new
      expect(my_computer).to be_valid
    end

    it "is invalid if its parts are incompatible" do
      expect(compyA).to be_valid
      compyA.parts << partA
      compyA.parts << partC
      expect(compyA).to be_invalid
    end

    it "is valid if its parts are compatible" do
      expect(compyA).to be_valid
      compyA.parts << partA
      compyA.parts << partB
      expect(compyA).to be_valid
    end
  end

  #to test everything, remove ":focus"
  describe "requires big_dependency" do
    # it "checks the dependency" do
      # compyA.add_part(partA)
      # result = compyA.performanceCheck(BigDependency.new)
      # expect(result).to eql(69)
    # end

    it "checks the dependency but with a mock" do
      expect(compyA).to receive(:performanceCheck).and_return(69)
      result = compyA.performanceCheck(BigDependency.new)
    end

    it "checks the dependency but with a stub" do
      allow(compyA).to receive(:performanceCheck).and_return(69)
      result = compyA.performanceCheck(BigDependency.new)
      expect(result).to eql(69)
    end

    it "checks the dependency but with a fake" do
      fakeDependency = double()
      expect(fakeDependency).to receive(:execute).and_return(nil)
      result = compyA.performanceCheck(fakeDependency)
      expect(result).to eql(69)
    end

    it "checks the dependency but with multiple fakes" do
      fakeCompy = double()
      expect(fakeCompy).to receive(:performanceCheck).and_return(69)
      fakeDependency = double()

      result = fakeCompy.performanceCheck(fakeDependency)
      expect(result).to eql(69)
    end
  end
end

