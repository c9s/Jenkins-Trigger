package Jenkins::Trigger;
use strict;
use warnings;
our $VERSION = '0.01';
use Moose;
use LWP::UserAgent;
use URI;

has protocol =>
    ( is => 'rw',  isa => 'Str' , default => 'http' );

has host => 
    ( is => 'rw' , isa => 'Str' , default => 'localhost' );

has port =>
    ( is => 'rw', isa => 'Int' , default => 8080 );

has user_agent => ( is => 'rw' );


sub BUILDARGS {
    my ($self,%args) = @_;

    sub get_user_agent {  
        my $ua = LWP::UserAgent->new;
        $ua->timeout(10);
        $ua->env_proxy;
        return $ua;
    }

    $args{user_agent} ||= get_user_agent;
    return \%args;
}

sub trigger {
    my ($self, $job, $task ) = @_;
    my $uri = URI->new( $self->protocol . '://' . $self->host . ':' . $self->port . '/' . $job . '/build');
    $uri->query_form( token => $task );

    my $response = $self->user_agent->get( $uri );
    return $response if $response->is_success;
    # die $response->status_line;
    # return $response;
}

1;
__END__

=head1 NAME

Jenkins::Trigger - trig your Jenkins Job!

=head1 SYNOPSIS

    use Jenkins::Trigger;
    my $trigger = Jenkins::Trigger->new( 
        host => 'build.your-machine.dev',
        port => 8080,
    );
    $trigger->trigger( 'JobName', 'BUILD' );

=head1 DESCRIPTION

Jenkins::Trigger is

=head1 AUTHOR

Yo-An Lin E<lt>cornelius.howl {at} gmail.comE<gt>

=head1 SEE ALSO

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
