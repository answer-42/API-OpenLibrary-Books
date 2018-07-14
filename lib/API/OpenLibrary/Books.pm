package API::OpenLibrary::Books;

use 5.10.0;

use Moo;
use JSON;
use REST::Client;

=head1 NAME

API::OpenLibrary::Books - The great new API::OpenLibrary::Books!

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

=head1 SYNOPSIS

This is a simple wrapper for the OpenLibrary Books API. It does nothing more than advertised. 

    use API::OpenLibrary::Books;

    my $ol = API::OpenLibrary::Books->new();
    $ol->get_book();
	
	say $ol->title;
	say $ol->url;


=head1 EXPORT

None.
=cut

has url             => ( is => 'rwp' );
has authors         => ( is => 'rwp' );
has title           => ( is => 'rwp' );
has subtitle        => ( is => 'rwp' );
has identifiers     => ( is => 'rwp' );
has classifications => ( is => 'rwp' );
has publishers      => ( is => 'rwp' );
has publish_places  => ( is => 'rwp' );
has publish_date    => ( is => 'rwp' );
has excerpts        => ( is => 'rwp' );
has links           => ( is => 'rwp' );
has covers          => ( is => 'rwp' );
has ebooks          => ( is => 'rwp' );
has number_of_pages => ( is => 'rwp' );
has weight          => ( is => 'rwp' );

has status_code => ( is => 'rwp' );
has found => ( is => 'rwp', default => 0 );

# TODO:
# has subjects => { is => 'ro' };

=head1 SUBROUTINES/METHODS

=head2 get_book($id, ($bibkey))
Search book by id. Default ISBN (10 or 13). It is also possible to search for OCLC, LCCN, OLID. 
The $bibkey is an optional argument.

Returns the HTTP response code. Normaly 200 (success).
=cut

sub get_book {
    my ( $self, $id, $bibkey ) = @_;
    $bibkey //= 'ISBN';

    my $client = REST::Client->new();
    $client->GET( 'https://openlibrary.org/api/books?bibkeys='
          . $bibkey . ':'
          . $id
          . '&jscmd=data&format=json' );

    my $data = decode_json( $client->responseContent() );
    $data = $data->{ $bibkey . ':' . $id };

    $self->_set_url( $data->{url} );
    $self->_set_authors( $data->{authors} );
    $self->_set_title( $data->{title} );
    $self->_set_subtitle( $data->{subtitle} );
    $self->_set_identifiers( $data->{identifiers} );
    $self->_set_classifications( $data->{classifications} );
    $self->_set_publishers( $data->{publishers} );
    $self->_set_publish_places( $data->{publish_places} );
    $self->_set_publish_date( $data->{publish_date} );
    $self->_set_excerpts( $data->{excerpts} );
    $self->_set_links( $data->{links} );
    $self->_set_covers( $data->{covers} );
    $self->_set_ebooks( $data->{ebooks} );
    $self->_set_number_of_pages( $data->{number_of_pages} );
    $self->_set_weight( $data->{weight} );

    # Checks if the response from OpenLibrqry is empty or not.
    if ( %{$data} ) {
        $self->_set_found(1);
    }
    else {
        $self->_set_found(0);
    }

    $self->_set_status_code( $client->responseCode );
}

=head2 url()
=cut

=head2 authors()
=cut

=head2 title()
=cut

=head2 subtitle()
=cut

=head2 identifiers()
=cut

=head2 classifications()
=cut

=head2 publishers()
=cut

=head2 publish_places()
=cut

=head2 publish_date()
=cut

=head2 excerpts()
=cut

=head2 links() 
=cut

=head2 covers()
=cut

=head2 ebooks()
=cut

=head2 number_of_pages() 
=cut

=head2 weight()
=cut

=head2 found()
=cut

=head2 status_code()
=cut

=head1 AUTHOR

Sebastian Benque, C<< <sebastian.benque at gmail.com> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-api-openlibrary-books at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=API-OpenLibrary-Books>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc API::OpenLibrary::Books


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=API-OpenLibrary-Books>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/API-OpenLibrary-Books>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/API-OpenLibrary-Books>

=item * Search CPAN

L<http://search.cpan.org/dist/API-OpenLibrary-Books/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2018 Sebastian Benque.

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see L<http://www.gnu.org/licenses/>.


=cut

1;    # End of API::OpenLibrary::Books
