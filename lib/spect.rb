module Spect
  begin
    Assertion = Test::Unit::AssertionFailedError
  rescue NameError
    Assertion = MiniTest::Assertion
  end
end

require 'spect/expectations'
require 'spect/expecting'
