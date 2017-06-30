require 'say'
require 'number_in_english'

def context_number_match(number_hash)
  number_hash.each do |number_key, number_value_in_english|
    context("#{number_key}") { let(:number) { number_key }; it { expect(subject).to match(number_value_in_english) } }
  end
end

def context_power_match(power)
  context("10 ** #{power}") { let(:number) { 10 ** power }; it { expect(subject).to match(NumberInEnglish.powers_of_ten[power]) } }
end

def context_number_equal(value)
  context("#{value}") { let(:number) { value }; it { expect(subject).to eq(NumberInEnglish.number_to_english(value)) } }
end

RSpec.describe Say do
  let(:number) { double("number") }
  let(:say) { Say.new(number) }

  describe '#in_english' do
    subject { say.in_english }

    context 'boundary conditions' do
      context 'below minimum' do
        let(:number) { NumberInEnglish.MINIMUM-1 }
        it { expect { subject }.to raise_error(ArgumentError) }
      end
      context 'minimum' do
        let(:number) { NumberInEnglish.MINIMUM }
        it { expect { subject }.to_not raise_error }
        it { expect(subject).to eq(NumberInEnglish.number_to_english(number)) }
      end
      context 'maximum' do
        let(:number) { NumberInEnglish.MAXIMUM }
        it { expect { subject }.to_not raise_error }
        it { expect(subject).to eq(NumberInEnglish.number_to_english(number)) }
      end
      context 'above maximum' do
        let(:number) { NumberInEnglish.MAXIMUM+1 }
        it { expect { subject }.to raise_error(ArgumentError) }
      end
    end

    context 'number match' do
      context_number_match(NumberInEnglish.zero)
      context_number_match(NumberInEnglish.ones)
      context_number_match(NumberInEnglish.preteens)
      context_number_match(NumberInEnglish.teens)
      context_number_match(NumberInEnglish.tens)
    end
    
    context 'power match' do
      0.upto(9) { |n| context_power_match(n) }
    end

    context 'number equal' do
      MAXTIMES = 1_999
      NumberInEnglish.MINIMUM.upto(NumberInEnglish.MINIMUM+MAXTIMES) { |n| context_number_equal(n) }
      MAXTIMES.times { context_number_equal(rand(NumberInEnglish.MAXIMUM)) }
      NumberInEnglish.MAXIMUM.downto(NumberInEnglish.MAXIMUM-MAXTIMES) { |n| context_number_equal(n) }
    end
  end
end
