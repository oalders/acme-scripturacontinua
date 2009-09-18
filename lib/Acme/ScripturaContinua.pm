package Acme::ScripturaContinua;

use Moose;

use warnings;
use strict;

use MooseX::Params::Validate;

=head1 NAME

Acme::ScripturaContinua - Obfuscate text like the ancients 

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

has 'latin' => (
    is      => 'rw',
    isa     => 'Bool',
    default => 0,
);

has 'wrap' => (
    is      => 'rw',
    isa     => 'Int',
    default => 32,
);


=head1 SYNOPSIS

Acme::ScripturaContinua allows you to turn regular texts into something
economical and special while allowing you to do something for the environment.
Think of all the paper you can save simply by abandoning layout and
punctuation.

    use Acme::ScripturaContinua;

    my $scriptura = Acme::ScripturaContinua->new();
    my $text = 'Well you know my name is Simon.';
    print $scriptura->continuate( $text );
    
Returns the much more succinct: WELLYOUKNOWMYNAMEISSIMON  

=head1 DESCRIPTION

We in "modern times" have spoiled ourselves with punctuation and word breaks.
If you're tired of having someone else tell you where one sentence ends and
another begins, this module is for you.

Now you can enjoy Scriptura Continua outside of your Paleography class and
share it friends who, for some strange reason, chose not to immerse themselves
in the study of Medieval manuscripts and whatnot.  For a bit of history on the
subject, check out the Wikipedia:

L<http://en.wikipedia.org/wiki/Scriptio_continua>

=head1 FUNCTIONS

=head2 continuate( $text )

This method takes your ordinary, legible, punctuated text and returns it in
Scriptura Continua.

For example:

    my $bellum_gallicum = q{Gallia est omnis divisa in partes tres, quarum unam
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
    septentriones.};
    
    print $scriptura->continuate( $bellum_gallicum );
    
    # returns:
    
    GALLIAESTOMNISDIVISAINPARTESTRES
    QUARUMUNAMINCOLUNTBELGAEALIAMAQU
    ITANITERTIAMQUIIPSORUMLINGUACELT
    AENOSTRAGALLIAPPELLANTURHIOMNESL
    INGUAINSTITUTISLEGIBUSINTERSEDIF
    FERUNTGALLOSABAQUITANISGARUMNAFL
    UMENABELGISMATRONAETSEQUANADIVID
    ITHORUMOMNIUMFORTISSIMISUNTBELGA
    EPROPTEREAQUODACULTUATQUEHUMANIT
    ATEPROVINCIAELONGISSIMEABSUNTMIN
    IMEQUEADEOSMERCATORESSAEPECOMMEA
    NTATQUEEAQUAEADEFFEMINANDOSANIMO
    SPERTINENTIMPORTANTPROXIMIQUESUN
    TGERMANISQUITRANSRHENUMINCOLUNTQ
    UIBUSCUMCONTINENTERBELLUMGERUNTQ
    UADECAUSAHELVETIIQUOQUERELIQUOSG
    ALLOSVIRTUTEPRAECEDUNTQUODFERECO
    TIDIANISPROELIISCUMGERMANISCONTE
    NDUNTCUMAUTSUISFINIBUSEOSPROHIBE
    NTAUTIPSIINEORUMFINIBUSBELLUMGER
    UNTEORUMUNAPARSQUAMGALLOSOBTINER
    EDICTUMESTINITIUMCAPITAFLUMINERH
    ODANOCONTINETURGARUMNAFLUMINEOCE
    ANOFINIBUSBELGARUMATTINGITETIAMA
    BSEQUANISETHELVETIISFLUMENRHENUM
    VERGITADSEPTENTRIONESBELGAEABEXT
    REMISGALLIAEFINIBUSORIUNTURPERTI
    NENTADINFERIOREMPARTEMFLUMINISRH
    ENISPECTANTINSEPTENTRIONEMETORIE
    NTEMSOLEMAQUITANIAAGARUMNAFLUMIN
    EADPYRENAEOSMONTESETEAMPARTEMOCE
    ANIQUAEESTADHISPANIAMPERTINETSPE
    CTATINTEROCCASUMSOLISETSEPTENTRI
    ONES

=cut

sub continuate {
    
    my $self    = shift;
    my $text    = shift;
    
    return $text if !$text;

    $text =~ s{[^\w]}{}gxms;
    $text =~ tr{[a-z]}{[A-Z]};
    
    return $text if !$self->wrap || $self->wrap < 1;
    
    my $start   = 0;
    my $wrapped = q{};
    while ( $start < length( $text ) ) {
        $wrapped .= substr($text, $start, $self->wrap ) . "\n";
        $start += $self->wrap;
    }
    
    chomp $wrapped;

    return $wrapped;

}

=head1 AUTHOR

Olaf Alders, C<< <olaf at wundercounter.com> >>

=head1 BUGS

Please report any bugs or feature requests to
C<bug-acme-scripturacontinua at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Acme-ScripturaContinua>.
I will be notified, and then you'll automatically be notified of progress on
your bug as I make changes.


=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Acme::ScripturaContinua


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Acme-ScripturaContinua>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Acme-ScripturaContinua>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Acme-ScripturaContinua>

=item * Search CPAN

L<http://search.cpan.org/dist/Acme-ScripturaContinua/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 COPYRIGHT & LICENSE

Copyright 2009 Olaf Alders.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.


=cut

1; # End of Acme::ScripturaContinua
