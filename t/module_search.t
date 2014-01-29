use Test::More;

use_ok(
   'Bing::Search', 
   'Can we use the object?'
);

my $obj = new_ok(
   'Bing::Search', 
   [ query, 'rocks' ], 
   'Can we make a new one?' 
);

ok( 
   $obj->sources( 'web,images' ), 
   'Check sources comma-based parsing' 
);

is( 
   $obj->sources, 
   'web+images',
   'Get the properly-formatted sources result?'
);

ok( 
   $obj->options( 'EnableHilighting, DisableLocationDetection'), 
   'Can we set the options?'
);

is(
   $obj->options,
   'EnableHilighting+DisableLocationDetection'
);

is( 
   $obj->_endpoint, 
   'https://api.datamarket.azure.com/Bing/Search', 
   'Endpoint URI is set?' 
);

subtest 'Checking skip parameter' => sub { 
   $obj->skip( 15 );
   is(
      $obj->skip,
      15,
      'Can we set the attribute?'
   );
   my $param_attr = $obj->meta->get_attribute('skip');
   is( 
      $param_attr->param, 
      '$skip',
      'Is the param attribute set properly?'
   );

   ok( 
      ! $param_attr->should_quote,
      'Quote param set false'
   );

};

is( $obj->_build_query, 'blarg' );
done_testing();

