#!/usr/bin/env perl

use strict;
use warnings;

use Imager;

my @LAYOUTS = qw(
	am bg by cz de ee es fr gb ge gr hr hu is it kz
	lt lv no pl pt ro ru se si sk sr ua us uz fi zz
);

# Setup Imager

my $color = Imager::Color->new( xname => 'yellow' );

my $font = Imager::Font->new(
	file => 'Inconsolata.otf',
	color => $color,
);

# Setup directory

my $dir = 'labels';

if ( ! -e $dir ) {
	mkdir $dir or die "Cannot create [$dir]: $!";
}

# Write images

foreach my $layout ( @LAYOUTS ) {
	my $filename = "$dir/$layout.png";

	my $img = Imager->new( xsize => 24, ysize => 24, channels => 4 );

	$img->string(
		font  => $font,
		text  => $layout,
		x     => 1,
		y     => 18,
		size  => 22,
		color => $color,
		aa    => 1,
	);

	$img->write( file => $filename, type => 'png' )
		or die "Cannot write [$filename]: ", $img->errstr;
}
