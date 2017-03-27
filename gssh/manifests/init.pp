## Date:        2017-03-26
## Owner:       Jeffrey Fu
## Version:     puppet 3.8
## Module:      gssh

class gssh {

        file {  '/root/.ssh/':
                 ensure => 'directory',
                 owner => 'root',
                 group => 'root',
                 mode => '0700',
             }
## It will replace existing authorized_keys file with this template
        file { '/root/.ssh/authorized_keys':
                 content => template('gssh/authorized_keys_lnxprod.erb'),
                 owner => 'root',
                 group => 'root',
                 mode => '0600',
             }
}
