# mode_example

[![Build Status](https://travis-ci.org/kevindickerson-cookbooks/mode_example.svg?branch=master)](https://travis-ci.org/kevindickerson-cookbooks/example) [![Cookbook Version](https://img.shields.io/cookbook/v/mode_example.svg)](https://supermarket.chef.io/cookbooks/mode_example)

This cookbook exists to show Chef users how to use `mode` in their resources. This is just a really long-winded way to show that there are a few different ways to pass a `mode` parameter value to a resource.

This cookbook doesn't do anything, it just has unit and integration tests, and a text fixture cookbook.

## Overview

If you're new to Ruby, you might be unfamiliar with how Ruby interprets and coerces strings, integers, and octal numbers. Take a look at the following examples.

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

Notice that `0644` and `0o644` are ways to write *octal* numbers in Ruby. This may be a gotcha, since the documentation for quite a few resources—including [`file`](https://docs.chef.io/resource_file.html)—mentions that you can use a String or a Fixnum as a value for your `mode` parameters.

The Chef resource documentation pages don't have a lot of examples to show how to use both Fixnum or String resource parameter values with `mode`. I wrote some tests really quickly to help you understand how to avoid common usage problems. Leading zeroes may result in unexpected values. There are some examples in the tests in this cookbook of how to use special modes (4-digit modes) correctly with both String and Fixnum parameter values.

## Testing

### Supported platforms

Keep in mind that `mode` will operate differently on different platforms.

Platform | Version
---------|----------
ubuntu   | 14.04
centos   | 6.7
centos   | 7.1

### Unit tests

To run the ChefSpec unit tests, just run the following command in your shell.

```shell
$ rspec spec/unit/recipes/mode_example_test_spec.rb
```

### Integration tests

To run the test suite, run the following command in the mode_example directory where you have downloaded or cloned this cookbook.

```shell
$ kitchen verify
```

#### The test fixture cookbook

This cookbook uses one fixture test cookbook, located in [test/fixtures/cookbooks/](https://github.com/kevindickerson/mode_example/tree/master/test/fixtures/cookbooks/mode_example_test).

Locate and read through [test/fixtures/cookbooks/mode_example_test/recipes/file.rb](https://github.com/kevindickerson/mode_example/blob/master/test/fixtures/cookbooks/mode_example_test/recipes/file.rb). It just writes out a few files using the `mode` parameter in a few different ways.

#### The integration test suite

Locate and read through [test/integration/mode_example_test/serverspec/mode_example_test_spec.rb](https://github.com/kevindickerson/mode_example/blob/master/test/integration/mode_example_test/serverspec/mode_example_test_spec.rb). It simply shows that we have some expectations that the mode we intended was actually the mode we wrote to the file.

This shows that there are different ways to send values to the `mode` parameter of your resources. It's a pretty common parameter that you'll use with a lot of basic and very common resources.

## Discussion

### Static Linting

Static linting will catch problems outlined in this cookbook. If you use Foodcritic, you may inadvertently [trigger Foodcritic rule FC006](http://www.foodcritic.io/#FC006). This is for good reason—you might end up configuring files to have a different modes than you intended them to have.

### Examples of unintended modes

#### Example 1

This example produces a file with a mode of 1217, not 644. This is because Ruby coerces a Fixnum to octal if it has a leftmost digit of `0`.

```ruby
file '/home/vagrant/some_file' do
  owner 'vagrant'
  group 'vagrant'
  mode 644
  action :create
end
```

In shell:

```shell
$ stat -c '%a' /home/vagrant/some_file
1217
```

In Ruby:

```ruby
> 01217 == 655
=> true
```

#### Example 2

In this example if the mode is set to `0644`, the mode results to 644, despite the fact that the Fixnum has a leftmost digit of `0`.

```ruby
file '/home/vagrant/some_file' do
  owner 'vagrant'
  group 'vagrant'
  mode 0644
  action :create
end
```

In shell:

```shell
$ stat -c '%a' /home/vagrant/some_file
644
```

#### Example 3

This example also produces a file with a mode of 644.

```ruby
file '/home/vagrant/some_file' do
  owner 'vagrant'
  group 'vagrant'
  mode '644'
  action :create
end
```

In shell:

```shell
$ stat -c '%a' /home/vagrant/some_file
644
```
