class my_module (
  $param1 = false,
  $param2 = $my_module::params::param2,
  $param3 = 22
) inherits my_module::params {
  validate_bool($param1)
  validate_array($param2)
  validate_integer($param3)
  if $param1 {
    my_module::my_define { $param2: }
  }
  case $param3 {
    '22': {
      notify { 'param3 is 22': }
    }
    default: {
      notify { 'param3 is not 22': }
    }
  }
}
