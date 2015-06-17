#!/usr/bin/perl

# Counter declarations
my $primes = 0;
my $open = 0;
my $perfect = 0;
my $cycles = 0;

# Prime-terminating counter
sub primes {
	my $count = 0;
	my @files = glob( '../Primes/*/*.txt' );
	for my $file (@files) {
		no warnings 'numeric';
		my $lines = `/usr/bin/wc -l \"$file\" 2>/dev/null`;
		$count += $lines - 5;
	}
	return $count;
}

# Perfect/Cycle-terminating counter
sub cycles {
	my $folder = shift;
	my $count = 0;
	my @files = glob( "../$folder/*.txt" );
	for my $file (@files) {
		no warnings 'numeric';
		my $lines = `/usr/bin/wc -l \"$file\" 2>/dev/null`;
		$count += $lines - 6;
	}
	return $count;
}

# Open sequence merge counter
sub opens {
	my $count = 0;
	my @files = glob( "../Open/*.txt" );
	for my $file (@files) {
		no warnings 'numeric';
		my $lines = `grep -c -P \"\\-\\>\" \"$file\" 2>/dev/null`;
		$count += $lines + 1;
	}
	return $count;
}

# Calculate
$primes = primes();
$perfect = cycles( 'Perfect' );
$cycles = cycles( 'Cycles' );
$open = opens();

my $total = $primes + $perfect + $cycles + $open;

# Display
print "There are...\n
       $primes sequences terminating at primes,
       $perfect sequences terminating at perfect numbers,
       $cycles sequences terminating at aliquot cycles,
       $open sequences merging into open sequences, and
       $total total sequences represented in this dataset.\n";

exit 0;
