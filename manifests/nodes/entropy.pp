node 'entropy.dtg.cl.cam.ac.uk' {
  # We don't have a local mirror of raspbian to point at
  class { 'minimal': manageapt => false, }
  class { 'dtg::entropy::host':
    certificate => '/root/puppet/ssl/stunnel.pem',
    private_key => '/root/puppet/ssl/stunnel.pem',
    ca          => '/usr/local/share/ssl/cafile',
    stage       => 'entropy-host'
  }
}
if ( $::fqdn == $::nagios_machine_fqdn ) {
  nagios_monitor { 'entropy':
    parents    => '',
    address    => 'entropy.dtg.cl.cam.ac.uk',
    hostgroups => [ 'ssh-servers'],
  }
}
if ( $::fqdn == $::munin_machine_fqdn ) {
  munin::gatherer::configure_node { 'entropy': }
}