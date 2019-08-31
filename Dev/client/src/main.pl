#!/usr/bin/env perl


use strict;
use warnings;

use Net::SNMP;

my @machine_list=('192.168.1.3','192.168.1.3');

foreach my $machine (@machine_list){
	my $OID_sysUpTime = '1.3.6.1.2.1.1.3.0';
	
	my ($session, $error) = Net::SNMP->session(
		-hostname  => $machine , 
		-community => 'public',
	);
	
	if (!defined $session) {
		printf "ERROR: %s.\n", $error;
		exit 1;
	}
	
	my $result = $session->get_request(-varbindlist => [ $OID_sysUpTime ],);
	
	if (!defined $result) {
		printf "ERROR: %s.\n", $session->error();
		$session->close();
		exit 1;
	}
	
	printf "The sysUpTime for host '%s' is %s.\n",
		$session->hostname(), $result->{$OID_sysUpTime};
		$session->close();
	
}
exit 0;
