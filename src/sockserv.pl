#!/usr/bin/perl

use IO::Socket;
use strict;
$| = 1;

my $next_port = 8080;

for (;;) {
    my $server = new IO::Socket::INET(
        Listen => 1,
        LocalAddr => '0.0.0.0',
        LocalPort => $next_port,
        Proto => 'tcp',
        Reuse => 1
        );

    die "IO::Socket $!" unless $server;
    print "[DBG] server listening ... 0.0.0.0:$next_port\n";

    if (my $client = $server->accept()) {
        print "[DBG] accept from " . $client->peerhost() . " !\n";
        my $new_port;
        while (<$client>) {
            last if /^\x0d\x0a?$/;
            if (m{^GET /port/(\d+)\s}) {
                $new_port = $1;
            }
        }
        my $body;
        if ($new_port) {
            $body = "Change to New Port: $new_port.\n";
            $next_port = $new_port;
        }
        else {
            $body = "Running Socket Server.\n";
        }
        my $len = length $body;
        print $client <<__EOL__;
HTTP/1.1 200 OK
Content-Type: text/plain;charset=ISO-8859-1
Content-Length: $len

$body
__EOL__
        close $client;
        print "[DBG] disconnected from " . $client->peerhost() .".\n";
    }
    close $server;
}
exit;

