package Tie::Scalar::OK;

use strict;
use base qw(Tie::Scalar);
use vars qw($VERSION);

$VERSION = '1.02';

sub TIESCALAR {
   my $class = shift;
   my $self  = {
      i  => 0,
      ok => '',
   };
   return bless $self, $class;
}

sub STORE {
   my ($self,$ok) = @_;
   $self->{ok} = $ok ? 'ok' : 'not ok';
   $self->{i}++;
}

sub FETCH {
   my ($self) = @_;
   return "$self->{ok} $self->{i}\n";
}

1;

=pod

=head1 NAME

Tie::Scalar::OK - generate numbered 'ok/not ok' strings

=head1 DESCRIPTION

This module generates the output that test modules expect
in a similar manner as Test.pm, i.e. "ok #" or "not ok #"
strings are printed to STDOUT for pass and fail, respectively.

=head1 SYNOPSIS

   use strict;
   use Tie::Scalar::OK;

   my $ok;
   tie $ok, 'Tie::Scalar::OK';

   print $ok = (1 != 1);                        # not ok
   print $ok = (2 == 1+1);                      # ok
   print $ok = ('foo' eq join('',qw(f o o)));   # ok
   print $ok = ('rab' ne scalar reverse 'bar'); # not ok
   print $ok = ('phenobarbitone' =~ /bar/ );    # ok
   print $ok = (0 != (32&(32-1)));              # not ok

=head1 SEE ALSO

Test
Test::Harness
Test::Simple
Test::More

=head1 AUTHOR 

Jeffrey Hayes Anderson <captvanhalen@yahoo.com>

=head1 COPYRIGHT

Copyright (c) 2003 Jeffrey Hayes Anderson.

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without restriction,
including without limitation the rights to use, copy, modify,
merge, publish, distribute, sublicense, and/or sell copies of the
Software, and to permit persons to whom the Software is furnished to
do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included
in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

=cut
