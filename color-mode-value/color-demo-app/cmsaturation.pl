#!/bin/perl
use strict;
use warnings FATAL => 'all';
use 5.010;

use Scalar::Util qw(looks_like_number);

my ($output, $saturation) = @ARGV;

if (not scalar @ARGV == 2 or not looks_like_number $saturation) {
    my $name = $0 =~ s{.*/}{}r;
    print <<END;
Usage: $name <output> <number>

Examples:
    $name DisplayPort-0 1.2
    $name DisplayPort-0 1
END
    exit 1;
}

my $s = (1.0 - $saturation) / 3;
my @ctm = (
    $s + $saturation,
    $s,
    $s,
    $s,
    $s + $saturation,
    $s,
    $s,
    $s,
    $s + $saturation
);

my $path = $0 =~ s{(.*/)?.*}{$1}r;
system
    "$path"."cmdemo",
    "-o", $output,
    "-c", join(":", @ctm);
