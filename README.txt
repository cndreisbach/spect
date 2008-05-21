spect
=====

Author: Clinton R. Nixon of Viget Labs <clinton.nixon@viget.com>

## Description

Spect is a set of wrappers for Test::Unit assertions so that you can write assertions in a more BDD-like syntax. You can use it with any Test::Unit-derived framework. I intended it to be enjoyable to use with Shoulda (http://thoughtbot.com/projects/shoulda).

## Features/problems

* Lets you write tests that read like English.
* Doesn't prevent you from writing tests that read like moron.
* Should let you assert like so - `expect(true).is.not false` - but doesn't yet.
* Does not yet wrap assert_block.

## Synopis

     def test_spect_works
       expect(current_user.name).equal "Jim Dangly"
       expect(1 + 1).is.kind_of Fixnum
       expect(black_sabbath).is.not.nil
       expect(false).is.not.not.not.equal true

       expect(ZeroDivisionError).raised_by do
         1 / 0
       end
     end

## Requirements

Shoulda is required to run the tests, but otherwise, nothing else.

## Instal

    sudo gem install spect

For right now:

    sudo gem install crnixon-spect --source http://gems.github.com

and then

    require 'spect'

## License

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
