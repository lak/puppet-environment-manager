# This only works with the hiera integration in place and
# sufficient data to fill in these values.
#   I.e., hiera is our only strategy for looking up variables at
# this point.
define database($type, $user, $password = generate_value("dbpassword"), $address, $port) {
}

define application($type, $address, $port = generate_value("app_port"), $dbaddress, $dbport, $dbname, $dbuser, $dbpassword, $location = generate_value("app_location")) {
}

define site($appaddress, $appport) {
}

define myapp($type, $dbtype) {
  database { $name:
    type => $dbtype,
    user => $name,
  }

  Database[$name] -> Application[$name]
  slot { "db-app-$name": 
    type => type,
    address => dbaddress,
    port => dbport,
    name => dbname
  }

  application { $name:
  }

  Application[$name] -> Site[$name]
  slot { "app-site-$name": 
    type => $type,
    address => appaddress,
    port => appport
  }

  site { $name:
  }
}

node production {
  myapp { foo:
    type => rails,
    dbtype => mysql,
  }
}

node development {
  application { foo:
    type => rails,
    dbtype => mysql,
  }
}
