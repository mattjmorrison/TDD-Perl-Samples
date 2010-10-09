package MockRepository;

sub new {
	return bless {file => $file, messages => []}, shift;
}

sub save_messages {
	my ($self, $messages) = @_;
	$self->{messages} = $messages;
	$self->{saved} = true;
}

sub load_messages {
	my $self = shift;
	return $self->{messages};	
}
1;