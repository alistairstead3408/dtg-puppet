node 'dhcp.dtg.cl.cam.ac.uk' {
  include 'dtg::minimal'

  class { 'network::interfaces':
    interfaces => {
      'eth0' => {
        'method'          => 'static',
        'address'         => '128.232.21.8',
        'netmask'         => '255.255.252.0',
        'gateway'         => '128.232.20.1',
        'dns-nameservers' => $::dns_name_servers,
      }
    },
    auto       => ['eth0'],
  }

  class { 'dhcp':
   dnsdomain    => [
                     $org_domain,
                    '128.232.20.in-addr.arpa',
                    ],
    nameservers => $name_servers,
    ntpservers  => $ntp_servers,
    interfaces  => ['eth0'],

  }

  dhcp::pool{ 'dtg.cl.cam.ac.uk':
    network    => '128.232.20.0',
    mask       => '255.255.252.0',
    range      => ['128.232.20.8', '128.232.22.255'],
    # gateway should be route.cl
    gateway    => '128.232.20.1',
    parameters => 'deny unknown-clients',
  }
  dhcp::host {
    'rscfl-vguest-0':mac => '00:16:3F:00:00:00', ip => '128.232.22.50';
    'rscfl-vguest-1':mac => '00:16:3F:00:00:01', ip => '128.232.22.51';
    'rscfl-vguest-2':mac => '00:16:3F:00:00:02', ip => '128.232.22.52';
    'rscfl-vguest-3':mac => '00:16:3F:00:00:03', ip => '128.232.22.53';
    'rscfl-vguest-4':mac => '00:16:3F:00:00:04', ip => '128.232.22.54';
    'rscfl-vguest-5':mac => '00:16:3F:00:00:05', ip => '128.232.22.55';
    'rscfl-vguest-6':mac => '00:16:3F:00:00:06', ip => '128.232.22.56';
    'rscfl-vguest-7':mac => '00:16:3F:00:00:07', ip => '128.232.22.57';
    'rscfl-vguest-8':mac => '00:16:3F:00:00:08', ip => '128.232.22.58';
    'rscfl-vguest-9':mac => '00:16:3F:00:00:09', ip => '128.232.22.59';
    'rscfl-vguest-10':mac => '00:16:3F:00:00:10', ip => '128.232.22.60';
    'rscfl-vguest-11':mac => '00:16:3F:00:00:11', ip => '128.232.22.61';
    'rscfl-vguest-12':mac => '00:16:3F:00:00:12', ip => '128.232.22.62';
    'rscfl-vguest-13':mac => '00:16:3F:00:00:13', ip => '128.232.22.63';
    'rscfl-vguest-14':mac => '00:16:3F:00:00:14', ip => '128.232.22.64';
    'rscfl-vguest-15':mac => '00:16:3F:00:00:15', ip => '128.232.22.65';
    'rscfl-vguest-16':mac => '00:16:3F:00:00:16', ip => '128.232.22.66';

    'rscfl-vguest-s-0':mac => '00:16:3F:00:00:17', ip => '128.232.22.67';
    'rscfl-vguest-s-1':mac => '00:16:3F:00:00:18', ip => '128.232.22.68';
    'rscfl-vguest-s-2':mac => '00:16:3F:00:00:19', ip => '128.232.22.69';
    'rscfl-vguest-s-3':mac => '00:16:3F:00:00:20', ip => '128.232.22.70';
    'rscfl-vguest-s-4':mac => '00:16:3F:00:00:21', ip => '128.232.22.71';
    'rscfl-vguest-s-5':mac => '00:16:3F:00:00:22', ip => '128.232.22.72';
    'rscfl-vguest-s-6':mac => '00:16:3F:00:00:23', ip => '128.232.22.73';
    'rscfl-vguest-s-7':mac => '00:16:3F:00:00:24', ip => '128.232.22.74';
    'rscfl-vguest-s-8':mac => '00:16:3F:00:00:25', ip => '128.232.22.75';
    'rscfl-vguest-s-9':mac => '00:16:3F:00:00:26', ip => '128.232.22.76';
    'rscfl-vguest-s-10':mac => '00:16:3F:00:00:27', ip => '128.232.22.77';
    'rscfl-vguest-s-11':mac => '00:16:3F:00:00:28', ip => '128.232.22.78';
    'rscfl-vguest-s-12':mac => '00:16:3F:00:00:29', ip => '128.232.22.79';
    'rscfl-vguest-s-13':mac => '00:16:3F:00:00:30', ip => '128.232.22.80';
    'rscfl-vguest-s-14':mac => '00:16:3F:00:00:31', ip => '128.232.22.81';
    'rscfl-vguest-s-15':mac => '00:16:3F:00:00:32', ip => '128.232.22.82';
    'rscfl-vguest-s-16':mac => '00:16:3F:00:00:33', ip => '128.232.22.83';

    'rscfl-wguest-0':mac => '00:16:3F:00:01:00', ip => '128.232.22.100';

    'saluki1-nic3':mac => '00:1e:67:ba:ba:13', ip =>'128.232.22.49';
    'rscfl-10g-0':mac => '00:0f:53:16:0f:ec', ip => '128.232.22.18';
    'wolf1-10g':mac => '00:0f:53:08:da:bd', ip => '128.232.22.20';
    'wolf2-10g':mac => '00:0f:53:08:cf:c4', ip => '128.232.22.19';

    'wolf0':mac => '00:1e:67:59:8b:6f', ip => '128.232.22.8';
    'wolf1':mac => '00:1e:67:51:c4:03', ip => '128.232.22.10';
    'wolf2':mac => '00:1e:67:b6:52:7f', ip => '128.232.22.11';
    'collar0':mac => '00:80:a3:a3:10:b3', ip => '128.232.22.128';
    'collar1':mac => '00:80:a3:a3:10:c9', ip => '128.232.22.129';
    'inuit':mac => '00:92:58:00:53:c3', ip => '128.232.20.17';
    'spaniel':mac => 'b8:27:eb:bc:d7:cb', ip => '128.232.20.96';
    'fluffy':mac => '00:04:4b:26:fa:34', ip => '128.232.20.97';

    'poodle':mac => 'b8:27:eb:85:bd:42', ip => '128.232.20.136';
    'entropy':mac => 'b8:27:eb:ae:dc:89', ip => '128.232.20.137';

    'puppy0':mac => '00:16:3E:E8:14:1C', ip => '128.232.21.0';
    'puppy1':mac => '00:16:3E:E8:14:1D', ip => '128.232.21.1';
    'puppy2':mac => '00:16:3E:E8:14:1E', ip => '128.232.21.2';
    'puppy3':mac => '00:16:3E:E8:14:1F', ip => '128.232.21.3';
    'puppy4':mac => '00:16:3E:E8:14:20', ip => '128.232.21.4';
    'puppy5':mac => '00:16:3E:E8:14:21', ip => '128.232.21.5';
    'puppy6':mac => '00:16:3E:E8:14:22', ip => '128.232.21.6';
    'puppy7':mac => '00:16:3E:E8:14:23', ip => '128.232.21.7';
    'puppy8':mac => '00:16:3E:E8:14:24', ip => '128.232.21.8';
    'puppy9':mac => '00:16:3E:E8:14:25', ip => '128.232.21.9';
    'puppy10':mac => '00:16:3E:E8:14:26', ip => '128.232.21.10';
    'puppy11':mac => '00:16:3E:E8:14:27', ip => '128.232.21.11';
    'puppy12':mac => '00:16:3E:E8:14:28', ip => '128.232.21.12';
    'puppy13':mac => '00:16:3E:E8:14:29', ip => '128.232.21.13';
    'puppy14':mac => '00:16:3E:E8:14:2A', ip => '128.232.21.14';
    'puppy15':mac => '00:16:3E:E8:14:2B', ip => '128.232.21.15';
    'puppy16':mac => '00:16:3E:E8:14:2C', ip => '128.232.21.16';
    'puppy17':mac => '00:16:3E:E8:14:2D', ip => '128.232.21.17';
    'puppy18':mac => '00:16:3E:E8:14:2E', ip => '128.232.21.18';
    'puppy19':mac => '00:16:3E:E8:14:2F', ip => '128.232.21.19';
    'puppy20':mac => '00:16:3E:E8:14:30', ip => '128.232.21.20';
    'puppy21':mac => '00:16:3E:E8:14:31', ip => '128.232.21.21';
    'puppy22':mac => '00:16:3E:E8:14:32', ip => '128.232.21.22';
    'puppy23':mac => '00:16:3E:E8:14:33', ip => '128.232.21.23';
    'puppy24':mac => '00:16:3E:E8:14:34', ip => '128.232.21.24';
    'puppy25':mac => '00:16:3E:E8:14:35', ip => '128.232.21.25';
    'puppy26':mac => '00:16:3E:E8:14:36', ip => '128.232.21.26';
    'puppy27':mac => '00:16:3E:E8:14:37', ip => '128.232.21.27';
    'puppy28':mac => '00:16:3E:E8:14:38', ip => '128.232.21.28';
    'puppy29':mac => '00:16:3E:E8:14:39', ip => '128.232.21.29';
    'puppy30':mac => '00:16:3E:E8:14:40', ip => '128.232.21.30';
    'puppy31':mac => '00:16:3E:E8:14:41', ip => '128.232.21.31';
    'puppy32':mac => '00:16:3E:E8:14:43', ip => '128.232.21.32';
    'puppy33':mac => '00:16:3E:E8:14:44', ip => '128.232.21.33';
    'puppy34':mac => '00:16:3E:E8:14:45', ip => '128.232.21.34';
    'puppy35':mac => '00:16:3E:E8:14:46', ip => '128.232.21.35';
    'puppy36':mac => '00:16:3E:E8:14:47', ip => '128.232.21.36';
    'puppy37':mac => '00:16:3E:E8:14:48', ip => '128.232.21.37';
    'puppy38':mac => '00:16:3E:E8:14:49', ip => '128.232.21.38';
    'puppy39':mac => '00:16:3E:E8:14:4A', ip => '128.232.21.39';
    'puppy40':mac => '00:16:3E:E8:14:4B', ip => '128.232.21.40';
    'puppy41':mac => '00:16:3E:E8:14:4C', ip => '128.232.21.41';
    'puppy42':mac => '00:16:3E:E8:14:4D', ip => '128.232.21.42';
    'puppy43':mac => '00:16:3E:E8:14:4E', ip => '128.232.21.43';
    'puppy44':mac => '00:16:3E:E8:14:4F', ip => '128.232.21.44';
    'puppy45':mac => '00:16:3E:E8:14:50', ip => '128.232.21.45';
    'puppy46':mac => '00:16:3E:E8:14:51', ip => '128.232.21.46';
    'puppy47':mac => '00:16:3E:E8:14:52', ip => '128.232.21.47';
    'puppy48':mac => '00:16:3E:E8:14:53', ip => '128.232.21.48';
    'puppy49':mac => '00:16:3E:E8:14:54', ip => '128.232.21.49';
    'puppy50':mac => '00:16:3E:E8:14:55', ip => '128.232.21.50';
    'puppy51':mac => '00:16:3E:E8:14:56', ip => '128.232.21.51';
    'puppy52':mac => '00:16:3E:E8:14:57', ip => '128.232.21.52';
    'puppy53':mac => '00:16:3E:E8:14:58', ip => '128.232.21.53';
    'puppy54':mac => '00:16:3E:E8:14:59', ip => '128.232.21.54';
    'puppy55':mac => '00:16:3E:E8:14:5A', ip => '128.232.21.55';
    'puppy56':mac => '00:16:3E:E8:14:5B', ip => '128.232.21.56';
    'puppy57':mac => '00:16:3E:E8:14:5C', ip => '128.232.21.57';
    'puppy58':mac => '00:16:3E:E8:14:5D', ip => '128.232.21.58';
    'puppy59':mac => '00:16:3E:E8:14:5E', ip => '128.232.21.59';
    'puppy60':mac => '00:16:3E:E8:14:5F', ip => '128.232.21.60';
    'puppy61':mac => '00:16:3E:E8:14:60', ip => '128.232.21.61';
    'puppy62':mac => '00:16:3E:E8:14:61', ip => '128.232.21.62';
    'puppy63':mac => '00:16:3E:E8:14:62', ip => '128.232.21.63';
    'puppy64':mac => '00:16:3E:E8:14:80', ip => '128.232.21.64';
    'puppy65':mac => '00:16:3E:E8:14:81', ip => '128.232.21.65';
    'puppy66':mac => '00:16:3E:E8:14:82', ip => '128.232.21.66';
    'puppy67':mac => '00:16:3E:E8:14:83', ip => '128.232.21.67';
    'puppy68':mac => '00:16:3E:E8:14:84', ip => '128.232.21.68';
    'puppy69':mac => '00:16:3E:E8:14:85', ip => '128.232.21.69';
    'puppy70':mac => '00:16:3E:E8:14:86', ip => '128.232.21.70';
    'puppy71':mac => '00:16:3E:E8:14:87', ip => '128.232.21.71';
    'puppy72':mac => '00:16:3E:E8:14:88', ip => '128.232.21.72';
    'puppy73':mac => '00:16:3E:E8:14:89', ip => '128.232.21.73';
    'puppy74':mac => '00:16:3E:E8:14:8A', ip => '128.232.21.74';
    'puppy75':mac => '00:16:3E:E8:14:8B', ip => '128.232.21.75';
    'puppy76':mac => '00:16:3E:E8:14:8C', ip => '128.232.21.76';
    'puppy77':mac => '00:16:3E:E8:14:8D', ip => '128.232.21.77';
    'puppy78':mac => '00:16:3E:E8:14:8E', ip => '128.232.21.78';
    'puppy79':mac => '00:16:3E:E8:14:8F', ip => '128.232.21.79';
    'puppy80':mac => '00:16:3E:E8:14:90', ip => '128.232.21.80';
    'puppy81':mac => '00:16:3E:E8:14:91', ip => '128.232.21.81';
    'puppy82':mac => '00:16:3E:E8:14:92', ip => '128.232.21.82';
    'puppy83':mac => '00:16:3E:E8:14:93', ip => '128.232.21.83';
    'puppy84':mac => '00:16:3E:E8:14:94', ip => '128.232.21.84';
    'puppy85':mac => '00:16:3E:E8:14:95', ip => '128.232.21.85';
    'puppy86':mac => '00:16:3E:E8:14:96', ip => '128.232.21.86';
    'puppy87':mac => '00:16:3E:E8:14:97', ip => '128.232.21.87';
    'puppy88':mac => '00:16:3E:E8:14:98', ip => '128.232.21.88';
    'puppy89':mac => '00:16:3E:E8:14:99', ip => '128.232.21.89';
    'puppy90':mac => '00:16:3E:E8:14:9A', ip => '128.232.21.90';
    'puppy91':mac => '00:16:3E:E8:14:9B', ip => '128.232.21.91';
    'puppy92':mac => '00:16:3E:E8:14:9C', ip => '128.232.21.92';
    'puppy93':mac => '00:16:3E:E8:14:9D', ip => '128.232.21.93';
    'puppy94':mac => '00:16:3E:E8:14:9E', ip => '128.232.21.94';
    'puppy95':mac => '00:16:3E:E8:14:9F', ip => '128.232.21.95';
    'puppy96':mac => '00:16:3E:E8:15:A0', ip => '128.232.21.96';
    'puppy97':mac => '00:16:3E:E8:15:A1', ip => '128.232.21.97';
    'puppy98':mac => '00:16:3E:E8:15:A2', ip => '128.232.21.98';
    'puppy99':mac => '00:16:3E:E8:15:A3', ip => '128.232.21.99';
    'puppy100':mac => '00:16:3E:E8:15:A4', ip => '128.232.21.100';
    'puppy101':mac => '00:16:3E:E8:15:A5', ip => '128.232.21.101';
    'puppy102':mac => '00:16:3E:E8:15:A6', ip => '128.232.21.102';
    'puppy103':mac => '00:16:3E:E8:15:A7', ip => '128.232.21.103';
    'puppy104':mac => '00:16:3E:E8:15:A8', ip => '128.232.21.104';
    'puppy105':mac => '00:16:3E:E8:15:A9', ip => '128.232.21.105';
    'puppy106':mac => '00:16:3E:E8:15:AA', ip => '128.232.21.106';
    'puppy107':mac => '00:16:3E:E8:15:AB', ip => '128.232.21.107';
    'puppy108':mac => '00:16:3E:E8:15:AC', ip => '128.232.21.108';
    'puppy109':mac => '00:16:3E:E8:15:AD', ip => '128.232.21.109';
    'puppy110':mac => '00:16:3E:E8:15:AE', ip => '128.232.21.110';
    'puppy111':mac => '00:16:3E:E8:15:AF', ip => '128.232.21.111';
    'puppy112':mac => '00:16:3E:E8:15:B0', ip => '128.232.21.112';
    'puppy113':mac => '00:16:3E:E8:15:B1', ip => '128.232.21.113';
    'puppy114':mac => '00:16:3E:E8:15:B2', ip => '128.232.21.114';
    'puppy115':mac => '00:16:3E:E8:15:B3', ip => '128.232.21.115';
    'puppy116':mac => '00:16:3E:E8:15:B4', ip => '128.232.21.116';
    'puppy117':mac => '00:16:3E:E8:15:B5', ip => '128.232.21.117';
    'puppy118':mac => '00:16:3E:E8:15:B6', ip => '128.232.21.118';
    'puppy119':mac => '00:16:3E:E8:15:B7', ip => '128.232.21.119';
    'puppy120':mac => '00:16:3E:E8:15:B8', ip => '128.232.21.120';
    'puppy121':mac => '00:16:3E:E8:15:B9', ip => '128.232.21.121';
    'puppy122':mac => '00:16:3E:E8:15:BA', ip => '128.232.21.122';
    'puppy123':mac => '00:16:3E:E8:15:BB', ip => '128.232.21.123';
    'puppy124':mac => '00:16:3E:E8:15:BC', ip => '128.232.21.124';
    'puppy125':mac => '00:16:3E:E8:15:BD', ip => '128.232.21.125';
    'puppy126':mac => '00:16:3E:E8:15:BE', ip => '128.232.21.126';
    'puppy127':mac => '00:16:3E:E8:15:BF', ip => '128.232.21.127';

    # Puppy128-256 registered with sys-admin but not included in DHCP.
    # This is so to reduce internal fragmentation of the address space so that
    # if we want to open/close ports for a subset of puppies we have a lot of
    # the address space in which we can do so.

    'deviceanalyzer-database':mac => '00:0E:0C:BC:0E:E4', ip => '128.232.23.47';
  }
}

if ( $::monitor ) {
  nagios::monitor { 'dhcp':
    parents    => 'nas04',
    address    => 'dhcp.dtg.cl.cam.ac.uk',
    hostgroups => [ 'ssh-servers' ],
  }
  munin::gatherer::configure_node { 'dhcp': }
}
