require 'test/unit'
require File.dirname(__FILE__) + '/../lib/spect'
require 'rubygems'
require 'shoulda'

class SpectTest < Test::Unit::TestCase
  def test_expect_works
    expect(true).equal true
    expect(true).is.equal true
    expect(3).is.instance_of Fixnum
  end

  def test_not_expect_works
    expect(true).is.not.equal false
    expect(nil).to.not.respond_to :empty?
    expect(3).is.not.an.instance_of String
  end

  def test_not_not_expect_works
    expect(1).is.not.not.equal 1
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

  should "work with shoulda" do
    expect("hello").not.equal "world"
    expect(1 + 1).is.kind_of Fixnum
  end
end
