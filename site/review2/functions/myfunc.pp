function puppet::myfunc( Variant[String,Numeric,Boolean] $inputvalue ) {
  case $inputvalue {
    Undef:   { false }
    Boolean: { $inputvalue }
    Numeric: {
      case $inputvalue {
        0:       { false }
        default: { true }
      }
    }
    String: {
      case $inputvalue {
        /^(?i:off|false|no|n|'')$/: { false }
        default: { true }
      }
    }
  }
}
