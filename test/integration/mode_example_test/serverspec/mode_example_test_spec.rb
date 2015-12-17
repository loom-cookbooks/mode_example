require 'spec_helper'

describe 'mode_example_test::file' do
  context 'on ubuntu-14' do
    describe 'with String parameters' do
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

      it '/home/vagrant/string_00655.txt is in the correct mode' do
        string_00655 = file '/home/vagrant/string_00655.txt'
        expect(string_00655).to be_mode '655'
        expect(string_00655).to be_mode 655
        expect(string_00655).to_not be_mode 00655
        expect(string_00655).to_not be_mode '00655'
      end

      it '/home/vagrant/string_000655.txt is in the correct mode' do
        string_000655 = file '/home/vagrant/string_000655.txt'
        expect(string_000655).to be_mode '655'
        expect(string_000655).to be_mode 655
        expect(string_000655).to_not be_mode 000655
        expect(string_000655).to_not be_mode '000655'
      end

      it '/home/vagrant/string_04755.txt is in the correct mode' do
        string_04755 = file '/home/vagrant/string_04755.txt'
        expect(string_04755).to be_mode '4755'
        expect(string_04755).to be_mode 4755
        expect(string_04755).to be_mode 0o11223
        expect(string_04755).to_not be_mode 0755
        expect(string_04755).to_not be_mode 2541
        expect(string_04755).to_not be_mode '0755'
      end
    end

    describe 'with Fixnum parameters' do
      it '/home/vagrant/integer_655.txt is in the correct mode' do
        integer_655 = file '/home/vagrant/integer_655.txt'
        expect(integer_655).to be_mode 1217 # this may be unexpected
        expect(integer_655).to_not be_mode 01217
        expect(integer_655).to_not be_mode 0o1217 # this may be unexpected
        expect(integer_655).to_not be_mode 0655
        expect(integer_655).to_not be_mode 429
        expect(integer_655).to_not be_mode '0655'
      end

      it '/home/vagrant/integer_0655.txt is in the correct mode' do
        integer_0655 = file '/home/vagrant/integer_0655.txt'
        expect(integer_0655).to be_mode '655'
        expect(integer_0655).to be_mode 655
        expect(integer_0655).to be_mode 01217
        expect(integer_0655).to be_mode 0o1217
        expect(integer_0655).to_not be_mode 0655
        expect(integer_0655).to_not be_mode 429
        expect(integer_0655).to_not be_mode '0655'
      end

      it '/home/vagrant/integer_00655.txt is in the correct mode' do
        integer_00655 = file '/home/vagrant/integer_00655.txt'
        expect(integer_00655).to be_mode '655'
        expect(integer_00655).to be_mode 655
        expect(integer_00655).to_not be_mode 00655
        expect(integer_00655).to_not be_mode '00655'
      end

      it '/home/vagrant/integer_000655.txt is in the correct mode' do
        integer_000655 = file '/home/vagrant/integer_000655.txt'
        expect(integer_000655).to be_mode '655'
        expect(integer_000655).to be_mode 655
        expect(integer_000655).to_not be_mode 000655
        expect(integer_000655).to_not be_mode '000655'
      end

      it '/home/vagrant/integer_04755.txt is in the correct mode' do
        integer_04755 = file '/home/vagrant/integer_04755.txt'
        expect(integer_04755).to be_mode '4755'
        expect(integer_04755).to be_mode 4755
        expect(integer_04755).to be_mode 0o11223
        expect(integer_04755).to_not be_mode 0755
        expect(integer_04755).to_not be_mode 2541
        expect(integer_04755).to_not be_mode '0755'
      end
    end
  end
end
