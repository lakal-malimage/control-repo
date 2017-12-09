class review (
    $user = String undef,
) {
    $homedir = $user ? {
      'root' => '/root',
      defautl => "/home/${user}",
    }
    
    user { "$user": 
        ensure    => 'present',
        comment   => 'Test account',
        home      => "$homedir",
        password  => '$1$TaBlusm3$xCAUdPp.Qbo4EPOqauuY/1',
    }
}
   
    
