#!perl -T

use Test::More tests => 1;

BEGIN {
	use_ok( 'DBIx::Class::UUIDColumns::PP' );
}

diag( "Testing DBIx::Class::UUIDColumns::PP $DBIx::Class::UUIDColumns::PP::VERSION, Perl $], $^X" );
