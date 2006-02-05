use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'DBIx::Class::UUIDColumns::PP',
    license             => 'perl',
    dist_author         => 'Simon Elliott <cpan@browsing.co.uk>',
    dist_version_from   => 'lib/DBIx/Class/UUIDColumns/PP.pm',
    build_requires => {
        'Test::More' => 0,
        'Data::Uniqid' => 0.11,
        'DBIx::Class' => 0.05,
    },
    add_to_cleanup      => [ 'DBIx-Class-UUIDColumns-PP-*' ],
);

$builder->create_build_script();
