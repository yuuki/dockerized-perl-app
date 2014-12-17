use strict;
use warnings;
use Test::More;


use My::Docker;
use My::Docker::Web;
use My::Docker::Web::View;
use My::Docker::Web::ViewFunctions;

use My::Docker::DB::Schema;
use My::Docker::Web::Dispatcher;


pass "All modules can load.";

done_testing;
