## Date:        2017-03-26
## Owner:       Jeffrey Fu
## Version:     puppet 3.8
## Module:      sudo


class  sudo {

  file_line {'sudo_line1':
    path => '/etc/sudoers',
    ensure => present,
    line => 'ucmdb ALL=NOPASSWD:/usr/sbin/dmidecode -t',
    match => ".*ucmdb.*ALL=NOPASSWD:/usr/sbin/dmidecode.*-t",
            }

  file_line {'sudo_line2':
    path => '/etc/sudoers',
    ensure => present,
    line => 'Defaults:nagios,ucmdb !requiretty',
    match => ".*Defaults:nagios,ucmdb.*!requiretty",
            }

  file_line {'sudo_line3':
    path => '/etc/sudoers',
    ensure => present,
    line => 'nagios  ALL=NOPASSWD:   /usr/local/nagios/libexec/check_logfiles -t 10 -f /usr/local/nagios/libexec/check_logfiles_rhe-sudo.cfg',
    match => ".*nagios.*ALL=NOPASSWD:.*/usr/local/nagios/libexec/check_logfiles.*-t.*10.*-f.*/usr/local/nagios/libexec/check_logfiles_rhe-sudo.cfg",

            }

#  notify { 'This is is for sudo': }
}
