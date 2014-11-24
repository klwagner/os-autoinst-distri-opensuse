#!/usr/bin/perl -w
use strict;
use base "noupdatestep";
use testapi;

sub run() {
    my %desktopkeys = ( kde => "k", gnome => "g", xfce => "x", lxde => "l", minimalx => "m", textmode => "i" );
    assert_screen "desktop-selection", 30;
    my $d = get_var("DESKTOP");
    diag "selecting desktop=$d";
    get_var(" uc($d) ") = 1;
    save_vars();
    my $key = "alt-$desktopkeys{$d}";
    if ( $d eq "kde" ) {

        # KDE is default
    }
    elsif ( $d eq "gnome" ) {
        send_key $key;
        assert_screen "gnome-selected", 3;
    }
    else {    # lower selection level
        send_key "alt-o";    #TODO translate
        assert_screen "other-desktop", 3;
        send_key $key;
        sleep 3;            # needles for else cases missing
    }
    send_key $cmd{"next"};

    # ending at partition layout screen
}

1;
# vim: set sw=4 et:
