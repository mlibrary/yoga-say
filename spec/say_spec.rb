require 'say'
RSpec.describe Say do
  describe "#in_english" do
    subject { Say.new(0) }
    it "gives zero" do
      expect(subject.in_english).to eq('zero')
    end
  end
end

