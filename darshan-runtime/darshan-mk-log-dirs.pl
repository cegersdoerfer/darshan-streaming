#!/usr/bin/perl -w
#
# Copyright (C) 2015 University of Chicago.
# See COPYRIGHT notice in top-level directory.
#

use File::Basename;

# creates a hierarchy of subdirectories for darshan to place log files in
# LOGDIR/<year>/<month>/<day>/

# use log dir specified at configure time
$LOGDIR = "/darshan-logs";


my $year = (localtime)[5] + 1900;
my $month;
my $day;
my $i;
my $j;
my $k;

umask(0);

if(not -d "$LOGDIR")
{
    print STDERR "Error: please make sure that the $LOGDIR directory already exists.\n";
    exit(1)
}

if(not -w "$LOGDIR")
{
    print STDERR "Error: please make sure that the $LOGDIR directory is writeable.\n";
    exit(1)
}

# go through the end of next year
for ($i=$year; $i<($year+2); $i++)
{
    die("Error: could not mkdir $LOGDIR/$i: $!.\n") unless(-e "$LOGDIR/$i" or mkdir("$LOGDIR/$i", 0755));
    for ($j=1; $j<13; $j++)
    {
        die("Error: could not mkdir $LOGDIR/$i/$j: $!.\n") unless(-e "$LOGDIR/$i/$j" or mkdir("$LOGDIR/$i/$j", 0755));
        for ($k=1; $k<32; $k++)
        {
            die("Error: could not mkdir $LOGDIR/$i/$j/$k: $!.\n") unless(-e "$LOGDIR/$i/$j/$k" or mkdir("$LOGDIR/$i/$j/$k", 0755));
        }
    }
}
