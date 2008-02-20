use strict;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME          => 'POE::Component::Swank',
    AUTHOR        => 'Ævar Arnfjörð Bjarmason <avar@cpan.org>',
    ABSTRACT_FROM => 'lib/POE/Component/Server/Swank.pm',
    VERSION_FROM  => 'lib/POE/Component/Server/Swank.pm',
    LICENSE       => 'perl',
    PREREQ_PM     => {
        # lib/POE/Component/Server/Swank.pm
        'POE'               => '0.9999',
        'Data::SExpression' => '0',

        # t/
        'Test::More' => 0,
    },
);
