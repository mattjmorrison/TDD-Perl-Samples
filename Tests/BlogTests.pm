package Tests::BlogTests;
use Test::Assert qw(assert_deep_equals);
use base qw(Test::Unit::TestCase);

use Timeline;

sub new {
      return shift()->SUPER::new(@_);
}

sub test_messages_can_be_added_to_the_timeline {
	my $self = shift;
	my $timeline = Timeline->new();
	$timeline->add_message("here is a message");
	assert_deep_equals($timeline->get_messages, ["here is a message"]);
}

sub test_last_messages_are_returned_first {
	my $self = shift;
	my $self = shift;
	my $timeline = Timeline->new();
	$timeline->add_message("1");
	$timeline->add_message("2");
	assert_deep_equals($timeline->get_messages, ["2", "1"])	
}

sub test_should_only_return_last_ten_messages {
	my $self = shift;
	my $timeline = Timeline->new();
	for (0..15) {
		$timeline->add_message("$_");
	}
	assert_deep_equals($timeline->get_messages, ["15", "14", "13", "12", "11", "10", "9", "8", "7", "6"])
}

1;
