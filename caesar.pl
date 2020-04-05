
#!/usr/bin/perl

use 5.010;
use strict;
use warnings;

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
sub affine() {
  my $s = uc <STDIN>;
  my @arr = $s =~ /./g;
  my $c = 0;
  my $d = 0;
  my $a;
  my $b;
  while($c != 1){
    $a = int(rand(26))+1;
    $b = int(rand(26))+1;
    $c = $a;
    $d = 26;
    while($d != 0){
      my $t = $d;
      $d = $c % $t;
      $c = $t;
    }
  }
  for my $i(0..(scalar @arr)-1){
    if($arr[$i] =~ /[A-Z]/){
      $arr[$i] = chr((($a*(ord($arr[$i])-65)+$b)%26)+65);
    }
  }
  print$a, " ", $b, "\n";
  for my $i(0..(scalar @arr)-1){
    print$arr[$i];
  }
}
sub pollux(){
  my $s = uc <STDIN>;
  my @arr = $s =~ /./g;
  my @dots = split(',', <STDIN>);
  my @dashes = split(',', <STDIN>);
  my @space = split(',', <STDIN>);
  my @a = qw(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z);
  my @morse = qw(.- -... -.-. -.. . ..-. --. .... .. .--- -.- .-.. -- -. --- .--. --.- .-. ... - ..- ...- .-- -..- -.-- --..);
  my $thingtosay = "";
  for my $i(0..@arr-1){
    if($arr[$i] =~ /[A-Z]/){
      my ($index) = grep { $a[$_] eq $arr[$i] } (0 .. @a-1);
		  my $b = defined $index ? $index : -1;
      my @armorse = $morse[$b] =~ /./g;
      for my $j(0..@armorse-1){
        if($armorse[$j] eq '.'){
          $thingtosay .= $dots[int(rand(@dots-1))];
        } elsif($armorse[$j] eq '-'){
          $thingtosay .= $dashes[int(rand(@dashes-1))];
        }
      }
      $thingtosay .= $space[int(rand(@space-1))];
    }
  }
  print$thingtosay;
}
sub hill2 (){
  my $s = uc <STDIN>;
  my @arr = $s =~ /./g;
  if(@arr%2 != 0){
    push(@arr, 'Z');
  }
  my $key = <STDIN>;
  my @arkey = split(', ', $key);
  my $a = ord($arkey[0])%65;
  my $b = ord($arkey[1])%65;
  my $c = ord($arkey[2])%65;
  my $d = ord($arkey[3])%65;
  my $i = 0;
  while($i < @arr-1){
    if($arr[$i] =~ /[A-Z]/){
      my $e = ord($arr[$i])%65;
      my $f = ord($arr[$i+1])%65;
      my $top = ($a*$e + $b*$f)%26;
      my $bottom = ($c*$e + $d*$f)%26;
      print chr($top+65), chr($bottom+65);
    }
    $i+=2;
  }
}
hill2();
#Hill 2x2, Pollux, Affine, Atbash, Vigirene, and Caesar ciphers all work fine