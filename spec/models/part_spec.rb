require 'rails_helper'

RSpec.describe Part, type: :model do

  it "doesn't allow a NULL input" do
    parta = Part.new(name: "fake", part: "part", compatability: 1)
    partb = Part.new(name: "name", part: "part", compatability: 1)
    expect(parta.compare(partb,nil)).to be_falsey
  end

  it "doesn't allow parts with the same name" do
    parta = Part.new(name: "name", part: "part", compatability: 1)
    partb = Part.new(name: "fake", part: "part", compatability: 1)
    partc = Part.new(name: "fake", part: "part", compatability: 1)
    expect(parta.compare(partb,partc)).to be_falsey
  end

  it "doesn't allow parts with the same part type" do
    parta = Part.new(name: "amd", part: "part", compatability: 1)
    partb = Part.new(name: "asus", part: "part1", compatability: 1)
    partc = Part.new(name: "gygabite", part: "part1", compatability: 1)
    expect(parta.compare(partb,partc)).to be_falsey
  end

  it "doesn't allow parts that don't share the same compatability number" do
    parta = Part.new(name: "amd", part: "part1", compatability: 1)
    partb = Part.new(name: "asus", part: "part2", compatability: 2)
    partc = Part.new(name: "gygabite", part: "part3", compatability: 3)
    expect(parta.compare(partb,partc)).to be_falsey
  end 

  it "This is the happy path where all parts names and types are diffrent but compatability number is the same" do
    parta = Part.new(name: "amd", part: "part1", compatability: 1)
    partb = Part.new(name: "asus", part: "part2", compatability: 1)
    partc = Part.new(name: "gygabite", part: "part3", compatability: 1)
    expect(parta.compare(partb,partc)).to be_truthy
  end
end
