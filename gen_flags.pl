#!/usr/bin/env perl

use strict;
use warnings;

use Imager;

my $img = Imager->new( xsize => 24, ysize => 24, channels => 4 );

my $color = Imager::Color->new( xname => 'yellow' );

my $font = Imager::Font->new(
	file => 'Inconsolata.otf',
	color => $color,
);

$img->string(
	font  => $font,
	text  => 'Us',
	x     => 1,
	y     => 18,
	size  => 22,
	color => $color,
	aa    => 1,
);

my $filename = 'us.png';

$img->write( file => $filename, type => 'png' )
	or die "Cannot write $filename: ", $img->errstr;
