package Tests::BlogTests;
use Test::Assert qw(assert_deep_equals);
use base qw(Test::Unit::TestCase);

use Tests::MockRepository;
use Timeline;

sub new {
      return shift()->SUPER::new(@_);
}

sub set_up {
	my $self = shift;
	$self->{repo} = MockRepository->new;
	$self->{timeline} = Timeline->new($self->{repo});
}

sub test_messages_can_be_added_to_the_timeline {
	my $self = shift;
	$self->{timeline}->add_message("here is a message");
	assert_deep_equals($self->{timeline}->get_messages, ["here is a message"]);
}

sub test_last_messages_are_returned_first {
	my $self = shift;

	$self->{timeline}->add_message("1");
	$self->{timeline}->add_message("2");
	assert_deep_equals($self->{timeline}->get_messages, ["2", "1"])	
}

sub test_should_only_return_last_ten_messages {
	my $self = shift;

	for (0..15) {
		$self->{timeline}->add_message("$_");
	}

	assert_deep_equals($self->{timeline}->get_messages, ["15", "14", "13", "12", "11", "10", "9", "8", "7", "6"])
}

sub test_should_save_messages {
	my $self = shift;
	$self->{timeline}->add_message("here");
	$self->assert($self->{repo}->{saved});
}

1;
