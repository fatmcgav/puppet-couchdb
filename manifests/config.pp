# Class: couchdb::config
#
# This module manages couchdb configuration
#
# Parameters:
#
# There are no default parameters for this class.
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
# This class file is not called directly
class couchdb::config {

  include couchdb::params

  File {
    owner => 'couchdb',
    group => 'root',
    mode  => '0644',
  }

  file { $couchdb::couchdb_conf_dir:
    ensure => directory,
  }

  file { $couchdb::database_dir:
    ensure => directory,
  }

  file { "${couchdb::couchdb_conf_dir}/local.ini":
    ensure  => file,
    content => template('couchdb/local.ini.erb'),
  }

  # Add a local.d file which CouchDB will write any modifications to.
  file { "${couchdb::couchdb_conf_dir}/local.d/99-couchdb.ini":
    ensure  => file,
    replace => no,
    content => '[couchdb]'
  }

}
