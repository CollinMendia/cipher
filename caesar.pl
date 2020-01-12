#!/usr/bin/perl

use 5.010;
use strict;
use warnings;
use List::MoreUtils qw(first_index);
sub caesar() {
	my $s = uc <STDIN>;
	my $shift = <STDIN>;
	my @arr = $s=~/./g;
	my $i = 0;
	while($i < scalar @arr){
		if($arr[$i]=~/[A-Z]/){
			my $f = $arr[$i];
			my $g = (ord($f)+$shift);
			if($g>90){
				$g%=91;
				$g+=65;
			}
			my $f_new = chr($g);
			print"$f_new";
		} else{
			print"$arr[$i]";
		}
		$i++;
	}
	print"\n";
}
sub viginere() {
	my $s = uc <STDIN>;
	my $f = uc <STDIN>;
	my @g = $f =~ /./g;
	my @arr = $s=~/./g;
	my $j = 0;
	my @b;
	while($j < scalar @g){
		my $ui = ord($g[$j])%65;
		push @b, $ui;
		$j++;
	}
	my $i = 0;
	my $c = 0;
	while($i < scalar @arr){
		if($c < scalar @b){
			my $shift = $b[$c];
			if($arr[$i]=~/[A-Z]/){
				my $f = $arr[$i];
				my $g = (ord($f)+$shift);
				if($g>90){
					$g%=91;
					$g+=65;
				}
				my $f_new = chr($g);
				print"$f_new";
				$c++;
			} else{
				print"$arr[$i]";
			}
		} else{
			my $ka = $c%(scalar @b);
			my $shift = $b[$ka];
			if($arr[$i]=~/[A-Z]/){
				my $f = $arr[$i];
				my $g = (ord($f)+$shift);
				if($g>90){
					$g%=91;
					$g+=65;
				}
				my $f_new = chr($g);
				print"$f_new";
				$c++;
			} else{
				print"$arr[$i]";
			}
		}
		$i++;
	}
	print"\n";
}
sub atbash() {
	my $s = uc <STDIN>;
	my @a = qw(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z);
	my @a_reverse = reverse @a;
	my @arr = $s =~ /./g;
	my $i = 0;
	my @indexes;
	while($i < scalar @arr){
		my ($index) = grep { $a[$_] eq $arr[$i] } (0 .. @a-1);
		my $b = defined $index ? $index : -1;
		print"$a_reverse[$b]";
		$i++;
	}
}
viginere();
#Atbash, Vigirene, and Caesar ciphers all work fine