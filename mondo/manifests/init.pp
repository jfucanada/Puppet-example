## Date:        2017-03-26
## Owner:       Jeffrey Fu
## Version:     puppet 3.8
## Module:      mondo


class mondo {

       $directories = [ '/root/scripts/', '/root/scripts/mondo/', ]

        file { $directories:
                 ensure => 'directory',
                 owner => 'root',
                 group => 'root',
                 mode => '0750',
          }

        file { '/root/scripts/mondo/runmondo.sh':
                 content => template('mondo/mondo.erb'),
                 owner => 'root',
                 group => 'root',
                 mode => '0550',
             }

          cron {'cron_mondo':
             ensure => 'present',
             command => '/root/scripts/mondo/runmondo.sh > /dev/null 2>&1',
             user   => 'root',
             hour  => 0,
             minute => 1,
             weekday => 0
        }
}
