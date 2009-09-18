#!perl -T

use strict;
use warnings;

use Data::Dump qw( dump );
use Test::More tests => 5;

BEGIN {
    use_ok( 'Acme::ScripturaContinua' );
}

diag( "Testing Acme::ScripturaContinua $Acme::ScripturaContinua::VERSION, Perl $], $^X" );

my $text = 'testing this thing.';
my $scriptura = Acme::ScripturaContinua->new;

isa_ok( $scriptura, 'Acme::ScripturaContinua' );
my $obfuscated = $scriptura->continuate( $text );
cmp_ok( $obfuscated, 'eq', "TESTINGTHISTHING", "text correct obfuscated" );

$scriptura->wrap( 5 );
cmp_ok(
    $scriptura->continuate( $text ),
    'eq',
    q{TESTI
NGTHI
STHIN
G},
    "wraps to correct width"
);

my $nothing = $scriptura->continuate( undef );
ok ( !$nothing, "providing undef returns undef");

my $bellumgallicum = q{Gallia est omnis divisa in partes tres, quarum unam
incolunt Belgae, aliam Aquitani, tertiam qui ipsorum lingua Celtae, nostra
Galli appellantur. Hi omnes lingua, institutis, legibus inter se differunt.
Gallos ab Aquitanis Garumna flumen, a Belgis Matrona et Sequana dividit.
Horum omnium fortissimi sunt Belgae, propterea quod a cultu atque humanitate
provinciae longissime absunt, minimeque ad eos mercatores saepe commeant atque
ea quae ad effeminandos animos pertinent important, proximique sunt Germanis,
qui trans Rhenum incolunt, quibuscum continenter bellum gerunt. Qua de causa
Helvetii quoque reliquos Gallos virtute praecedunt, quod fere cotidianis
proeliis cum Germanis contendunt, cum aut suis finibus eos prohibent aut ipsi
in eorum finibus bellum gerunt. Eorum una, pars, quam Gallos obtinere dictum
est, initium capit a flumine Rhodano, continetur Garumna flumine, Oceano,
finibus Belgarum, attingit etiam ab Sequanis et Helvetiis flumen Rhenum,
vergit ad septentriones. Belgae ab extremis Galliae finibus oriuntur,
pertinent ad inferiorem partem fluminis Rheni, spectant in septentrionem et
orientem solem. Aquitania a Garumna flumine ad Pyrenaeos montes et eam partem
Oceani quae est ad Hispaniam pertinet; spectat inter occasum solis et
septentriones. };

$scriptura->wrap( 32 );
my $wrapped = $scriptura->continuate( $bellumgallicum );

print $wrapped;
