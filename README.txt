= spect

by Clinton R. Nixon of Viget Labs <clinton.nixon@viget.com>
    
== Description

Spect is a set of wrappers for Test::Unit assertions so that you can write assertions in a more BDD-like syntax. You can use it with any Test::Unit-derived framework. I intended it to be enjoyable to use with Shoulda (http://thoughtbot.com/projects/shoulda).

== Features/problems

* Lets you write tests that read like English.
* Doesn't prevent you from writing tests that read like moron.
* Does not yet wrap assert_block.

== Synopis

     def test_spect_works
       expect(current_user.name).equal "Jim Dangly"
       expect(current_user).is.an.admin
       expect(1 + 1).is.kind_of Fixnum
       expect(black_sabbath).is.not.nil
       expect(false).is.not.not.not.equal true
       expect(user.name).to.not.match /mr_jenkins/
       expect(user).to.be.equal User.find(:first)
       expect(user).to.be.equal_to User.find(:first)
       expect(ZeroDivisionError).raised_by do
         1 / 0
       end
       expect(4).returned_by do
         a = 1
         b = 3
         a + b
       end
     end

See test/test_spect.rb for more examples.
     
== Details

+expect+ is a method added to Test::Unit::TestCase that returns a PositiveExpectation. You can use this to call Test::Unit assertions. Many of the Test::Unit assertions are wrapped, with the following mappings:

* +assert_equal+ is +equal+ or +equal_to+
* +assert_in_delta+ is +close_to+
* +assert_match+ is +match+
* +assert_same+ is +same+
* +assert_raise+ is +raised_by+
* +assert_throws+ is +thrown_by+
* +returned_by+ wraps +assert_equal+, but takes a block

In addition, all predicates on an object can be tested for truth by calling them per normal (+nil?+) or by dropping the question mark (+nil+.) This eliminates the need to wrap +assert_respond_to+ or +assert_nil+.

There are several methods used solely for grammatical purposes. +to+, +an+, and +a+ are no-ops and just return +self+. +is+ and +be+ are no-ops unless they are passed an argument, in which case they assert equality between the original object and this argument. +not+ reverses assertions, but also can be passed an argument to assert inequality.

== Requirements

Shoulda is required to run the tests, but otherwise, nothing else.

== Install

    sudo gem install spect

and then

    require 'spect'

== Inspirations

* test/spec[http://chneukirchen.org/blog/archive/2007/01/announcing-test-spec-0-3-a-bdd-interface-for-test-unit.html]
* JDave[http://www.jdave.org/]

== License

(The MIT License)

Copyright (c) 2008 Clinton R. Nixon of Viget Labs

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
