package Tests::BlogTests;
use Test::Assert qw(assert_raises);
use base qw(Test::Unit::TestCase);

use Blog;

sub new {
      my $self = shift()->SUPER::new(@_);
      return $self;
}


sub test_that_a_blog_can_be_saved {
	my $self = shift;

	my $blog = Blog->new("some blog message here");
	$blog->save();
}

sub test_that_a_blog_requires_a_message {
	my $self = shift;

	assert_raises('Message Required', sub { Blog->new() });
}

1;
