require 'test/unit/testcase'

module Spect
  module Expecting
    def expect(object, message = nil)
      Spect::Expectations::PositiveExpectation.new(self, object, message)
    end
  end
end

module Test::Unit
  class TestCase
    include Spect::Expecting
  end
end
