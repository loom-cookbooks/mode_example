# mode_example

[![Build Status](https://travis-ci.org/kevindickerson-cookbooks/mode_example.svg?branch=master)](https://travis-ci.org/kevindickerson-cookbooks/example) [![Cookbook Version](https://img.shields.io/cookbook/v/mode_example.svg)](https://supermarket.chef.io/cookbooks/mode_example)

This cookbook exists to show Chef users how to use the `mode` property, which is available to several common Chef resources, like `file` and `directory`.

This cookbook is just a long-winded way to show that there are several varying ways to set the `mode` property on a Chef resource.

This cookbook doesn't do anything in real life. It just has unit and integration tests, and a test cookbook to configure the state of a virtual machine. InSpec verifies the configuration.

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

Notice that `0644` and `0o644` are ways to write *octal* numbers in Ruby. This may be a gotcha, since the documentation for quite a few resources—including [file][file] and [directory][directory]—mentions that you can use a Fixnum or a String as a value for your `mode` properties.

The Chef resource documentation doesn't have many examples to show how to use Fixnum and String property values. I wrote some InSpec integration tests to help illustrate how to avoid common usage problems. Leading zeroes may result in unexpected values. There are some examples in the tests in this cookbook of how to use special modes (4-digit modes) correctly with both Fixnum and String property values.

## Testing

### Supported platforms

Keep in mind that the `mode` property will operate differently on different platforms. (For example, this cookbook doesn't really make sense if you're testing against Windows.)

We only need Ubuntu to illustrate the examples.

Platform | Version
---------|----------
ubuntu   | 14.04

### Unit tests

To run the ChefSpec unit tests, just run the following command in your shell.

```shell
$ rspec
```

### Integration tests

To run the InSpec-driven test suite, run the following command in the directory where you have downloaded or cloned this cookbook.

**Note:** Make sure you've installed ChefDK v0.12.0 or greater.

```shell
$ kitchen verify
```

#### The test cookbook

This cookbook uses a single test cookbook to configure the virtual machine, located in [test/cookbooks/mode_example_test][test-cookbook].

Locate and read through [test/cookbooks/mode_example_test/recipes/file.rb][test-file]. It just writes out a few files using the `mode` property in a few different ways.

#### The integration test suite

Locate and read through [test/integration/mode_example/fixnum_mode_spec.rb][fixnum] and [test/integration/mode_example/string_mode_spec.rb][string]. It simply shows that we have some expectations that the mode we intended was actually the mode we wrote to the file.

This shows that there are different ways to send values to the `mode` parameter of your resources. It's a pretty common parameter that you'll use with a lot of basic and common resources.

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
[file]: https://docs.chef.io/resource_file.html
[test-cookbook]: https://github.com/kevindickerson-cookbooks/mode_example/tree/master/test/cookbooks/mode_example_test
[test-file]: https://github.com/kevindickerson-cookbooks/mode_example/blob/master/test/cookbooks/mode_example_test/recipes/file.rb
[fixnum]: https://github.com/kevindickerson-cookbooks/mode_example/blob/master/test/integration/mode_example/fixnum_mode_spec.rb
[string]: https://github.com/kevindickerson-cookbooks/mode_example/blob/master/test/integration/mode_example/string_mode_spec.rb
