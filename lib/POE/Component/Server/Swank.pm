package POE::Component::Server::Swank;
use strict;
use warnings;

our $VERSION = '0.01';

sub BINDADDR () { '127.0.0.1' }
sub BINDPORT () { 4005 }

use Params::Validate qw[validate_with];
use POE qw[
    Component::Server::TCP
    Filter::Swank
];

sub spawn {
    my $pkg = shift;

	my %args = validate_with(
		params => \@_,
		spec => {
			InputState   => {
				type     => &Params::Validate::CODEREF,
				optional => 1,
				default  => sub {},
			},
			ErrorState   => {
				type     => &Params::Validate::CODEREF,
				optional => 1,
				default  => sub {},
			},
			BindAddress  => {
				type     => &Params::Validate::SCALAR,
				optional => 1,
				default  => BINDADDR,
			},
			BindPort     => {
				type     => &Params::Validate::SCALAR,
				optional => 1,
				default  => BINDPORT,
			},
		},
	);

    $args{filter} = POE::Filter::Swank->new();

	my $session = POE::Session->create(
		inline_states => {
			_start         => \&start,
			_stop          => \&stop,

			socket_connect => \&socket_connect,
			socket_error   => \&socket_error,
			socket_input   => \&socket_input,
			register	   => \&register,
			unregister	   => \&unregister,
			shutdown       => \&shutdown,

			client_input => $args{InputState},
			client_error => $args{ErrorState},

		},
		heap => \%args,
	);


	return $session;
}

sub start {}
sub stop {}


1;

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
