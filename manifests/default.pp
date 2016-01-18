stage { "updateapt": before => Stage['main'] }
class { "base::updateapt": stage => "updateapt" }

class { "base::lamp": }
