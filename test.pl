use Test::More qw(no_plan);

require_ok('OK');

tie my $ok, 'Tie::Scalar::OK';

$ok = (1 == 1);
is($ok,"ok 1\n");

$ok = (1 == 0);
is($ok,"not ok 2\n");
