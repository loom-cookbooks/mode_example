require 'spec_helper'

describe 'mode_example_test::files' do
  context 'on any platform' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.converge described_recipe
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'creates some files with varying mode parameters' do
      expect(chef_run).to create_file('/home/vagrant/mode_\'655\'.txt')
        .with(mode: '655')
      expect(chef_run).to create_file('/home/vagrant/mode_\'0655\'.txt')
        .with(mode: '0655')
      expect(chef_run).to create_file('/home/vagrant/mode_\'00655\'.txt')
        .with(mode: '00655')
      expect(chef_run).to create_file('/home/vagrant/mode_\'04755\'.txt')
        .with(mode: '04755')
      expect(chef_run).to create_file('/home/vagrant/mode_655.txt')
        .with(mode: 655)
      expect(chef_run).to create_file('/home/vagrant/mode_0655.txt')
        .with(mode: 0655)
      expect(chef_run).to create_file('/home/vagrant/mode_00655.txt')
        .with(mode: 00655)
      expect(chef_run).to create_file('/home/vagrant/mode_04755.txt')
        .with(mode: 04755)
    end
  end
end
