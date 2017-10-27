Aliquot Family Tree Graphs
==========================

Data
----

This dataset is a repository of aliquot family trees. The data here comprise
the terminations and merges of sequences that do not go above 1,000,000. It is
sorted into five folders based on termination/merge type: Cycles, NotOpen,
Open, Perfect, and Primes. Due to size limits, Open and Primes are further
sorted based on prime or sequence start number into a tree of subfolders. Open
has two sublevels and Primes has three, splitting the files into groups of
ten-thousands or thousands, respectively.

The data files are in GraphViz format, and are named in the form "#.txt",
where "#" is:

* # is prime or a perfect number: sequences terminating at this number
* # is the start of an open sequence: sequences merging into this sequence
* # is in a cycle: sequences merging into this cycle (# is the lowest number)
* #.txt is in NotOpen: branch of a closed sequence starting at this number

Utility scripts
---------------

Utils has three scripts to query the dataset. count.pl gives the number of
sequences found in the dataset, both per type and overall. findseq.sh is a
shell script that calls grep to find a particular number in the dataset.
loop.pl specifically loops over a given range to find the number of primes,
composites, and composites found and not found in the dataset. An option may
be passed to print the missing numbers. All three scripts require the Unix
utilities grep and wc.

License and contacts
--------------------

This information is not original and should be in the public domain anyway.
However, I am unsure if this particular dataset is copyrighted by me. To
ensure that this dataset is safely available under PD-like terms in as many
jurisdictions as possible, I have licensed this under the CC0 license. The
terms of the license can be found in the duplicated COPYING and LICENSE files.
Basically, you can do whatever you want with this data. I wouldn't mind
attribution, but it's obviously not required.

If you have questions, contact me on the Mersenne Forum (Happy5214) or by
email (happy5214 <at> gmail <dot> com).

Enjoy!
