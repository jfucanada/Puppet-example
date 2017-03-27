## Date:        2017-03-26
## Owner:       Jeffrey Fu
## Version:     puppet 3.8
## Module:      bashrc

class  bashrc {

    file_line {'bashrc':
    ensure => present,
    path => '/etc/bashrc',
    line => 'export PROMPT_COMMAND=\'RETRN_VAL=$?;logger -p  local5.debug "$(whoami) [$$]: $(history 1 | sed "s/^[ ]*[0-9]\+[ ]*//" ) [$RETRN_VAL]"\'',

     }

  case $v_os {
     'rhel6': {
        file_line { '/etc/rsyslog.conf':
                    ensure => 'present',
                    path => '/etc/rsyslog.conf',
                    line => 'local5.*     /var/log/audit.log',
                    notify => Service['rsyslog'],
                  }
        service { 'rsyslog':
            ensure => 'running',
        }
       }
     'rhel5': {
        file_line { '/etc/syslog.conf':
             ensure => 'present',
             path => '/etc/syslog.conf',
             line  => 'local5.*     /var/log/audit.log',
             notify => Service['syslog'],
        }
        service { 'syslog':
            ensure => 'running',
        }
       }
     'rhel7': {
        file_line { '/etc/rsyslog.conf':
             ensure => 'present',
             path => '/etc/rsyslog.conf',
             line  => 'local5.*     /var/log/audit.log',
             notify => Service['rsyslog'],
        }
        service { 'rsyslog':
            ensure => 'running',
        }
       }
   }
}
