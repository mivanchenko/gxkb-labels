#!/usr/bin/env perl

use strict;
use warnings;

use Getopt::Long;
use Imager;

my @LAYOUTS = qw(
	Am Bg By Cz De Ee Es Fr Gb Ge Gr Hr Hu Is It Kz
	Lt Lv No Pl Pt Ro Ru Se Si Sk Sr Ua Us Uz Fi Zz
);

my $case = 'capital';

GetOptions(
	'case=s' => \$case,
	'help'   => \my $help,
) or die usage();

die usage() if $help;

# Setup Imager

my $color = Imager::Color->new( xname => 'yellow' );

my $shadow_color = Imager::Color->new( xname => 'black' );
$shadow_color->set( 'alpha' => 128 );

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

	my $img = Imager->new( xsize => 24, ysize => 24, channels => 4 );

	$layout = ( $case eq 'upper' ) ? uc $layout
	        : ( $case eq 'lower' ) ? lc $layout
	        : $layout;

	# Draw shadow
	$img->string(
		font  => $font,
		text  => $layout,
		x     => 2,
		y     => 19,
		size  => 22,
		color => $shadow_color,
		aa    => 1,
	);

	# Draw text
	$img->string(
		font  => $font,
		text  => $layout,
		x     => 1,
		y     => 18,
		size  => 22,
		color => $color,
		aa    => 1,
	);

	my $filename = "$dir/\L$layout.png";

	$img->write( file => $filename, type => 'png' )
		or die "Cannot write [$filename]: ", $img->errstr;
}

sub usage { "\nUsage:\n$0 --case=[upper|lower]\n\n" }
