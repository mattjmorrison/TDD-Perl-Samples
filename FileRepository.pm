package FileRepository;
use Storable;

sub new {
	my ($class, $file) = @_;
	return bless {file => $file}, $class;
}

sub save_messages {
	my ($self, $messages) = @_;
	store $messages, $self->{file};
}

sub load_messages {
	my $self = shift;
	my $messages = eval {retrieve($self->{file})};
	if ($@){
		$messages = [];
	}
	return $messages;	
}
1;