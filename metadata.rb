name 'mode_example'
maintainer 'Kevin Dickerson'
maintainer_email 'kdickerson@chef.io'
license 'Apache 2.0'
description 'Provides tests to show unexpected behavior for resource modes'
long_description IO.read File.join File.dirname(__FILE__), 'README.md'
version '0.1.0'

supports 'ubuntu', '14.04'
supports 'centos', '6.7'
supports 'centos', '7.1'

depends 'apt'

source_url 'https://github.com/kevindickerson/mode_example' if \
  respond_to?(:source_url)
issues_url 'https://github.com/kevindickerson/mode_example/issues' if \
  respond_to?(:issues_url)
