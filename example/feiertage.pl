#!/usr/bin/perl -w
use strict;
use warnings;
use Date::Holidays::DE qw(holidays);

# Sample script for Date::Holidays::DE by Martin Schmitt <mas at scsy dot de>

# Assign full names to the internal aliases from Date::Holidays::DE
# See the manpage for a list of all aliases.
my %feiertagsnamen = (
		'neuj' => 'Neujahrstag',
		'hl3k' => 'Hl. 3 K�nige',
		'romo' => 'Rosenmontag',
		'fadi' => 'Faschingsdienstag',
		'karf' => 'Karfreitag',
		'osts' => 'Ostersonntag',
		'ostm' => 'Ostermontag',
		'pfis' => 'Pfingstsonntag',
		'pfim' => 'Pfingstmontag',
		'himm' => 'Himmelfahrtstag',
		'fron' => 'Fronleichnam',
		'1mai' => 'Maifeiertag',
		'mari' => 'Mari� Himmelfahrt',
		'3okt' => 'Tag der deutschen Einheit',
		'refo' => 'Reformationstag',
		'alhe' => 'Allerheiligen',
		'buss' => 'Bu�- und Bettag',
		'heil' => 'Heiligabend',
		'wei1' => '1. Weihnachtstag',
		'wei2' => '2. Weihnachtstag',
		'silv' => 'Silvester'
			);
# This year is $dieses
my $dieses    = (localtime(time()))[5] + 1900;

# Next year is $naechstes
my $naechstes = $dieses + 1;

# Get the list of holidays for next year
my @feiertage = @{holidays( WHERE  => ['all'], 
			    FORMAT => "%#:%d.%m.%Y",
			    YEAR   => $naechstes
			    )};

print "Feiertage f�r $naechstes:\n";
print "-------------------\n";

foreach (@feiertage){
	# Split name and date
	my ($name, $datum) = split /:/;
	# Print name from $feiertagsnamen along with the date
	printf ("%-30s: %10s\n", $feiertagsnamen{$name}, $datum);
}

exit 0;
