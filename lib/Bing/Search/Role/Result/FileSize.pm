package Bing::Search::Role::Result::FileSize;
use Moose::Role;

has 'FileSize' => ( is => 'rw', isa => 'Num' );

1;
