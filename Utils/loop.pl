#!/usr/bin/perl

# Imports
use Math::Prime::Util qw(is_prime);

# Command-line parameters
my $min = shift;
my $max = shift;
my $verbose = shift;

# Counter declarations
my $primes = 0;
my $composites = 0;
my @unknowns = ();
my $known = 0;

# Loop
if ( $verbose ) {
	for ( $min .. $max ) {
		if ( is_prime( $_ ) ) {
			print "$_ is prime.\n";
			$primes++;
		} else {
			push @unknowns, $_ if ( system( "./findseq.sh $_" ) >> 8 );
			$composites++;
		}
	}
} else {
	for ( $min .. $max ) {
		if ( is_prime( $_ ) ) {
			$primes++;
		} else {
			push @unknowns, $_ if ( system( "./findseq.sh $_ > /dev/null" ) >> 8 );
			$composites++;
		}
	}
}

# Display
print "$primes primes.\n";
print "$composites composites.\n";
my $unknown = @unknowns;
$known = $composites - $unknown;
print "$known known.\n";

# Unknowns
if ( $verbose ) {
	print "$unknown unknown:\n";
	for my $num (@unknowns) {
		print "$num ";
	}
	print "\n";
} else {
	print "$unknown unknown.\n";
}

exit 0;
