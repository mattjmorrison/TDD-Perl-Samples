package Timeline;
use Data::Dumper;

sub new {
	return bless {messages => [],}, shift;
}

sub add_message {
	my ($self, $message) = @_;
	push(@{$self->{messages}}, $message);
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
