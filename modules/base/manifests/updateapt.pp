class base::updateapt{
  exec { "updateapt":
    path => "/usr/bin",
    command => "apt-get update",
  }
}
