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