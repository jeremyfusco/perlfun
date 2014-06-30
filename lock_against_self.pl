#!/usr/bin/env perl

use Fcntl ':flock'; # import LOCK_* constants

INIT{ # Code called before main.
    open  *{0}                                # Open the file name of the script with open.
              or die "What!? $0:$!";          # can we open the file? 
                flock *{0}, LOCK_EX|LOCK_NB   # lock said file. 
                        or die "$0 is already running somewhere!\n";
}
