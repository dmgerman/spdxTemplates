#!/usr/bin/perl

while (<>) {
    chomp;
    s/<QUOTES>/"/g;
    if (not /\{\{/) {
	print "$_\n";
	next;
    } 
    while (/^(.*){{(.*?)}}(.*)$/) {
	$_ = $3;
	print "$1";
	print Extract_Example($2);
    }
    print $_;
    print "\n";
}

sub Extract_Example
{
    my ($fields) = @_;
    
    if ($fields =~ /example=(.+)$/) {
	return $1;
    } else {
	return "NONE";
    }
}
