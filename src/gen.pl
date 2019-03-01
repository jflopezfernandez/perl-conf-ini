#!/usr/bin/perl
use strict;
use warnings;

my $dir = "./";
my $filename = "test.config"; # TODO: Get from argv
my $file = "$dir$filename";

my $inputFile = undef;
my $text = "";

open($inputFile, "< :encoding(UTF-8)", $filename) or die "[$filename] Failed to open file.\n";

# print "\nSettings: [$filename]\n\n";

while (my $line = readline($inputFile)) {
    # if ($line =~ /^$/) {
    #     next;
    # }

    # $line =~ s/[ \t\n]{2,}\n/\n/; # Remove white space width 2 or higher
    # $line =~ s/#.*\n//; # Ignore comments

    # Remove comments from file.
    if ($line =~ s/(?<Comment>#.*\n)/\n/) {
        # print "Comment: $+{Comment}\n";
    }

    # Shorten blank spaces in file.
    if ($line =~ s/[ \t]+/ /) {
        # Removed
    }

    # Remove consecutive new line characters.
    # if ($line =~ s/^\n$/\n/) {
    #    # Removed
    # }

    # if ($line =~ /\[(?<Section>.*)\]/) {
    #     print "Section: $+{Section}\n";

    #     next;
    # }

    # if ($line =~ /(?<Option>.*)=(?<Value>.*)/) {
    #     print "\n";
    #     print "    Option: $+{Option}\n";
    #     print "     Value: $+{Value}\n";
    #     print "\n";

    #     next;
    # }

    $text = "$text$line";
}

# Remove consecutive blank lines.
if ($text =~ s/\n+/\n/) {
    #
}

print $text;

my $len = length($text);

print "\n\n";
print "Characters: $len\n";

close($inputFile);
