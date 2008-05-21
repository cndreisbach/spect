require 'test/unit/assertions'

module Spect
  module Expectations

    class PositiveExpectation      
      include Test::Unit::Assertions

      def initialize(test_object, object, message)
        @test = test_object
        @object = object
        @message = message
      end

      def add_assertion
        @test.send(:add_assertion)
      end

      def is
        self
      end
      alias be is
      alias to is
      alias an is
      alias a is
      
      def not()
        NegativeExpectation.new(@test, @object, @message)
      end

      def equal(value)
        assert_equal value, @object, @message
      end

      def close_to(value, delta)
        assert_in_delta value, @object, delta, @message
      end

      def match(value)
        assert_match value, @object, @message
      end

      def nil
        assert_nil @object, @message
      end

      def respond_to(method)
        assert_respond_to @object, method, @message
      end

      def same(value)
        assert_same @object, value
      end

      def raised_by(&block)
        exceptions = @object.respond_to?(:[]) ? @object : [@object]
        exceptions += [@message]
        assert_raise(*exceptions) do
          yield
        end
      end

      def thrown_by(&block)
        assert_throws(@object, @message) do
          yield
        end
      end

      def method_missing(name, *args, &block)        
        if @object.respond_to?("#{name}?")
          assert @object.send("#{name}?", *args),
            "#{name}? expected to be true. #{@message}"
        else
          if @object.respond_to?(name)
            assert @object.send(name, *args),
              "#{name} expected to be true. #{@message}"
          else
            super
          end
        end
      end
    end

    class NegativeExpectation < PositiveExpectation
      def not()
        PositiveExpectation.new(@test, @object, @message)
      end

      def equal(value)
        assert_not_equal value, @object, @message
      end

      def close_to(value, delta)
        assert_raises Test::Unit::AssertionFailedError do
          assert_in_delta value, @object, delta, @message
        end
      end

      def match(value)
        assert_no_match value, @object, @message
      end

      def nil
        assert_not_nil @object, @message
      end

      def respond_to(method)
        assert !@object.respond_to?(method), @message
      end

      def same(value)
        assert_not_same @object, value
      end

      def raised_by(&block)
        exceptions = @object.respond_to?(:[]) ? @object : [@object]
        exceptions += [@message]

        assert_raises Test::Unit::AssertionFailedError do
          assert_raise(*exceptions) do
            yield
          end
        end
      end

      def thrown_by(&block)
        assert_raises Test::Unit::AssertionFailedError do
          assert_throws(@object, @message) do
            yield
          end
        end
      end

      def method_missing(name, *args, &block)        
        if @object.respond_to?("#{name}?")
          assert !@object.send("#{name}?", *args),
            "#{name}? expected not to be true. #{@message}"
        else
          if @object.respond_to?(name)
            assert !@object.send(name, *args),
              "#{name} expected not to be true. #{@message}"
          else
            super
          end
        end
      end
    end

  end
end

