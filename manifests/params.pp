# Class: couchdb::params
#
#   The couchdb configuration settings.
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
class couchdb::params {

  # Standard params
  $admin_name                 = 'admin'
  $admin_password             = 'admin'
  $allow_jsonp                = false
  $authentication_handlers    = '{couch_httpd_oauth, oauth_authentication_handler}, {couch_httpd_auth, cookie_authentication_handler}, {couch_httpd_auth, default_authentication_handler}'
  $bind_address               = '127.0.0.1'
  $couchdb_conf_dir           = '/etc/couchdb'
  $create_admin               = true
  $database_dir               = '/var/lib/couchdb'
  $delayed_commits            = true
  $default_handler            = '{couch_httpd_db, handle_request}'
  $document_size_unit         = 'bytes'
  $include_sasl               = true
  $javascript                 = '/usr/bin/couchjs /usr/share/couchdb/server/main.js'
  $log_file                   = '/var/log/couchdb/couch.log'
  $log_level                  = 'info'
  $log_max_chunk_size         = '1000000'
  $manage_epel_repo           = true
  $max_attachment_chunk_size  = '4294967296 ;4GB'
  $max_connections            = '2048'
  $max_dbs_open               = '100'
  $max_document_size          = '4294967296'
  $os_process_timeout         = '5000 ; 5 seconds. for view and external servers.'
  $package_ensure             = 'present'
  $port                       = '5984'
  $reduce_limit               = true
  $require_valid_user         = false
  $secret                     = 'changeme'
  $secure_rewrites            = true
  $service_enable             = true
  $util_driver_dir            = undef
  $uri_file                   = '/var/lib/couchdb/couch.uri'
  $vhost_global_handlers      = '_utils, _uuids, _session, _oauth, _users'
  $view_index_dir             = '/var/lib/couchdb'

  case $::osfamily {
    'RedHat': {
      $server_package_name = 'couchdb'
    }
    default: {
      fail("Unsupported osfamily: ${::osfamily} operatingsystem: ${::operatingsystem}, module ${module_name} only RedHat/CentOS is supported")
    }
  }
}
