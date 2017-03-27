PUPPET – ADD OR REPLACE A STRING IN A FILE
MARCH 6, 2014 YKYUEN	10 COMMENTS
We can use the file_line type reference to append or substitute a string inside a file with regular expression.

Add a string

file { '/tmp/eureka.txt':
  ensure => present,
}->
file_line { 'Append a line to /tmp/eureka.txt':
  path => '/tmp/eureka.txt',  
  line => 'Hello World',
}
 

Replace a string

file { '/tmp/eureka.txt':
  ensure => present,
}->
file_line { 'Append a line to /tmp/eureka.txt':
  path => '/tmp/eureka.txt',  
  line => 'Hello Eureka',
  match   => "^Hello.*$",
}
 

When you to replace the string, make sure the line attribute is also an valid entry in the match regular expression.

Done =)

Reference:

Module of the Week: puppetlabs/stdlib – Puppet Labs standard library
Puppet user Google Group – using file_line with match
