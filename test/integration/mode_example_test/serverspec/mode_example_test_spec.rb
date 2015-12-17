require 'spec_helper'

describe 'mode_example_test::file' do
  context 'on ubuntu-14' do
    it '/home/vagrant/string_0655.txt is in the correct mode' do
      string_0655 = file '/home/vagrant/string_0655.txt'
      expect(string_0655).to be_mode '655'
      expect(string_0655).to be_mode 655
      expect(string_0655).to be_mode 01217
      expect(string_0655).to be_mode 0o1217
      expect(string_0655).to_not be_mode 0655
      expect(string_0655).to_not be_mode 429
      expect(string_0655).to_not be_mode '0655'
    end

    it '/home/vagrant/string_655.txt is in the correct mode' do
      string_655 = file '/home/vagrant/string_655.txt'
      expect(string_655).to be_mode '655'
      expect(string_655).to be_mode 655
      expect(string_655).to be_mode 01217
      expect(string_655).to be_mode 0o1217
      expect(string_655).to_not be_mode 0655
      expect(string_655).to_not be_mode 429
      expect(string_655).to_not be_mode '0655'
    end

    it '/home/vagrant/integer_0655.txt is in the correct mode' do
      string_0655 = file '/home/vagrant/integer_0655.txt'
      expect(string_0655).to be_mode '655'
      expect(string_0655).to be_mode 655
      expect(string_0655).to be_mode 01217
      expect(string_0655).to be_mode 0o1217
      expect(string_0655).to_not be_mode 0655
      expect(string_0655).to_not be_mode 429
      expect(string_0655).to_not be_mode '0655'
    end

    it '/home/vagrant/integer_00655.txt is in the correct mode' do
      string_00655 = file '/home/vagrant/integer_00655.txt'
      expect(string_00655).to be_mode '655'
      expect(string_00655).to be_mode 655
      expect(string_00655).to be_mode 01217
      expect(string_00655).to be_mode 0o1217
      expect(string_00655).to_not be_mode 0655
      expect(string_00655).to_not be_mode 429
      expect(string_00655).to_not be_mode '0655'
    end

    it '/home/vagrant/integer_04755.txt is in the correct mode' do
      integer_04755 = file '/home/vagrant/integer_04755.txt'
      expect(integer_04755).to be_mode 4755
      expect(integer_04755).to be_mode '4755'
      expect(integer_04755).to be_mode 011223
      expect(integer_04755).to_not be_mode '755'
      expect(integer_04755).to_not be_mode 00755
      expect(integer_04755).to_not be_mode 0755
    end

    it '/home/vagrant/string_04755.txt is in the correct mode' do
      string_04755 = file '/home/vagrant/string_04755.txt'
      expect(string_04755).to be_mode 4755
      expect(string_04755).to be_mode '4755'
      expect(string_04755).to be_mode 011223
      expect(string_04755).to_not be_mode '755'
      expect(string_04755).to_not be_mode 00755
      expect(string_04755).to_not be_mode 0755
    end
  end
end
