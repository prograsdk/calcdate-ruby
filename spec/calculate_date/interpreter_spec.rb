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

      context 'evaluating weeks' do
        it 'should return 1 week from now' do
          lexer = CalculateDate::Lexer.new("1 week")
          ast = CalculateDate::Parser.new(lexer).parse
          weeded_ast = CalculateDate::Weeder.new(ast).weed

          interpreter = CalculateDate::Interpreter.new(weeded_ast)

          expect(interpreter.interpret).to eq(1.week.from_now)
        end

        it 'should return 10 weeks from now' do
          lexer = CalculateDate::Lexer.new("10 weeks")
          ast = CalculateDate::Parser.new(lexer).parse
          weeded_ast = CalculateDate::Weeder.new(ast).weed

          interpreter = CalculateDate::Interpreter.new(weeded_ast)

          expect(interpreter.interpret).to eq(10.weeks.from_now)
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

      context 'evaluating quarters' do
        it 'should return 1 quarter from now' do
          lexer = CalculateDate::Lexer.new("1 quarter")
          ast = CalculateDate::Parser.new(lexer).parse
          weeded_ast = CalculateDate::Weeder.new(ast).weed

          interpreter = CalculateDate::Interpreter.new(weeded_ast)

          expect(interpreter.interpret).to eq(3.month.from_now)
        end

        it 'should return 10 quarters from now' do
          lexer = CalculateDate::Lexer.new("10 quarters")
          ast = CalculateDate::Parser.new(lexer).parse
          weeded_ast = CalculateDate::Weeder.new(ast).weed

          interpreter = CalculateDate::Interpreter.new(weeded_ast)

          expect(interpreter.interpret).to eq(30.months.from_now)
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
      context '2 days' do
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
      end

      context '2 weeks' do
        it 'should interpret 1 week + 1 week' do
          lexer = CalculateDate::Lexer.new("1 week + 1 week")
          ast = CalculateDate::Parser.new(lexer).parse
          weeded_ast = CalculateDate::Weeder.new(ast).weed

          interpreter = CalculateDate::Interpreter.new(weeded_ast)

          expect(interpreter.interpret).to eq(2.weeks.from_now)
        end

        it 'should interpret 1 week + 2 weeks' do
          lexer = CalculateDate::Lexer.new("1 week + 2 weeks")
          ast = CalculateDate::Parser.new(lexer).parse
          weeded_ast = CalculateDate::Weeder.new(ast).weed

          interpreter = CalculateDate::Interpreter.new(weeded_ast)

          expect(interpreter.interpret).to eq(3.weeks.from_now)
        end
      end

      context '2 months' do
        it 'should interpret 1 month + 1 month' do
          lexer = CalculateDate::Lexer.new("1 month + 1 month")
          ast = CalculateDate::Parser.new(lexer).parse
          weeded_ast = CalculateDate::Weeder.new(ast).weed

          interpreter = CalculateDate::Interpreter.new(weeded_ast)

          expect(interpreter.interpret).to eq(2.months.from_now)
        end

        it 'should interpret 1 month + 2 months' do
          lexer = CalculateDate::Lexer.new("1 month + 2 months")
          ast = CalculateDate::Parser.new(lexer).parse
          weeded_ast = CalculateDate::Weeder.new(ast).weed

          interpreter = CalculateDate::Interpreter.new(weeded_ast)

          expect(interpreter.interpret).to eq(3.months.from_now)
        end
      end

      context '2 quarters' do
        it 'should interpret 1 quarter + 1 quarter' do
          lexer = CalculateDate::Lexer.new("1 quarter + 1 quarter")
          ast = CalculateDate::Parser.new(lexer).parse
          weeded_ast = CalculateDate::Weeder.new(ast).weed

          interpreter = CalculateDate::Interpreter.new(weeded_ast)

          expect(interpreter.interpret).to eq(6.months.from_now)
        end

        it 'should interpret 1 quarter + 2 quarters' do
          lexer = CalculateDate::Lexer.new("1 quarter + 2 quarters")
          ast = CalculateDate::Parser.new(lexer).parse
          weeded_ast = CalculateDate::Weeder.new(ast).weed

          interpreter = CalculateDate::Interpreter.new(weeded_ast)

          expect(interpreter.interpret).to eq(9.months.from_now)
        end
      end

      context '2 years' do
        it 'should interpret 1 year + 1 year' do
          lexer = CalculateDate::Lexer.new("1 year + 1 year")
          ast = CalculateDate::Parser.new(lexer).parse
          weeded_ast = CalculateDate::Weeder.new(ast).weed

          interpreter = CalculateDate::Interpreter.new(weeded_ast)

          expect(interpreter.interpret).to eq(2.years.from_now)
        end

        it 'should interpret 1 year + 2 years' do
          lexer = CalculateDate::Lexer.new("1 year + 2 years")
          ast = CalculateDate::Parser.new(lexer).parse
          weeded_ast = CalculateDate::Weeder.new(ast).weed

          interpreter = CalculateDate::Interpreter.new(weeded_ast)

          expect(interpreter.interpret).to eq(3.years.from_now)
        end
      end

      context '2 combined keywords' do
        it 'should interpret 1 month + 1 day' do
          lexer = CalculateDate::Lexer.new("1 month + 1 day")
          ast = CalculateDate::Parser.new(lexer).parse
          weeded_ast = CalculateDate::Weeder.new(ast).weed

          interpreter = CalculateDate::Interpreter.new(weeded_ast)

          expect(interpreter.interpret).to eq(1.month.from_now + 1.day)
        end

        it 'should interpret 1 day + 1 month' do
          lexer = CalculateDate::Lexer.new("1 day + 1 month")
          ast = CalculateDate::Parser.new(lexer).parse
          weeded_ast = CalculateDate::Weeder.new(ast).weed

          interpreter = CalculateDate::Interpreter.new(weeded_ast)

          expect(interpreter.interpret).to eq(1.month.from_now + 1.day)
        end

        it 'should interpret 1 quarter + 1 day' do
          lexer = CalculateDate::Lexer.new("1 quarter + 1 day")
          ast = CalculateDate::Parser.new(lexer).parse
          weeded_ast = CalculateDate::Weeder.new(ast).weed

          interpreter = CalculateDate::Interpreter.new(weeded_ast)

          expect(interpreter.interpret).to eq(3.months.from_now + 1.day)
        end

        it 'should interpret 1 day + 1 quarter' do
          lexer = CalculateDate::Lexer.new("1 day + 1 quarter")
          ast = CalculateDate::Parser.new(lexer).parse
          weeded_ast = CalculateDate::Weeder.new(ast).weed

          interpreter = CalculateDate::Interpreter.new(weeded_ast)

          expect(interpreter.interpret).to eq(3.months.from_now + 1.day)
        end

        it 'should interpret 1 year + 1 month' do
          lexer = CalculateDate::Lexer.new("1 year + 1 month")
          ast = CalculateDate::Parser.new(lexer).parse
          weeded_ast = CalculateDate::Weeder.new(ast).weed

          interpreter = CalculateDate::Interpreter.new(weeded_ast)

          expect(interpreter.interpret).to eq(1.year.from_now + 1.month)
        end

        it 'should interpret 1 month + 1 year' do
          lexer = CalculateDate::Lexer.new("1 month + 1 year")
          ast = CalculateDate::Parser.new(lexer).parse
          weeded_ast = CalculateDate::Weeder.new(ast).weed

          interpreter = CalculateDate::Interpreter.new(weeded_ast)

          expect(interpreter.interpret).to eq(1.year.from_now + 1.month)
        end
      end

      context '3 combined keywords' do
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
