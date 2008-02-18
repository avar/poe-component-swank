package POE::Component::Server::Swank;
use strict;

__END__

=head1 NAME

POE::Component::Server::Swank - Swank server for Perl

=head1 DESCRIPTION

SLIME is the "Superior Lisp Interaction Mode for Emacs" which consists
of two parts, an Emacs mode that sends commands to a lisp server
process called swank which evaluates them and sends the result of the
evaluation back.

This module implements the swank server process only instead of using
evaluating Common Lisp we evaluate Perl. The goal here is to have the
integration of SLIME in Emacs with an alternative language.

=head1 AUTHOR

E<AElig>var ArnfjE<ouml>rE<eth> Bjarmason <avar@cpan.org>

=head1 LICENSE

Copyright 2008 E<AElig>var ArnfjE<ouml>rE<eth> Bjarmason.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut
