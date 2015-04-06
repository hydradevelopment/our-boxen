# Faun
class people::faun {

  $env = {
    github_user => 'faun',
    directories => {
      home      => "/Users/${::boxen_user}",
      src       => '/Users/faun/src/',
      my_src    => '/Users/faun/src/github.com/faun',
    }
  }

  case $::hostname {
    'unicorn': {
      include projects::all
    }
    default: {
      include hydra::apps::rdio
    }
  }

  repository { 'faun-dotfiles':
    source  => 'faun/dotfiles',
    path    => "${env['directories']['my_src']}/dotfiles"
  }

  boxen::osx_defaults {

    'Prevent Time Machine from prompting to use new hard drives':
      ensure => present,
      key    => 'DoNotOfferNewDisksForBackup',
      domain => 'com.apple.TimeMachine',
      value  => true,
      type   => 'bool';

    'Disable reopen windows when logging back in':
      ensure => present,
      key    => 'TALLogoutSavesState',
      domain => 'com.apple.loginwindow',
      value  => false,
      type   => 'bool';

    'Disable press-and-hold character picker':
      ensure => present,
      key    => 'ApplePressAndHoldEnabled',
      domain => 'NSGlobalDomain',
      value  => false,
      type   => 'bool';

    'Secure Empty Trash':
      ensure => present,
      key    => 'EmptyTrashSecurely',
      domain => 'com.apple.finder',
      value  => true,
      type   => 'bool';

    'Always use current directory in default search':
      ensure => present,
      key    => 'FXDefaultSearchScope',
      domain => 'com.apple.finder',
      value  => 'SCcf',
      type   => 'string';

    'Do not create .DS_Store':
      ensure => present,
      key    => 'DSDontWriteNetworkStores',
      domain => 'com.apple.dashboard',
      value  => true,
      type   => 'bool';

    'Disable the "Are you sure you want to open this application?" dialog':
      ensure => present,
      key    => 'LSQuarantine',
      domain => 'com.apple.LaunchServices',
      value  => true,
      type   => 'bool';

    'Key repeat on steroids':
      ensure => present,
      domain => 'NSGlobalDomain',
      key    => 'KeyRepeat',
      value  => '0',
      type   => 'int';

    'Expand save panel by default':
      ensure => present,
      key    => 'NSNavPanelExpandedStateForSaveMode',
      domain => 'NSGlobalDomain',
      value  => true,
      type   => 'bool';

    'Expand print panel by default':
      ensure => present,
      key    => 'PMPrintingExpandedStateForPrint',
      domain => 'NSGlobalDomain',
      value  => true,
      type   => 'bool';

    'Minimize on Double-Click':
      ensure => present,
      key    => 'AppleMiniaturizeOnDoubleClick',
      domain => 'NSGlobalDomain',
      value  => true,
      type   => 'bool';

    'Put my Dock on the left':
      ensure => present,
      key    => 'orientation',
      domain => 'com.apple.dock',
      value  => 'left',
      type   => 'string';

    'Make function keys do real things, and not apple things':
      ensure => present,
      key    => 'com.apple.keyboard.fnState',
      domain => 'NSGlobalDomain',
      value  => true,
      type   => 'bool';

  }
}
