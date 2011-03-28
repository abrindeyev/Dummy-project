#!/usr/bin/perl

use strict;
use JSON::XS;
#undef $/;
my $a = '';
while (<>) { $a .= $_ }
my $d = decode_json $a;
#use Data::Dumper;
print $d->{'commits'}[0]->{'id'};
