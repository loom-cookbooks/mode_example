require 'spec_helper'

describe 'mode_example_test::file' do
  context 'on any platform' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.converge described_recipe
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'creates some files with varying mode parameters' do
      expect(chef_run).to create_file('/home/vagrant/string_655.txt')
        .with(mode: '655')
      expect(chef_run).to create_file('/home/vagrant/string_0655.txt')
        .with(mode: '0655')
      expect(chef_run).to create_file('/home/vagrant/string_00655.txt')
        .with(mode: '00655')
      expect(chef_run).to create_file('/home/vagrant/string_000655.txt')
        .with(mode: '000655')
      expect(chef_run).to create_file('/home/vagrant/string_04755.txt')
        .with(mode: '04755')
      expect(chef_run).to create_file('/home/vagrant/fixnum_655.txt')
        .with(mode: 655)
      expect(chef_run).to create_file('/home/vagrant/fixnum_0655.txt')
        .with(mode: 0655)
      expect(chef_run).to create_file('/home/vagrant/fixnum_00655.txt')
        .with(mode: 00655)
      expect(chef_run).to create_file('/home/vagrant/fixnum_000655.txt')
        .with(mode: 000655)
      expect(chef_run).to create_file('/home/vagrant/fixnum_04755.txt')
        .with(mode: 04755)
    end
  end
end
