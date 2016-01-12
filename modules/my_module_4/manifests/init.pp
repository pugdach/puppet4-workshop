class my_module_4 (
  $param1 = 'false',
  $param2 = $my_module::params::param2,
  $param3 = 22
) inherits my_module_4::params {
  # validate_bool(str2bool($param1))
  # validate_array($param2)
  # validate_integer($param3)
  if $param1 {
    my_module_4::my_define { $param2: }
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
