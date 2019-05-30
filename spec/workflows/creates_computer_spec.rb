RSpec.describe CreatesComputer do
  it "creates a computer with the right number of parts" do
    me = Account.create(name: "Me")

    narrow_sieve = Part.create(name: "Narrow sieve", part: "GPU", compatibility: 1, account: me)
    mysterious_torus = Part.create(name: "Mysterious torus", part: "GPU", compatibility: 1, account: me)

    my_computer = CreatesComputer.new(
      account: me.id,
      parts: [narrow_sieve, mysterious_torus])
    my_computer.create
    expect(my_computer.success?).to be true
    expect(my_computer.computer.parts.size).to be 2
  end

end
