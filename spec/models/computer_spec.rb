require 'rails_helper'

RSpec.describe Computer, type: :model do
  it "can add parts" do
	compy = Computer.new(name: "computer name", owner: "guy", parts: [])
	partA = Part.new(name: "fake", part: "part", compatability: 1)
	compy.add_part(partA)
	
	expect(compy.sizeOf).to eql(1)
  end
  
  it "doesn't allow NULL entries" do
    # uses the custom matcher "return_an_error"
    compy = Computer.new(name: "computer name", owner: "guy", parts: [])
	expect(compy.add_part(nil)).to return_an_error
  end
  
  it "allows multiple parts with the same name" do
    # there are some things like RAM, video cards, or even CPUs that
	# a computer can have duplicates of. If we want, we can later 
	# filter things out like motherboards that should be a one-of
	compy = Computer.new(name: "computer name", owner: "guy", parts: [])
    partA = Part.new(name: "fake", part: "part", compatability: 1)
	
	compy.add_part(partA)
	compy.add_part(partA)
	expect(compy.sizeOf).to eql(2)
  end
  
  
  it "can check the compatability of parts inside it" do
    compy = Computer.new(name: "computer name", owner: "guy", parts: [])
    partA = Part.new(name: "fake", part: "part", compatability: 1)
	partB = Part.new(name: "other fake", part: "other part", compatability: 1)
	
	# good case
	compy.add_part(partA)
	compy.add_part(partB)
	expect(compy.valid?).to be_truthy
	
	# add a bad part
	partC = Part.new(name: "bad fake", part: "bad part", compatability: 999)
	compy.add_part(partC)
	expect(compy.valid?).to be_falsey
  end
end
