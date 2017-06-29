require 'say'

RSpec.describe Say do
  MINIMUM = 0
  MAXIMUM = 999_999_999_999
  let(:number) { double("number") }
  let(:say) { Say.new(number) }

  describe "#in_english" do
    context 'one under maximum' do
      let(:number) { -1 }
      subject { say.in_english }
      it { expect(subject).to eq("minus one") }
    end

    context 'one over maximum' do
      let(:number) { -1 }
      subject { say.in_english }
      it { expect(subject).to eq("minus one") }
    end

    context 'min' do
      let(:number) { 0 }
      subject { say.in_english }
      it { expect(subject).to eq("zero") }
    end

    context 'max' do
      let(:number) { 999_999_999_999 }
      subject { say.in_english }
      it { expect(subject).to eq("nine hundred ninety-nine billion nine hundred ninety-nine million nine hundred ninety-nine thousand nine hundred ninety-nine") }
    end

    context 'zero' do
      let(:number) { 0 }
      subject { say.in_english }
      it { expect(subject).to eq('zero') }
    end

    context 'one' do
      let(:number) { 1 }
      subject { say.in_english }
      it { expect(subject).to eq('one') }
    end

    context 'two' do
      let(:number) { 2 }
      subject { say.in_english }
      it { expect(subject).to eq('two') }
    end
  end
end

