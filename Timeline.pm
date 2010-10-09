package Timeline;

sub new {
	my ($class, $repo) = @_;
	return bless {repo => $repo, messages => $repo->load_messages}, $class;
}

sub add_message {
	my ($self, $message) = @_;
	push(@{$self->{messages}}, $message);
	$self->{repo}->save_messages($self->{messages});
}

sub get_messages {
	my $self = shift;

	my @recent = reverse(@{$self->{messages}});
	if (scalar @{$self->{messages}} > 10) {
		@recent = @recent[0..9];
	}

	return \@recent;
}

1;
