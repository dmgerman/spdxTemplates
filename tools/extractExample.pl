#!/usr/bin/perl

use strict;

while (<>) {
    chomp;
    if (not /\{\{/) {
	print "$_\n";
	next;
    } 
    while (/^(.*){{(.*?)}}(.*)$/) {
	$_ = $3;
	print "$1";
	print Subs(Extract_Example($2));
    }
    print "$_\n";
}

sub Subs
{
    my ($text)  = @_;
    $text =~ s/\\n/\n/g;
    return $text;
}

sub Extract_Example
{
    my ($fields) = @_;
    
    if ($fields =~ /example=(.+)$/) {
#	print "[$1]\n";
	return $1;
    } else {
	return "NONE";
    }
}
