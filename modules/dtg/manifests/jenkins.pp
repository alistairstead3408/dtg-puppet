class dtg::jenkins {
  class {'dtg::firewall::publichttp':}
  class {'dtg::firewall::80to8080': private => false}
  class {'dtg::tomcat::raven':}
  class {'dtg::jenkins::repos': stage => 'repos'}
  # To help build debian packages in jenkins
  package {'jenkins-debian-glue':
    ensure => present,
    require => Apt::Ppa['ppa:ucam-cl-dtg/jenkins'],
  }
  #packages required by jenkins jobs
  $jenkins_job_packages = [# One line per job's install list
    'inkscape',
    'openjdk-7-jdk',
    'reprepro','git-buildpackage', 'build-essential', 'cowbuilder', 'cowdancer', 'debootstrap','devscripts','pbuilder',
    'octave', 'octave-octgpr',
    'mysql-common',
    'maven',
    'postgresql-client-common','postgresql-client-9.1',
    'gradle',
    'jenkins-crypto-util', 'jenkins-external-job-monitor', 'jenkins-instance-identity', 'jenkins-memory-monitor', 'jenkins-ssh-cli-auth']
  package { $jenkins_job_packages:
    ensure => installed,
  }
  #packages required by jenkins
  package {['jenkins-tomcat','jenkins-cli']:
    ensure => installed,
  }
  $tomcat_version = '8'
  # Package installation actually creates this user and group
  group {"tomcat${tomcat_version}":
    ensure  => present,
    require => Package['jenkins-tomcat'],
  }
  user  {"tomcat${tomcat_version}":
    ensure => present,
    gid    => "tomcat${tomcat_version}",
  }
  sudoers::allowed_command{ 'jenkins':
    command          => '/usr/sbin/cowbuilder, /usr/sbin/chroot',
    user             => "tomcat${tomcat_version}",
    require_password => false,
    comment          => 'Allow tomcat to build debian packages using cowbuilder in a chroot',
  }
  file { "/usr/share/tomcat${tomcat_version}/.config/":
    ensure => directory,
    owner  => "tomcat${tomcat_version}",
    group  => "tomcat${tomcat_version}",
    mode   => '0775',
    require => Package['jenkins-tomcat'],
  }
  file { "/usr/share/tomcat${tomcat_version}/.m2/":
    ensure => directory,
    owner  => "tomcat${tomcat_version}",
    group  => "tomcat${tomcat_version}",
    mode   => '0775',
    require => Package['jenkins-tomcat'],
  }
  file { "/usr/share/tomcat${tomcat_version}/.android/":
    ensure => directory,
    owner  => "tomcat${tomcat_version}",
    group  => "tomcat${tomcat_version}",
    mode   => '0775',
  }
  file { "/usr/share/tomcat${tomcat_version}/.ssh/":
    ensure => directory,
    owner  => "tomcat${tomcat_version}",
    group  => "tomcat${tomcat_version}",
    mode   => '0700',
  }
  file { "/usr/share/tomcat${tomcat_version}/.ssh/config":
    ensure => file,
    owner  => "tomcat${tomcat_version}",
    group  => "tomcat${tomcat_version}",
    mode   => '0644',
  }
  wget::fetch { "download-gradle-plugin":
    source => "\"https://updates.jenkins-ci.org/download/plugins/gradle/1.21/gradle.hpi\"",
    destination => "/var/lib/jenkins/plugins/gradle.hpi",
    require => Package['jenkins-tomcat'],
  }

  wget::fetch { "gradlew setup":
    source => "\"http://services.gradle.org/distributions/gradle-1.4-all.zip\"",
    destination => "/var/lib/jenkins/workspace/external/gradle/gradle-1.4-all.zip",
    require => Package['jenkins-tomcat'],
  }
  #TODO(drt24) Default to java7
  # Modify /etc/jenkins/debian_glue to point at precise and have main and universe components
  # Restore jenkins jobs from backups
  # /usr/share/tomcat${tomcat_version}/{.ssh/{id_rsa,id_rsa.pub},.m2/settings.xml,.android/debug.keystore} need to be got from secrets server
}
# So that we can appy a stage to it
class dtg::jenkins::repos {
  apt::ppa {'ppa:ucam-cl-dtg/jenkins': }
}
