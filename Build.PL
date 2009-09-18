use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'Acme::ScripturaContinua',
    license             => 'perl',
    dist_author         => q{Olaf Alders <olaf@wundercounter.com>},
    dist_version_from   => 'lib/Acme/ScripturaContinua.pm',
    build_requires => {
        'Test::More' => 0,
    },
    add_to_cleanup      => [ 'Acme-ScripturaContinua-*' ],
    create_makefile_pl => 'traditional',
);

$builder->create_build_script();
