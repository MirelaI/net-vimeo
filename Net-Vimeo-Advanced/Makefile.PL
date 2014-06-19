use 5.006;
use strict;
use warnings FATAL => 'all';
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME             => 'Net::Vimeo::Advanced',
    AUTHOR           => q{Mirela Iclodean <imirela@cpan.org>},
    VERSION_FROM     => 'lib/Net/Vimeo/Advanced.pm',
    ABSTRACT_FROM    => 'lib/Net/Vimeo/Advanced.pm',
    LICENSE          => 'Artistic_2_0',
    PL_FILES         => {},
    MIN_PERL_VERSION => 5.006,
    CONFIGURE_REQUIRES => {
        'ExtUtils::MakeMaker' => 0,
    },
    BUILD_REQUIRES => {
        'Test::More'      => 0,
        'Test::Exception' => 0,
    },
    PREREQ_PM => {
        'Carp'                  => undef,
        'Clone'                 => undef,
        'Digest::SHA'           => undef,
        'Encode'                => undef,
        'HTTP::Request'         => undef,
        'HTTP::Request::Common' => undef, 
        'JSON'                  => 2.90,
        'LWP::UserAgent'        => 0.32,
        'Moose'                 => undef,
        'Moose::Role'           => undef,
        'Net::OAuth'            => 0.28,
        'Types::Standard'       => 0.044,
        'URI'                   => 1.60,
        'URI::Escape'           => 3.31,
    },
    dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean => { FILES => 'Net-Vimeo-Advanced-*' },
);
