require 'test/unit/testcase'

module Spect
  module Expecting
    def expect(object, message = nil)
      Spect::Expectations::PositiveExpectation.new(self, object, message)
    end
  end
end

Test::Unit::TestCase.module_eval do
  include Spect::Expecting
end
