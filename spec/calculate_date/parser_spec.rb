# frozen_string_literal: true

require 'calculate_date/parser'
require 'pry'

RSpec.describe CalculateDate::Parser do
  describe '#parse' do
    context 'when parsing number' do
      it 'should parse number' do
        lexer = CalculateDate::Lexer.new("1")
        parser = CalculateDate::Parser.new(lexer)

        node = parser.parse

        expect(node).to be_a(CalculateDate::AST::Number)
      end

      it 'should parse number' do
        lexer = CalculateDate::Lexer.new("1")
        parser = CalculateDate::Parser.new(lexer)

        node = parser.parse

        expect(node.value).to eq(1)
      end
    end

    context 'when parsing number PLUS number' do
      context 'BinaryOperator' do
        it 'token should be PLUS' do
          lexer = CalculateDate::Lexer.new("1 + 2")
          parser = CalculateDate::Parser.new(lexer)

          node = parser.parse

          expect(node.token.type).to eq(CalculateDate::Token::PLUS)
        end

        it 'should parse number PLUS number' do
          lexer = CalculateDate::Lexer.new("1 + 2")
          parser = CalculateDate::Parser.new(lexer)

          node = parser.parse

          expect(node).to be_a(CalculateDate::AST::BinaryOperator)
        end

        context 'Left Expr - Number' do
          it 'should parse left_expr number' do
            lexer = CalculateDate::Lexer.new("1 + 2")
            parser = CalculateDate::Parser.new(lexer)

            node = parser.parse

            expect(node.left_expr.value).to eq(1)
          end

          it 'left_expr should be Number' do
            lexer = CalculateDate::Lexer.new("1 + 2")
            parser = CalculateDate::Parser.new(lexer)

            node = parser.parse

            expect(node.left_expr).to be_a(CalculateDate::AST::Number)
          end
        end

        context 'Right Expr - Number' do
          it 'should parse right_expr number' do
            lexer = CalculateDate::Lexer.new("1 + 2")
            parser = CalculateDate::Parser.new(lexer)

            node = parser.parse

            expect(node.right_expr.value).to eq(2)
          end

          it 'right_expr should be Number' do
            lexer = CalculateDate::Lexer.new("1 + 2")
            parser = CalculateDate::Parser.new(lexer)

            node = parser.parse

            expect(node.right_expr).to be_a(CalculateDate::AST::Number)
          end
        end
      end
    end

    context 'when parsing number PLUS number MINUS number' do
      context 'BinaryOperator' do
        it 'token should be MINUS' do
          lexer = CalculateDate::Lexer.new("1 + 2 - 3")
          parser = CalculateDate::Parser.new(lexer)

          node = parser.parse

          expect(node.token.type).to eq(CalculateDate::Token::MINUS)
        end

        it 'should parse number MINUS number' do
          lexer = CalculateDate::Lexer.new("1 + 2 - 3")
          parser = CalculateDate::Parser.new(lexer)

          node = parser.parse

          expect(node).to be_a(CalculateDate::AST::BinaryOperator)
        end

        context 'Left Expr - BinaryOperator' do
          it 'token should be PLUS' do
            lexer = CalculateDate::Lexer.new("1 + 2 - 3")
            parser = CalculateDate::Parser.new(lexer)

            node = parser.parse

            expect(node.left_expr.token.type).to eq(CalculateDate::Token::PLUS)
          end

          it 'should parse number PLUS number' do
            lexer = CalculateDate::Lexer.new("1 + 2 - 3")
            parser = CalculateDate::Parser.new(lexer)

            node = parser.parse

            expect(node.left_expr).to be_a(CalculateDate::AST::BinaryOperator)
          end

          context 'Left Expr - Number' do
            it 'should parse left_expr number' do
              lexer = CalculateDate::Lexer.new("1 + 2 - 3")
              parser = CalculateDate::Parser.new(lexer)

              node = parser.parse

              expect(node.left_expr.left_expr.value).to eq(1)
            end

            it 'left_expr should be Number' do
              lexer = CalculateDate::Lexer.new("1 + 2 - 3")
              parser = CalculateDate::Parser.new(lexer)

              node = parser.parse

              expect(node.left_expr.left_expr).to be_a(CalculateDate::AST::Number)
            end
          end

          context 'Right Expr - BinaryOperator' do
            it 'should parse right_expr binary operator' do
              lexer = CalculateDate::Lexer.new("1 + 2 - 3")
              parser = CalculateDate::Parser.new(lexer)

              node = parser.parse

              expect(node.left_expr.right_expr.value).to eq(2)
            end

            it 'right_expr should be Number' do
              lexer = CalculateDate::Lexer.new("1 + 2 - 3")
              parser = CalculateDate::Parser.new(lexer)

              node = parser.parse

              expect(node.left_expr.right_expr).to be_a(CalculateDate::AST::Number)
            end
          end
        end

        context 'Right Expr - Number' do
          it 'should parse right_expr number' do
            lexer = CalculateDate::Lexer.new("1 + 2 - 3")
            parser = CalculateDate::Parser.new(lexer)

            node = parser.parse

            expect(node.right_expr.value).to eq(3)
          end

          it 'right_expr should be Number' do
            lexer = CalculateDate::Lexer.new("1 + 2 - 3")
            parser = CalculateDate::Parser.new(lexer)

            node = parser.parse

            expect(node.right_expr).to be_a(CalculateDate::AST::Number)
          end
        end
      end
    end
  end
end
