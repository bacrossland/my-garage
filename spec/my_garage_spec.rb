RSpec.describe MyGarage do
  it "has a version number" do
    expect(MyGarage::VERSION).not_to be nil
  end

  it "is available as described_class" do
    expect(described_class).to eq(MyGarage)
  end
end
