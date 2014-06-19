use strict;
use warnings;

use Test::More;
use Test::Exception;

if ($ENV{VIMEO_CONSUMER_KEY} && $ENV{VIMEO_CONSUMER_SECRET}) {
    plan( tests => 7 );
}
else {
    plan(skip_all => "To run the test, VIMEO_CONSUMER_KEY and VIMEO_CONSUMER_SECRET enviroment variables must be set!");
}

use_ok('Net::Vimeo::Advanced');
use_ok('Net::Vimeo::Advanced::OAuth');


can_ok( 'Net::Vimeo::Advanced', 'new');

my $vimeo = Net::Vimeo::Advanced->new( consumer_key => $ENV{VIMEO_CONSUMER_KEY}, consumer_secret => $ENV{VIMEO_CONSUMER_SECRET} );

ok($vimeo, 'Vimeo object created with provided credentials');

# Get request tokens
$vimeo->get_request_token( { callback => 'oob' } );

ok( $vimeo->request_token, 'Got request_token' );
ok( $vimeo->request_token_secret, 'Got secret token' );

# Ask for access tokens
throws_ok { $vimeo->get_access_token( { verifier => 'unknown' } ) } qr/Something went wrong on GET/, 'Unauthorized request unless the needed verifier';

done_testing();