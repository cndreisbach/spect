require 'test/unit'

require File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib', 'spect'))

class SpectTest < Test::Unit::TestCase
  def test_expect_works
    expect(true).equal true
    expect(true).is.equal_to true
    expect(false).equals false
    expect(3).is.instance_of Fixnum
    expect("Count").to.match(/unt$/)
    expect("Fazam").matches(/^Faz/)
    expect(nil).to.respond_to :nil?
  end

  def test_not_expect_works
    expect(true).is.not.equal false
    expect(nil).to.not.respond_to :empty?
    expect(3).is.not.an.instance_of String
    expect(3).is.not.close_to(7, 1)
    expect("foo").does.not.match(/bar/)
  end

  def test_not_not_expect_works
    expect(1).is.not.not.equal 1
  end

  def test_implicit_equals
    username = 'cnixon'
    expect(username).is 'cnixon'
    expect(username).to.not.be 'henry'
    expect(username).is.not 'henry'
  end

  def test_expect_raised_by
    expect([ArgumentError, ZeroDivisionError]).raised_by do
      1 / 0
    end

    expect(ZeroDivisionError).not.raised_by do
      div(1)
    end
  end

  def test_expect_thrown_by
    expect(:hello).thrown_by do
      throw :hello
    end

    expect(:hello).not.thrown_by do
      throw :world
    end
  end

  def test_expect_returned_by
    expect(2).returned_by do
      1 + 1
    end

    expect(3).not.returned_by do
      1 + 1
    end
  end
end
