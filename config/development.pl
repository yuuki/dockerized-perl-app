use File::Spec;
use File::Basename qw(dirname);
my $basedir = File::Spec->rel2abs(File::Spec->catdir(dirname(__FILE__), '..'));
# db info linked by fig
my $host = $ENV{DB_PORT_3306_TCP_ADDR};
my $port = $ENV{DB_PORT_3306_TCP_PORT};
+{
    'DBI' => [
        "dbi:mysql:host=$host;port=$port;dbname=mydocker", 'nobody', 'nobody',
        +{
            AutoCommit => 1,
            PrintError => 0,
            RaiseError => 1,
            ShowErrorStatement => 1,
            AutoInactiveDestroy => 1,
        }
    ],
};
