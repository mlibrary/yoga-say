require 'say'

RSpec.describe Say do
  describe "#in_english" do
    subject { Say.new(0) }
    it { expect(subject.english).to eq('zero') }
  end
end

