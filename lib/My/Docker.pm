package My::Docker;
use strict;
use warnings;
use utf8;
our $VERSION='0.01';
use 5.008001;
use My::Docker::DB::Schema;
use My::Docker::DB;

use parent qw/Amon2/;
# Enable project local mode.
__PACKAGE__->make_local_context();

my $schema = My::Docker::DB::Schema->instance;

sub db {
    my $c = shift;
    if (!exists $c->{db}) {
        my $conf = $c->config->{DBI}
            or die "Missing configuration about DBI";
        $c->{db} = My::Docker::DB->new(
            schema       => $schema,
            connect_info => [@$conf],
            on_connect_do => [
                'SET SESSION sql_mode=STRICT_TRANS_TABLES;',
            ],
        );
    }
    $c->{db};
}

1;
__END__

=head1 NAME

My::Docker - My::Docker

=head1 DESCRIPTION

This is a main context class for My::Docker

=head1 AUTHOR

My::Docker authors.

