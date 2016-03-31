describe file '/home/vagrant/mode_655.txt' do
  its(:group) { should eq 'vagrant' }
  its(:owner) { should eq 'vagrant' }
  its(:mode) { should_not eq 655 }
  its(:mode) { should eq 143 }
  its(:mode) { should eq 0o217 }
  its(:mode) { should eq 0217 }
  it { should be_mode 0o217 }
  it { should be_mode 143 }
end

describe file '/home/vagrant/mode_0655.txt' do
  its(:group) { should eq 'vagrant' }
  its(:owner) { should eq 'vagrant' }
  its(:mode) { should eq 429 }
  its(:mode) { should eq 0o0655 }
  its(:mode) { should eq 00655 }
  its(:mode) { should_not eq '0655' }
  it { should be_mode 0o655 }
  it { should be_mode 429 }
end

describe file '/home/vagrant/mode_00655.txt' do
  its(:group) { should eq 'vagrant' }
  its(:owner) { should eq 'vagrant' }
  its(:mode) { should eq 429 }
  its(:mode) { should eq 0o655 }
  its(:mode) { should eq 0o0655 }
  its(:mode) { should eq 0o00655 }
  its(:mode) { should eq 0o000655 }
  its(:mode) { should_not eq 655 }
  its(:mode) { should eq 0655 }
  its(:mode) { should eq 00655 }
  its(:mode) { should eq 000655 }
  its(:mode) { should eq 0000655 }
  its(:mode) { should_not eq '00655' }
  it { should be_mode 0o655 }
  it { should be_mode 429 }
end

describe file '/home/vagrant/mode_04755.txt' do
  its(:group) { should eq 'vagrant' }
  its(:owner) { should eq 'vagrant' }
  its(:mode) { should eq 493 }
  its(:mode) { should eq 0o755 }
  its(:mode) { should_not eq '493' }
  its(:mode) { should_not eq '4755' }
  it { should be_mode 493 }
  it { should be_mode 0o755 }
end
