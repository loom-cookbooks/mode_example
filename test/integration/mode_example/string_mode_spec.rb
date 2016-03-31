describe file '/home/vagrant/mode_\'655\'.txt' do
  its(:group) { should eq 'vagrant' }
  its(:owner) { should eq 'vagrant' }
  its(:mode) { should_not eq 655 }
  its(:mode) { should eq 429 }
  its(:mode) { should eq 0o655 }
  its(:mode) { should eq 0655 }
  it { should be_mode 0o655 }
  it { should be_mode 429 }
end

describe file '/home/vagrant/mode_\'0655\'.txt' do
  its(:group) { should eq 'vagrant' }
  its(:owner) { should eq 'vagrant' }
  its(:mode) { should eq 429 }
  its(:mode) { should eq 0o0655 }
  its(:mode) { should eq 00655 }
  its(:mode) { should_not eq '0655' }
end

describe file '/home/vagrant/mode_\'00655\'.txt' do
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
end

describe file '/home/vagrant/mode_\'04755\'.txt' do
  its(:group) { should eq 'vagrant' }
  its(:owner) { should eq 'vagrant' }
  its(:mode) { should eq 493 }
  its(:mode) { should eq 0o755 }
  its(:mode) { should_not eq '493' }
  its(:mode) { should_not eq '4755' }
end
