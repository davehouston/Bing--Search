use Test::More;

use_ok('Bing::Search');

my $search = new_ok('Bing::Search');

ok( $search->AppId('70960FEFD7F90995151FCF92D6422BEB644AACE2') );

ok( $search->Query('rocks balls'), 'Setting query');
   is( $search->Query(), 'rocks balls', 'Is the query still rocks?');


use_ok( 'Bing::Search::Source::Web' );
use_ok( 'Bing::Search::Source::Image' );
my $source = new_ok('Bing::Search::Source::Web');

ok( $search->add_source( $source ), 'Adding source' );
ok( $search->add_source( Bing::Search::Source::Image->new ) );
my $res = $search->search();

#is( $search->request_obj, 'balls', 'baaaaaals');
note $search->request_obj;



note "**** INSTANT ANSWER STUFF ****";
my $o = Bing::Search->new;
$o->AppId('70960FEFD7F90995151FCF92D6422BEB644AACE2');
$o->Query('define rocks');

use Bing::Search::Source::InstantAnswer;
$o->add_source( Bing::Search::Source::InstantAnswer->new );
my $r = $o->search();


done_testing();
