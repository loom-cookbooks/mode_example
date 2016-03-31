file '/home/vagrant/mode_\'655\'.txt' do
  mode '655'
  user 'vagrant'
  group 'vagrant'
end

file '/home/vagrant/mode_\'0655\'.txt' do
  mode '0655'
  user 'vagrant'
  group 'vagrant'
end

file '/home/vagrant/mode_\'00655\'.txt' do
  mode '00655'
  user 'vagrant'
  group 'vagrant'
end

file '/home/vagrant/mode_\'04755\'.txt' do
  mode '04755'
  user 'vagrant'
  group 'vagrant'
end

file '/home/vagrant/mode_655.txt' do # ignore FC006 via .foodcritic
  mode 655
  user 'vagrant'
  group 'vagrant'
end

file '/home/vagrant/mode_0655.txt' do
  mode 0655
  user 'vagrant'
  group 'vagrant'
end

file '/home/vagrant/mode_00655.txt' do
  mode 00655
  user 'vagrant'
  group 'vagrant'
end

file '/home/vagrant/mode_04755.txt' do
  mode 04755
  user 'vagrant'
  group 'vagrant'
end
