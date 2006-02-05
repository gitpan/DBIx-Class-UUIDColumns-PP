package DBIx::Class::UUIDColumns::PP;
use base qw/DBIx::Class/;

use Data::Uniqid;

__PACKAGE__->mk_classdata( 'uuid_auto_columns' => [] );
our $VERSION = 0.01;
=head1 NAME

DBIx::Class::UUIDColumns - Implicit uuid columns

=head1 SYNOPSIS

  pacakge Artist;
  __PACKAGE__->load_components(qw/UUIDColumns::PP Core DB/);
  __PACKAGE__->uuid_columns( 'artist_id' );x

=head1 DESCRIPTION

This L<DBIx::Class> component resembles the behaviour of
L<Class::DBI::UUID>, to make some columns implicitly created as uuid.

Note that the component needs to be loaded before Core.

=head1 METHODS

=head2 uuid_columns

=cut

# be compatible with Class::DBI::UUID
sub uuid_columns {
    my $self = shift;
    for (@_) {
	$self->throw_exception("column $_ doesn't exist") unless $self->has_column($_);
    }
    $self->uuid_auto_columns(\@_);
}

sub insert {
    my $self = shift;
    for my $column (@{$self->uuid_auto_columns}) {
	$self->store_column( $column, Data::Uniqid->luniqid )
	    unless defined $self->get_column( $column );
    }
    $self->next::method(@_);
}

=head1 AUTHORS

DBIx::Class::UUIDColumns by Chia-liang Kao <clkao@clkao.org>
PP extension, and 3 lines changed to use Data::Uniqid by Simon Elliott <cpan@browsing.co.uk>

=head1 LICENSE

You may distribute this code under the same terms as Perl itself.

=cut

1;
