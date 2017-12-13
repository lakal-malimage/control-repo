class review2 (
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
        source => 'puppet:///modules/review2/test_file.txt',
        }
        
    file { '/tmp/lakal2':
        ensure  => 'present',
        mode    => '0660',
        content => epp( 'review2/templ' , { 'name' => 'amal', 'arr' => ['sv1','sv2','sv3'] } ),
        }
        
include review2::func
notify {"END":}
 
 }
 
   

    
