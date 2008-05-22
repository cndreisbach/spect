require 'test/unit/assertions'

module Spect
  module Expectations

    module ExpectationBehavior
      include Test::Unit::Assertions

      def initialize(test_object, object, message)
        @test = test_object
        @object = object
        @message = message
      end

      def add_assertion
        @test.send(:add_assertion)
      end

      def is(*args)
        if args.length > 0
          equal(args.first)
        else
          self
        end
      end
      alias be is

      def to
        self
      end
      alias an to
      alias a to

      def not(*args)
        if args.length > 0
          opposite.new(@test, @object, @message).equal(args.first)
        else
          opposite.new(@test, @object, @message)
        end
      end

      def contraposed_assert(&block)
        assert_raises Test::Unit::AssertionFailedError, @message do
          inverse = opposite.new(@test, @object, @message)
          yield inverse
        end
      end
    end

    class PositiveExpectation
      include ExpectationBehavior
      
      def opposite
        NegativeExpectation
      end
      
      def equal(value)
        assert_equal value, @object, @message
      end
      alias equal_to equal

      def close_to(value, delta)
        assert_in_delta value, @object, delta, @message
      end

      def match(value)
        assert_match value, @object, @message
      end

      def same(value)
        assert_same @object, value, @message
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

      def returned_by(&block)
        value = yield
        equal value
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

    class NegativeExpectation
      include ExpectationBehavior
      
      def opposite
        PositiveExpectation
      end

      def equal(value)
        assert_not_equal value, @object, @message
      end

      def close_to(value, delta)
        contraposed_assert do |object|
          object.close_to(value, delta)
        end
      end

      def match(value)
        assert_no_match value, @object, @message
      end

      def same(value)
        assert_not_same @object, value
      end

      def raised_by(&block)
        contraposed_assert do |object|
          object.raised_by(&block)
        end
      end

      def thrown_by(&block)
        contraposed_assert do |object|
          object.thrown_by(&block)
        end
      end

      def returned_by(&block)
        contraposed_assert do |object|
          object.returned_by(&block)
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

