package Bing::Role::SearchRequest::Options;
use Moose::Role;

requires 'build_request';
requires 'params';


has 'Options' => (
   is => 'rw',
   isa => 'ArrayRef',
);

before 'Options' => sub { 
   my $self = shift;
   while( my $opt = shift @_ ) { 
      unless( $opt =~ /DisableLocationDetection|EnableHighlighting/ ) { 
         warn 'Invalid option: ' . $opt . ' -- ignoring.';
         next;
      }
      # figure out how to do this

   }
}

before 'build_request' => sub { 
   my $self = shift;
   my $hash = $self->params;
   $hash->{Options} = $self->Options;
   $self->params( $hash );
};

1;
