use strict;
use POE 'Component::Server::Swank';
use Test::More tests => 1;

POE::Component::Server::Swank->spawn(
    BindPort         => 4005,
#    InlineStates => {},
);

pass("meh");

$poe_kernel->run;
exit 0;
