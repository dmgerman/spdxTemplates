#!/usr/bin/perl

use strict;

while (<>) {
    chomp;
    s/<<beginOptional;name=[^>]+>>//g;
    s/<<endOptional>>//g;
    if (not /<</) {
	print "$_\n";
	next;
    } 
    while (/^(.*?)<<(.*?)>>(.*)$/) { # non-greedy search
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
	return "\n[[[Warning Example missing!!!]]]]\n";
    }
}
