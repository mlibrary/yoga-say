require 'say'
RSpec.describe Say do
  describe "#in_english" do
    context "with 0" do
      subject { Say.new(0) }
      it "returns zero" do
        expect(subject.in_english).to eq('zero')
      end
    end

    context "with 10" do
      subject { Say.new(10) }
      it "returns ten" do
        expect(subject.in_english).to eq ('ten')
      end
    end

    context "with 99" do
      subject { Say.new(99) }
      it "returns ninety-nine" do
        expect(subject.in_english).to eq ('ninety-nine')
      end
    end

    context "with 100" do
      subject { Say.new(100) }
      it "returns one hundred" do
        expect(subject.in_english).to eq ('one hundred')
      end
    end

    context "with 200" do
      subject { Say.new(200) }
      it "returns two hundred" do
        expect(subject.in_english).to eq 'two hundred'
      end
    end

    context "with 1001" do
      subject { Say.new(1001) }
      it "returns one thousand and one" do
        expect(subject.in_english).to eq 'one thousand one'
      end
    end

    context "with 9999" do
      subject { Say.new(9999) }
      it "returns nine thousand nine hundred aninety-nine" do
        expect(subject.in_english).to eq 'nine thousand nine hundred ninety-nine'
      end
    end

    context "with 1_000_001" do
      subject { Say.new(1_000_001) }
      it "returns one million one" do
        expect(subject.in_english).to eq 'one million one'
      end
    end

    context "with 13_978_432" do
      subject { Say.new(13_978_432) }
      it "returns thirteen million nine hundred seventy-eight thousand four hundred thirty-two" do
        expect(subject.in_english).to eq 'thirteen million nine hundred seventy-eight thousand four hundred thirty-two'
      end
    end

    context "with 99_100_200_300" do
      subject { Say.new(99_978_900_300) }
      it "returns ninety-nine billion nine hundred seventy-eight million nine hundred thousand three hundred" do
        expect(subject.in_english).to eq 'ninety-nine billion nine hundred seventy-eight million nine hundred thousand three hundred'
      end
    end
  end
end
