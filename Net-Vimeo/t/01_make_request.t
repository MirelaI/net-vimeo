use strict;
use warnings;

use Test::More;
use Test::Exception;

if ($ENV{VIMEO_CONSUMER_KEY} && $ENV{VIMEO_CONSUMER_SECRET}) {
    if ( $ENV{VIMEO_ACCESS_TOKEN} && $ENV{VIMEO_ACCESS_TOKEN_SECRET} ) {
        plan( tests => 5 );
    } 
    else {
        plan( tests => 3 );
    }
}
else {
    plan(skip_all => "To run the test, VIMEO_CONSUMER_KEY and VIMEO_CONSUMER_SECRET enviroment variables must be set!");
}

use_ok('Net::Vimeo');
use_ok('Net::Vimeo::OAuth');


my $vimeo = Net::Vimeo->new( consumer_key => $ENV{VIMEO_CONSUMER_KEY}, consumer_secret => $ENV{VIMEO_CONSUMER_SECRET} );

throws_ok { $vimeo->make_api_request() } qr/authorize your app/, 'Authorization needed before making the api request';

# Set tokens
# Two ways: get them from Vimeo website where your application is defined
# or follow the steps for an OAuth authorization
if ( $ENV{VIMEO_ACCESS_TOKEN} && $ENV{VIMEO_ACCESS_TOKEN_SECRET} ) {
    $vimeo->access_token( $ENV{VIMEO_ACCESS_TOKEN} );
    $vimeo->access_token_secret( $ENV{VIMEO_ACCESS_TOKEN_SECRET} );


    my $api_params = {
        user_id => 'user23445337'
    };

    lives_ok( sub { $vimeo->make_api_request( 'GET', $api_params) }, 'Expecting to live');

    $api_params->{method} = 'vimeo.activity.userDid';
    $api_params->{format} = 'JSON';

    my $res = $vimeo->make_api_request( 'GET', $api_params);
    is( ref $res, 'HTTP::Response', 'Request is a HTTP::Response object');

}

done_testing();


