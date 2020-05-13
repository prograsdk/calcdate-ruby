require 'core_ext/time'

RSpec.describe CalculateDate do
  it "has a version number" do
    expect(CalculateDate::VERSION).not_to be nil
  end

  describe 'include module' do
    include CalculateDate

    before :each do
      allow(Time).to receive(:now).and_return(Time.now)
    end

    context 'positive' do
      context 'when input string 0D' do
        it 'should be Time.now' do
          expect(calculate_date("0D")).to eq(Time.now)
        end
      end

      context 'when input string 1D' do
        it 'should be 1 day from now' do
          expect(calculate_date("1D")).to eq(1.day.from_now)
        end
      end

      context 'when input string 5D' do
        it 'should be 5 day from now' do
          expect(calculate_date("5D")).to eq(5.days.from_now)
        end
      end

      context 'when input string 14D' do
        it 'should be 14 days from now' do
          expect(calculate_date("14D")).to eq(14.days.from_now)
        end

        it 'should be 2 weeks from now' do
          expect(calculate_date("14D")).to eq(2.weeks.from_now)
        end
      end

      context 'when input string 1W' do
        it 'should be 1 week from now' do
          expect(calculate_date("1W")).to eq(1.week.from_now)
        end
      end

      context 'when input string 2W' do
        it 'should be 2 weeks from now' do
          expect(calculate_date("2W")).to eq(2.weeks.from_now)
        end

        it 'should be 14 days from now' do
          expect(calculate_date("2W")).to eq(14.days.from_now)
        end
      end

      context 'when input string 1M' do
        it 'should be 1 month from now' do
          expect(calculate_date("1M")).to eq(1.month.from_now)
        end
      end

      context 'when input string 2M' do
        it 'should be 2 months from now' do
          expect(calculate_date("2M")).to eq(2.months.from_now)
        end
      end

      context 'when input string 1Y' do
        it 'should be 1 year from now' do
          expect(calculate_date("1Y")).to eq(1.year.from_now)
        end
      end

      context 'when input string 2Y' do
        it 'should be 2 years from now' do
          expect(calculate_date("2Y")).to eq(2.years.from_now)
        end
      end
    end

    context 'negative' do
      context 'when input string -0D' do
        it 'should be Time.now' do
          expect(calculate_date("-0D")).to eq(Time.now)
        end
      end

      context 'when input string -1D' do
        it 'should be 1 day ao' do
          expect(calculate_date("-1D")).to eq(1.day.ago)
        end
      end

      context 'when input string -5D' do
        it 'should be 5 days ago' do
          expect(calculate_date("-5D")).to eq(5.days.ago)
        end
      end

      context 'when input string -14D' do
        it 'should be 14 days ago' do
          expect(calculate_date("-14D")).to eq(14.days.ago)
        end

        it 'should be 2 weeks ago' do
          expect(calculate_date("-14D")).to eq(2.weeks.ago)
        end
      end

      context 'when input string -1W' do
        it 'should be 1 week ago' do
          expect(calculate_date("-1W")).to eq(1.week.ago)
        end
      end

      context 'when input string -2W' do
        it 'should be 2 weeks ago' do
          expect(calculate_date("-2W")).to eq(2.weeks.ago)
        end

        it 'should be 14 days ago' do
          expect(calculate_date("2W")).to eq(14.days.ago)
        end
      end

      context 'when input string -1M' do
        it 'should be 1 month ago' do
          expect(calculate_date("-1M")).to eq(1.month.ago)
        end
      end

      context 'when input string -2M' do
        it 'should be 2 months ago' do
          expect(calculate_date("-2M")).to eq(2.months.ago)
        end
      end

      context 'when input string -1Y' do
        it 'should be 1 year ago' do
          expect(calculate_date("-1Y")).to eq(1.year.ago)
        end
      end

      context 'when input string -2Y' do
        it 'should be 2 years ago' do
          expect(calculate_date("-2Y")).to eq(2.years.ago)
        end
      end
    end
  end
end
