RSpec::Matchers.define :return_an_error do
  match do |actual|
    actual.match(/\w/) != nil
  end
end


=begin
RSpec::Matchers.define :return_an_error do |expected|
  match do |actual|
    actual == expected
  end
end
=end