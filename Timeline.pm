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

	if (scalar @{$self->{messages}} > 10) {
		my @recent = reverse(@{$self->{messages}});
		@recent = @recent[0..9];
		return \@recent;
	}
	else {
		my @recent = reverse(@{$self->{messages}});
		return \@recent
	}
}

1;
