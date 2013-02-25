use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name        => 'Acme::PM::Hachioji',
    license            => 'perl',
    dist_author        => 'moznion <moznion@gmail.com>',
    dist_version_from  => 'lib/Acme/PM/Hachioji.pm',
    build_requires     => { 'Test::More' => '0.98', },
    configure_requires => { 'Module::Build' => '0.40', },
    requires           => {
        perl     => '5.008001',
        'parent' => 0,
        'Carp'   => 0,
    },
    add_to_cleanup => ['Acme-PM-Hachioji-*'],
    no_index       => { 'directory' => ['inc'] },
    meta_merge     => {
        'resource' => {
            'license'    => 'http://dev.perl.org/licenses/',
            'repository' => 'git://github.com/moznion/Acme--PM--Hachioji.git',
        },
    },
    test_files => ( -d '.git' || $ENV{RELEASE_TESTING} ) ? 't/ xt/' : 't/',
    recursive_test_files => 1,
    create_license       => 1,
    create_readme        => 1,
);

$builder->create_build_script();
