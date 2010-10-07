package Blog;

sub new {
	my ($class, $message) = @_;

	if (!$message) {
		die("Message Required");
	}

	return bless {message => $message}, $class;
}

sub save {

}

1;
