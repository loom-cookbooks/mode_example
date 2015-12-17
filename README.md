# mode_example

This cookbook exists to show Chef users how to use `mode` in their resources. It is a really long-winded way to show that there are a few different ways to pass a `mode` parameter value to a resource.

This cookbook doesn't do anything, it just has test suites and a text fixture cookbook.

## Overview

If you're new to Ruby, you might be unfamiliar with the difference between strings, integers, and octal numbers. Take a look at the following examples.

```ruby
irb(main):001:0> puts 'this is a string'
this is a string
=> nil
irb(main):002:0> puts "This is also a string"
This is also a string
=> nil
irb(main):003:0> puts '0644'
0644
=> nil
irb(main):004:0> puts 0644
420
=> nil
irb(main):005:0> puts 644
644
=> nil
irb(main):006:0> puts 0o644
420
=> nil
```

Notice that `0644` and `0o644` are ways to write *octal* numbers in Ruby. This may be a gotcha, since the documentation for quite a few resources—including [`file`](https://docs.chef.io/resource_file.html)—mentions that you can use a string or an integer as a value for your `mode` parameters.

The Chef resource documentation pages don't have a lot of examples to show how to use both Integer or String values with `mode`, so I wrote some tests really quickly to help you understand how to avoid using leading zeroes the wrong way, and to show some examples of how to use special modes (4-digit modes) correctly with String and Integer values.

## Integration Tests

To run the test suite, run the following command in the mode_exaple directory.

```shell
$ kitchen verify
```

### The test fixture cookbook

This cookbook uses one fixture test cookbook, located in [/test/fixtures/cookbooks/](https://github.com/kevindickerson/mode_example/test/fixtures/cookbooks).

Locate and read through [test/fixtures/cookbooks/mode_example_test/recipes/file.rb](https://github.com/kevindickerson/mode/test/fixtures/cookbooks/mode_example/test/fixtures/cookbooks/mode_example_test/recipes/file.rb). It just writes out a few files using the `mode` parameter in a few different ways.

### The integration test suite

Next, look at [/test/integration/mode_example_test/serverspec/mode_example_test_spec.rb](https://github.com/kevindickerson/mode/test/integration/mode_example_test/serverspec/mode_example_test_spec.rb). It simply shows that we have some expectations that the mode we intended was actually the mode we wrote to the file.

This shows that there are different ways to send values to the `mode` parameter of your resources. It's a pretty common parameter that you'll use with a lot of basic and very common resources.
