class base::lamp{
	package { "apache2": }
	package { "php5": }
	package { "php5-mysql": }
	package { "mysql-server": }

	exec { "mysqlpasswd":
		command => "/usr/bin/mysqladmin -u root password 1b4e76214e5ee216af623d46a6b12e5652565154404322d3c51fd50dfd291fcd",
		notify => [Service["mysql"], Service["apache2"]],
		require => [Package["mysql-server"], Package["apache2"]],
	}

	service { "apache2":
		ensure => "running",
		enable => "true",
		require => Package["apache2"],
	}

	service { "mysql":
		ensure => "running",
		enable => "true",
		require => Package["mysql-server"],
	}

file { "/var/www/index.php":
        notify => Service["apache2"],
        ensure => "present",
        source => "puppet:///modules/lamp/index.php",
        owner => "root",
        group => "root",
        mode => 644,
        require => [Package["apache2"], Package["php5"]],
    }

}