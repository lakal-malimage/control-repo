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
        
    file { '/tmp/lakal2':
        ensure  => 'present',
        mode    => '0660',
        content => epp( 'review/templ' , { 'name' => 'amal', 'arr' => ['sv1','sv2','sv3'] } ),
        }
        
  #include review::func
  notice(myfunc(1,2))
  notice("END")
 }
   

    
