stage { "updateapt": before => Stage['main'] }
class { "base::updateapt": stage => "updateapt" }

