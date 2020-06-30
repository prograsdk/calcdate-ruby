require 'calculate_date/weeder'
require 'calculate_date/exceptions'
require 'calculate_date/lexer'
require 'calculate_date/parser'
require 'calculate_date/interpreter'
require 'fe_core_ext'
require "fe_core_ext/core_ext/time"

RSpec.describe CalculateDate::Interpreter do
  describe '#interpret' do
    before :each do
      allow(Time).to receive(:now).and_return(Time.now)
    end

    context 'simple dates' do
      context 'evaluating days' do
        it 'should return 1 day from now' do
          lexer = CalculateDate::Lexer.new("1 day")
          ast = CalculateDate::Parser.new(lexer).parse
          weeded_ast = CalculateDate::Weeder.new(ast).weed

          interpreter = CalculateDate::Interpreter.new(weeded_ast)

          expect(interpreter.interpret).to eq(1.day.from_now)
        end

        it 'should return 10 days from now' do
          lexer = CalculateDate::Lexer.new("10 days")
          ast = CalculateDate::Parser.new(lexer).parse
          weeded_ast = CalculateDate::Weeder.new(ast).weed

          interpreter = CalculateDate::Interpreter.new(weeded_ast)

          expect(interpreter.interpret).to eq(10.days.from_now)
        end
      end

      context 'evaluating months' do
        it 'should return 1 month from now' do
          lexer = CalculateDate::Lexer.new("1 month")
          ast = CalculateDate::Parser.new(lexer).parse
          weeded_ast = CalculateDate::Weeder.new(ast).weed

          interpreter = CalculateDate::Interpreter.new(weeded_ast)

          expect(interpreter.interpret).to eq(1.month.from_now)
        end

        it 'should return 10 months from now' do
          lexer = CalculateDate::Lexer.new("10 months")
          ast = CalculateDate::Parser.new(lexer).parse
          weeded_ast = CalculateDate::Weeder.new(ast).weed

          interpreter = CalculateDate::Interpreter.new(weeded_ast)

          expect(interpreter.interpret).to eq(10.months.from_now)
        end
      end

      context 'evaluating years' do
        it 'should return 1 year from now' do
          lexer = CalculateDate::Lexer.new("1 year")
          ast = CalculateDate::Parser.new(lexer).parse
          weeded_ast = CalculateDate::Weeder.new(ast).weed

          interpreter = CalculateDate::Interpreter.new(weeded_ast)

          expect(interpreter.interpret).to eq(1.year.from_now)
        end

        it 'should return 10 years from now' do
          lexer = CalculateDate::Lexer.new("10 years")
          ast = CalculateDate::Parser.new(lexer).parse
          weeded_ast = CalculateDate::Weeder.new(ast).weed

          interpreter = CalculateDate::Interpreter.new(weeded_ast)

          expect(interpreter.interpret).to eq(10.years.from_now)
        end
      end
    end

    context 'plus dates' do
      context '2 dates' do
        it 'should interpret 1 day + 1 day' do
          lexer = CalculateDate::Lexer.new("1 day + 1 day")
          ast = CalculateDate::Parser.new(lexer).parse
          weeded_ast = CalculateDate::Weeder.new(ast).weed

          interpreter = CalculateDate::Interpreter.new(weeded_ast)

          expect(interpreter.interpret).to eq(2.days.from_now)
        end

        it 'should interpret 1 day + 2 days' do
          lexer = CalculateDate::Lexer.new("1 day + 2 days")
          ast = CalculateDate::Parser.new(lexer).parse
          weeded_ast = CalculateDate::Weeder.new(ast).weed

          interpreter = CalculateDate::Interpreter.new(weeded_ast)

          expect(interpreter.interpret).to eq(3.days.from_now)
        end

        it 'should interpret 1 month + 1 day' do
          lexer = CalculateDate::Lexer.new("1 month + 1 day")
          ast = CalculateDate::Parser.new(lexer).parse
          weeded_ast = CalculateDate::Weeder.new(ast).weed

          interpreter = CalculateDate::Interpreter.new(weeded_ast)

          expect(interpreter.interpret).to eq(1.month.from_now + 1.day)
        end

        it 'should interpret 1 year + 1 month' do
          lexer = CalculateDate::Lexer.new("1 year + 1 month")
          ast = CalculateDate::Parser.new(lexer).parse
          weeded_ast = CalculateDate::Weeder.new(ast).weed

          interpreter = CalculateDate::Interpreter.new(weeded_ast)

          expect(interpreter.interpret).to eq(1.year.from_now + 1.month)
        end

        it 'should interpret 1 year + 1 month + 10 days' do
          lexer = CalculateDate::Lexer.new("1 year + 1 month + 10 days")
          ast = CalculateDate::Parser.new(lexer).parse
          weeded_ast = CalculateDate::Weeder.new(ast).weed

          interpreter = CalculateDate::Interpreter.new(weeded_ast)

          expect(interpreter.interpret).to eq(1.year.from_now + 1.month + 10.days)
        end
      end
    end
  end
end
