use 5.006;
use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME             => 'API::OpenLibrary::Books',
    AUTHOR           => q{Sebastian Benque <sebastian.benque@gmail.com>},
    VERSION_FROM     => 'lib/API/OpenLibrary/Books.pm',
    ABSTRACT_FROM    => 'lib/API/OpenLibrary/Books.pm',
    LICENSE          => 'gpl_3',
    PL_FILES         => {},
    MIN_PERL_VERSION => '5.006',
    CONFIGURE_REQUIRES => {
        'ExtUtils::MakeMaker' => '0',
    },
    BUILD_REQUIRES => {
        'Test::More' => '0',
    },
    PREREQ_PM => {
        #'ABC'              => '1.6',
        #'Foo::Bar::Module' => '5.0401',
    },
    dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean => { FILES => 'API-OpenLibrary-Books-*' },
);
