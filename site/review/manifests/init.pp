class review (
    String $user = 'undef',
) {
    $homedir = $user ? {
        'root' => '/root',
        default => "/home/${user}",
    }
    
    user { "$user": 
        ensure    => 'present',
        comment   => 'Test account',
        home      => "$homedir",
        password  => '$1$TaBlusm3$xCAUdPp.Qbo4EPOqauuY/1',
    }
    
    file { '/tmp/lakal':
        ensure  => 'present',
        mode    => '0660',
        source => 'puppet:///modules/review/test_file.txt',
        }
 }
   
    
