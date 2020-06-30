# frozen_string_literal: true

require 'calculate_date/parser'
require 'calculate_date/exceptions'

RSpec.describe CalculateDate::Parser do
  describe '#parse' do
    context 'when parsing number' do
      it 'should parse number' do
        lexer = CalculateDate::Lexer.new("1 day")
        parser = CalculateDate::Parser.new(lexer)

        node = parser.parse

        expect(node.expr).to be_a(CalculateDate::AST::Number)
      end

      it 'should parse number' do
        lexer = CalculateDate::Lexer.new("1 day")
        parser = CalculateDate::Parser.new(lexer)

        node = parser.parse

        expect(node.expr.value).to eq(1)
      end
    end

    context 'when parsing number PLUS number' do
      context 'BinaryOperator' do
        it 'token should be PLUS' do
          lexer = CalculateDate::Lexer.new("1 day + 2 days")
          parser = CalculateDate::Parser.new(lexer)

          node = parser.parse

          expect(node.token.type).to eq(CalculateDate::Token::PLUS)
        end

        it 'should parse number PLUS number' do
          lexer = CalculateDate::Lexer.new("1 day + 2 days")
          parser = CalculateDate::Parser.new(lexer)

          node = parser.parse

          expect(node).to be_a(CalculateDate::AST::BinaryOperator)
        end

        context 'Left Expr - Number' do
          it 'should parse left_expr number' do
            lexer = CalculateDate::Lexer.new("1 day + 2 days")
            parser = CalculateDate::Parser.new(lexer)

            node = parser.parse

            expect(node.left_expr.expr.value).to eq(1)
          end

          it 'left_expr should be Number' do
            lexer = CalculateDate::Lexer.new("1 day + 2 days")
            parser = CalculateDate::Parser.new(lexer)

            node = parser.parse

            expect(node.left_expr.expr).to be_a(CalculateDate::AST::Number)
          end
        end

        context 'Right Expr - Number' do
          it 'should parse right_expr number' do
            lexer = CalculateDate::Lexer.new("1 day + 2 days")
            parser = CalculateDate::Parser.new(lexer)

            node = parser.parse

            expect(node.right_expr.expr.value).to eq(2)
          end

          it 'right_expr should be Number' do
            lexer = CalculateDate::Lexer.new("1 day + 2 days")
            parser = CalculateDate::Parser.new(lexer)

            node = parser.parse

            expect(node.right_expr.expr).to be_a(CalculateDate::AST::Number)
          end
        end
      end
    end

    context 'when parsing number PLUS number MINUS number' do
      context 'BinaryOperator' do
        it 'token should be MINUS' do
          lexer = CalculateDate::Lexer.new("1 day + 2 days - 3 days")
          parser = CalculateDate::Parser.new(lexer)

          node = parser.parse

          expect(node.token.type).to eq(CalculateDate::Token::MINUS)
        end

        it 'should parse number MINUS number' do
          lexer = CalculateDate::Lexer.new("1 day + 2 days - 3 days")
          parser = CalculateDate::Parser.new(lexer)

          node = parser.parse

          expect(node).to be_a(CalculateDate::AST::BinaryOperator)
        end

        context 'Left Expr - BinaryOperator' do
          it 'token should be PLUS' do
            lexer = CalculateDate::Lexer.new("1 day + 2 days - 3 days")
            parser = CalculateDate::Parser.new(lexer)

            node = parser.parse

            expect(node.left_expr.token.type).to eq(CalculateDate::Token::PLUS)
          end

          it 'should parse number PLUS number' do
            lexer = CalculateDate::Lexer.new("1 day + 2 days - 3 days")
            parser = CalculateDate::Parser.new(lexer)

            node = parser.parse

            expect(node.left_expr).to be_a(CalculateDate::AST::BinaryOperator)
          end

          context 'Left Expr - Number' do
            it 'should parse left_expr number' do
              lexer = CalculateDate::Lexer.new("1 day + 2 days - 3 days")
              parser = CalculateDate::Parser.new(lexer)

              node = parser.parse

              expect(node.left_expr.left_expr.expr.value).to eq(1)
            end

            it 'left_expr should be Number' do
              lexer = CalculateDate::Lexer.new("1 day + 2 days - 3 days")
              parser = CalculateDate::Parser.new(lexer)

              node = parser.parse

              expect(node.left_expr.left_expr.expr).to be_a(CalculateDate::AST::Number)
            end
          end

          context 'Right Expr - BinaryOperator' do
            it 'should parse right_expr binary operator' do
              lexer = CalculateDate::Lexer.new("1 day + 2 days - 3 days")
              parser = CalculateDate::Parser.new(lexer)

              node = parser.parse

              expect(node.left_expr.right_expr.expr.value).to eq(2)
            end

            it 'right_expr should be Number' do
              lexer = CalculateDate::Lexer.new("1 day + 2 days - 3 days")
              parser = CalculateDate::Parser.new(lexer)

              node = parser.parse

              expect(node.left_expr.right_expr.expr).to be_a(CalculateDate::AST::Number)
            end
          end
        end

        context 'Right Expr - Number' do
          it 'should parse right_expr number' do
            lexer = CalculateDate::Lexer.new("1 day + 2 days - 3 days")
            parser = CalculateDate::Parser.new(lexer)

            node = parser.parse

            expect(node.right_expr.expr.value).to eq(3)
          end

          it 'right_expr should be Number' do
            lexer = CalculateDate::Lexer.new("1 day + 2 days - 3 days")
            parser = CalculateDate::Parser.new(lexer)

            node = parser.parse

            expect(node.right_expr.expr).to be_a(CalculateDate::AST::Number)
          end
        end
      end
    end

    context 'when only parsing plus' do
      it 'should raise syntax error' do
        lexer = CalculateDate::Lexer.new("+")
        parser = CalculateDate::Parser.new(lexer)

        expect { parser.parse }.to raise_error(CalculateDate::Exceptions::SyntaxError)
      end
    end

    context 'when only parsing number' do
      it 'should raise syntax error' do
        lexer = CalculateDate::Lexer.new("1")
        parser = CalculateDate::Parser.new(lexer)

        expect { parser.parse }.to raise_error(CalculateDate::Exceptions::SyntaxError)
      end
    end

    context 'when parsing number and sign' do
      it 'should raise syntax error' do
        lexer = CalculateDate::Lexer.new("1 +")
        parser = CalculateDate::Parser.new(lexer)

        expect { parser.parse }.to raise_error(CalculateDate::Exceptions::SyntaxError)
      end
    end

    context 'when parsing number, unit and sign' do
      it 'should raise syntax error' do
        lexer = CalculateDate::Lexer.new("1 day +")
        parser = CalculateDate::Parser.new(lexer)

        expect { parser.parse }.to raise_error(CalculateDate::Exceptions::SyntaxError)
      end
    end

    context 'when parsing number, unit, sign and number again' do
      it 'should raise syntax error' do
        lexer = CalculateDate::Lexer.new("1 day + 1")
        parser = CalculateDate::Parser.new(lexer)

        expect { parser.parse }.to raise_error(CalculateDate::Exceptions::SyntaxError)
      end
    end

    context 'when parsing number, unit, sign and unit' do
      it 'should raise syntax error' do
        lexer = CalculateDate::Lexer.new("1 day + day")
        parser = CalculateDate::Parser.new(lexer)

        expect { parser.parse }.to raise_error(CalculateDate::Exceptions::SyntaxError)
      end
    end

    context 'when parsing number, sign and unit' do
      it 'should raise syntax error' do
        lexer = CalculateDate::Lexer.new("1 + day")
        parser = CalculateDate::Parser.new(lexer)

        expect { parser.parse }.to raise_error(CalculateDate::Exceptions::SyntaxError)
      end
    end

    context 'when parsing 1 day' do
      it 'should parse day date_unit' do
        lexer = CalculateDate::Lexer.new("1 day")
        parser = CalculateDate::Parser.new(lexer)

        node = parser.parse

        expect(node).to be_a(CalculateDate::AST::Date)
      end

      it 'should parse day date_unit' do
        lexer = CalculateDate::Lexer.new("1 day")
        parser = CalculateDate::Parser.new(lexer)

        node = parser.parse

        expect(node.unit).to eq('day')
      end
    end

    context 'when parsing 2 days' do
      it 'should parse days date_unit' do
        lexer = CalculateDate::Lexer.new("2 days")
        parser = CalculateDate::Parser.new(lexer)

        node = parser.parse

        expect(node).to be_a(CalculateDate::AST::Date)
      end

      it 'should parse days date_unit' do
        lexer = CalculateDate::Lexer.new("2 days")
        parser = CalculateDate::Parser.new(lexer)

        node = parser.parse

        expect(node.unit).to eq('days')
      end
    end

    context 'when parsing 1 month' do
      it 'should parse month date_unit' do
        lexer = CalculateDate::Lexer.new("1 month")
        parser = CalculateDate::Parser.new(lexer)

        node = parser.parse

        expect(node).to be_a(CalculateDate::AST::Date)
      end

      it 'should parse month date_unit' do
        lexer = CalculateDate::Lexer.new("1 month")
        parser = CalculateDate::Parser.new(lexer)

        node = parser.parse

        expect(node.unit).to eq('month')
      end
    end

    context 'when parsing 2 months' do
      it 'should parse months date_unit' do
        lexer = CalculateDate::Lexer.new("2 months")
        parser = CalculateDate::Parser.new(lexer)

        node = parser.parse

        expect(node).to be_a(CalculateDate::AST::Date)
      end

      it 'should parse months date_unit' do
        lexer = CalculateDate::Lexer.new("2 months")
        parser = CalculateDate::Parser.new(lexer)

        node = parser.parse

        expect(node.unit).to eq('months')
      end
    end

    context 'when parsing 1 year' do
      it 'should parse year date_unit' do
        lexer = CalculateDate::Lexer.new("1 year")
        parser = CalculateDate::Parser.new(lexer)

        node = parser.parse

        expect(node).to be_a(CalculateDate::AST::Date)
      end

      it 'should parse year date_unit' do
        lexer = CalculateDate::Lexer.new("1 year")
        parser = CalculateDate::Parser.new(lexer)

        node = parser.parse

        expect(node.unit).to eq('year')
      end
    end

    context 'when parsing 2 years' do
      it 'should parse years date_unit' do
        lexer = CalculateDate::Lexer.new("2 years")
        parser = CalculateDate::Parser.new(lexer)

        node = parser.parse

        expect(node).to be_a(CalculateDate::AST::Date)
      end

      it 'should parse years date_unit' do
        lexer = CalculateDate::Lexer.new("2 years")
        parser = CalculateDate::Parser.new(lexer)

        node = parser.parse

        expect(node.unit).to eq('years')
      end
    end

    context 'when only parsing date' do
      it 'should raise syntax error' do
        lexer = CalculateDate::Lexer.new("day")
        parser = CalculateDate::Parser.new(lexer)

        expect { parser.parse }.to raise_error(CalculateDate::Exceptions::SyntaxError)
      end
    end
  end
end
