describe Array do
  it "deveria adicionar um elemento no array" do
    array = []
    array << 10
    expect(array).to have(1).item

    expect(array.first).to be_a_multiple_of(2)
  end
end

RSpec::Matchers.define :be_a_multiple_of do |expected|
	match do |actual|
		actual % expected == 0
	end

	failure_message_for_should_not do |actual|
	    "expected that #{actual} would not be a multiple of #{expected}"
	end

	description do
	    "expected that #{actual} should be a multiple of #{expected}"
	end
end
