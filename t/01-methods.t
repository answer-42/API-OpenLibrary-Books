#
#===============================================================================
#
#         FILE: 01-methods.t
#
#  DESCRIPTION:
#
#        FILES: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: Sebastian Benque (SWRB), sebastian.benque@gmail.com
# ORGANIZATION:
#      VERSION: 1.0
#      CREATED: 2018-07-06 10:03:57
#     REVISION: ---
#===============================================================================

use strict;
use warnings;

use Test2::Bundle::More;
plan 51;

use API::OpenLibrary::Books;

ok( my $ol = API::OpenLibrary::Books->new, 'Create new instance' );

is( $ol->title,           undef, 'Test title method' );
is( $ol->url,             undef, 'Test url method' );
is( $ol->authors,         undef, 'Test authors method' );
is( $ol->subtitle,        undef, 'Test subtitle method' );
is( $ol->identifiers,     undef, 'Test identifiers method' );
is( $ol->classifications, undef, 'Test classifications method' );
is( $ol->publishers,      undef, 'Test publishers method' );
is( $ol->publish_places,  undef, 'Test publish_places method' );
is( $ol->publish_date,    undef, 'Test publish_date method' );
is( $ol->excerpts,        undef, 'Test excerpts method' );
is( $ol->links,           undef, 'Test links method' );
is( $ol->covers,          undef, 'Test covers method' );
is( $ol->ebooks,          undef, 'Test ebooks method' );
is( $ol->number_of_pages, undef, 'Test number_of_pages method' );
is( $ol->weight,          undef, 'Test weight method' );

is( $ol->found, 0, 'Test found method' );

# What happens when searching for a non-existing ISBN
is( $ol->get_book('0000'), 200, 'Searching for book' );
is( $ol->found,            0,   'Test found method' );

is( $ol->title,           undef, 'Test title method' );
is( $ol->url,             undef, 'Test url method' );
is( $ol->authors,         undef, 'Test authors method' );
is( $ol->subtitle,        undef, 'Test subtitle method' );
is( $ol->identifiers,     undef, 'Test identifiers method' );
is( $ol->classifications, undef, 'Test classifications method' );
is( $ol->publishers,      undef, 'Test publishers method' );
is( $ol->publish_places,  undef, 'Test publish_places method' );
is( $ol->publish_date,    undef, 'Test publish_date method' );
is( $ol->excerpts,        undef, 'Test excerpts method' );
is( $ol->links,           undef, 'Test links method' );
is( $ol->covers,          undef, 'Test covers method' );
is( $ol->ebooks,          undef, 'Test ebooks method' );
is( $ol->number_of_pages, undef, 'Test number_of_pages method' );
is( $ol->weight,          undef, 'Test weight method' );

# What happens when searching for an existing ISBN
is( $ol->get_book('9780980200447'), 200, 'Searching for book' );
is( $ol->found,                     1,   'Test found method' );

is( $ol->title, 'Slow reading', 'Test title method' );
is(
    $ol->url,
    'https://openlibrary.org/books/OL22853304M/Slow_reading',
    'Test url method'
);
is_deeply(
    $ol->authors,
    [
        {
            name => 'John Miedema',
            url  => 'https://openlibrary.org/authors/OL6548935A/John_Miedema'
        }
    ],
    'Test authors method'
);
is( $ol->subtitle, undef, 'Test subtitle method' );
is_deeply(
    $ol->identifiers,
    {
        amazon       => ['098020044X'],
        goodreads    => [6383507],
        google       => ['4LQU1YwhY6kC'],
        isbn_10      => [1936117363],
        isbn_13      => [ 9780980200447, 9781936117369 ],
        lccn         => [2008054742],
        librarything => [8071257],
        oclc         => [297222669],
        openlibrary  => ['OL22853304M']
    },
    'Test identifiers method'
);
is_deeply(
    $ol->classifications,
    {
        dewey_decimal_class => ['028/.9'],
        lc_classifications  => ['Z1003 .M58 2009']
    },
    'Test classifications method'
);
is_deeply(
    $ol->publishers,
    [ { name => 'Litwin Books' } ],
    'Test publishers method'
);
is_deeply(
    $ol->publish_places,
    [ { name => 'Duluth, Minn' } ],
    'Test publish_places method'
);
is( $ol->publish_date, 'March 2009', 'Test publish_date method' );
is( $ol->excerpts,     undef,        'Test excerpts method' );
is_deeply(
    $ol->links,
    [
        {
            title => 'Author\'s Website',
            url   => 'http://johnmiedema.ca'
        },
        {
            title => 'Chapter 2',
            url   => 'http://litwinbooks.com/slowreading-ch2.php'
        },
        {
            title => 'Get the e-book',
            url   => 'http://www.powells.com/biblio/91-9781936117369-0'
        }
    ],
    'Test links method'
);
is( $ol->covers, undef, 'Test covers method' );
is_deeply(
    $ol->ebooks,
    [
        {
            availability => 'borrow',
            borrow_url =>
              'https://openlibrary.org/books/OL22853304M/Slow_reading/borrow',
            checkedout  => 1,
            formats     => {},
            preview_url => 'https://archive.org/details/slowreading00mied'
        }
    ],
    'Test ebooks method'
);
is( $ol->number_of_pages, 92,        'Test number_of_pages method' );
is( $ol->weight,          '1 grams', 'Test weight method' );

