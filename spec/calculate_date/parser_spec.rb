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
      it 'should parse number PLUS number' do
        lexer = CalculateDate::Lexer.new("1 + 2")
        parser = CalculateDate::Parser.new(lexer)

        node = parser.parse

        expect(node).to be_a(CalculateDate::AST::BinaryOperator)
      end

      it 'should parse left_expr number' do
        lexer = CalculateDate::Lexer.new("1 + 2")
        parser = CalculateDate::Parser.new(lexer)

        node = parser.parse

        expect(node.left_expr.value).to eq(1)
      end

      it 'should parse right_expr number' do
        lexer = CalculateDate::Lexer.new("1 + 2")
        parser = CalculateDate::Parser.new(lexer)

        node = parser.parse

        expect(node.right_expr.value).to eq(2)
      end
    end
  end
end
