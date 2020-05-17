require 'calculate_date/token'

RSpec.describe CalculateDate::Token do
  describe '#str' do
    context 'when INTEGER' do
      context '1' do
        it 'should write str representation of token' do
          token = CalculateDate::Token.new(CalculateDate::Token::INTEGER, 1)

          expect(token.str).to eq("Token(INTEGER, 1)")
        end
      end

      context '12' do
        it 'should write str representation of token' do
          token = CalculateDate::Token.new(CalculateDate::Token::INTEGER, 12)

          expect(token.str).to eq("Token(INTEGER, 12)")
        end
      end
    end

    context 'when PLUS' do
      it 'should write str representation of token' do
        token = CalculateDate::Token.new(CalculateDate::Token::PLUS, "+")

        expect(token.str).to eq("Token(PLUS, +)")
      end
    end

    context 'when MINUS' do
      it 'should write str representation of token' do
        token = CalculateDate::Token.new(CalculateDate::Token::MINUS, "-")

        expect(token.str).to eq("Token(MINUS, -)")
      end
    end

    context 'when EOF' do
      it 'should write str representation of token' do
        token = CalculateDate::Token.new(CalculateDate::Token::EOS, nil)

        expect(token.str).to eq("Token(EOS, None)")
      end
    end
  end

  describe '#type' do
    context 'when INTEGER' do
      context '1' do
        it 'should write str representation of token' do
          token = CalculateDate::Token.new(CalculateDate::Token::INTEGER, 1)

          expect(token.type).to eq("INTEGER")
        end
      end

      context '12' do
        it 'should write str representation of token' do
          token = CalculateDate::Token.new(CalculateDate::Token::INTEGER, 12)

          expect(token.type).to eq("INTEGER")
        end
      end
    end

    context 'when PLUS' do
      it 'should write str representation of token' do
        token = CalculateDate::Token.new(CalculateDate::Token::PLUS, "+")

        expect(token.type).to eq("PLUS")
      end
    end

    context 'when MINUS' do
      it 'should write str representation of token' do
        token = CalculateDate::Token.new(CalculateDate::Token::MINUS, "-")

        expect(token.type).to eq("MINUS")
      end
    end

    context 'when EOF' do
      it 'should write str representation of token' do
        token = CalculateDate::Token.new(CalculateDate::Token::EOS, nil)

        expect(token.type).to eq("EOS")
      end
    end
  end

  describe '#value' do
    context 'when INTEGER' do
      context '1' do
        it 'should write str representation of token' do
          token = CalculateDate::Token.new(CalculateDate::Token::INTEGER, 1)

          expect(token.value).to eq(1)
        end
      end

      context '12' do
        it 'should write str representation of token' do
          token = CalculateDate::Token.new(CalculateDate::Token::INTEGER, 12)

          expect(token.value).to eq(12)
        end
      end
    end

    context 'when PLUS' do
      it 'should write str representation of token' do
        token = CalculateDate::Token.new(CalculateDate::Token::PLUS, "+")

        expect(token.value).to eq("+")
      end
    end

    context 'when MINUS' do
      it 'should write str representation of token' do
        token = CalculateDate::Token.new(CalculateDate::Token::MINUS, "-")

        expect(token.value).to eq("-")
      end
    end

    context 'when EOS' do
      it 'should write str representation of token' do
        token = CalculateDate::Token.new(CalculateDate::Token::EOS, nil)

        expect(token.value).to eq(nil)
      end
    end
  end
end
