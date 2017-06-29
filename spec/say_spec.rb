require 'say'

RSpec.describe Say do
  let(:number) { double("number") }
  let(:say) { Say.new(number) }

  describe '#in_english' do
    subject { say.in_english }

    context 'boundary conditions' do
      MINIMUM = 0
      MINIMUM_IN_ENGLISH = 'zero'
      MAXIMUM = 999_999_999_999
      MAXIMUM_IN_ENGLISH = 'nine hundred ninety-nine billion nine hundred ninety-nine million nine hundred ninety-nine thousand nine hundred ninety-nine'

      context 'below minimum' do
        let(:number) { MINIMUM-1 }
        it { expect { subject }.to raise_error(ArgumentError) }
      end
      context 'minimum' do
        let(:number) { MINIMUM }
        it { expect { subject }.to_not raise_error }
        it { expect(subject).to eq(MINIMUM_IN_ENGLISH) }
      end
      context 'maximum' do
        let(:number) { MAXIMUM }
        it { expect { subject }.to_not raise_error }
        it { expect(subject).to eq(MAXIMUM_IN_ENGLISH) }
      end
      context 'above maximum' do
        let(:number) { MAXIMUM+1 }
        it { expect { subject }.to raise_error(ArgumentError) }
      end
    end

    context 'ones' do
      context('zero') { let(:number) { 0 }; it { expect(subject).to eq('zero') } }
      context('one') { let(:number) { 1 }; it { expect(subject).to eq('one') } }
      context('two') { let(:number) { 2 }; it { expect(subject).to eq('two') } }
    end
  end
end

