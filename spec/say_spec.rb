require 'say'

RSpec.describe Say do
  let(:number) { double("number") }
  let(:say) { Say.new(number) }
  describe "#in_english" do
    context 'zero' do
      let(:number) { 0 }
      subject { say.in_english }
        it { expect(subject).to eq('zero') }
    end
  end
end

