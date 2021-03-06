#!/usr/bin/perl

# Counter declarations
my $primes = 0;
my $open = 0;
my $notopen = 0;
my $perfect = 0;
my $cycles = 0;

my $part = shift // 'all';

# Prime-terminating counter
sub primes {
	my $count = 0;
	my @files = glob( '../Primes/*/*/*/*.txt' );
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
	my $folder = shift;
	my $count = 0;
	my @files = glob( "../$folder/*.txt" );
	for my $file (@files) {
		no warnings 'numeric';
		my $lines = `grep -c -P \"\\-\\>\" \"$file\" 2>/dev/null`;
		$count += $lines + 1;
	}
	return $count;
}

# Calculate
$primes = primes() if $part eq 'primes' || $part eq 'all';
$perfect = cycles( 'Perfect' ) if $part eq 'perfect' || $part eq 'all';
$cycles = cycles( 'Cycles' ) if $part eq 'cycles' || $part eq 'all';
$open = opens( 'Open/*/*' ) if $part eq 'open' || $part eq 'all';
$notopen = opens( 'NotOpen' ) if $part eq 'notopen' || $part eq 'all';

my $total = $primes + $perfect + $cycles + $open + $notopen;

# Display
print "There are...\n
       $primes sequences terminating at primes,
       $perfect sequences terminating at perfect numbers,
       $cycles sequences terminating at aliquot cycles,
       $open sequences merging into open sequences,
       $notopen sequences terminating after exceeding the dataset limit, and
       $total total sequences represented in this dataset.\n";

exit 0;
