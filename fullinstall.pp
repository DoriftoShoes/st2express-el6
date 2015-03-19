node default {
  class {'::st2::profile::fullinstall':
    st2api              => true,
    history             => true,
    resultstracker      => true,
    rules_engine        => true,
    sensor_container    => true,
    mistral             => true,
    actionrunners       => 5,
    web                 => false,
  }
}
