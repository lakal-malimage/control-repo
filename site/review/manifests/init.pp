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
}
   
    
