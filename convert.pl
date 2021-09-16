#!/Strawberry/perl/bin -w
use strict;
use warnings;

chomp(my $in=<STDIN>);
&rename_file($in);



#recusive change file name
sub rename_file(){
    my($path)=@_;
    opendir my $h_dir,"$path"||die "open folder fail";
    my @file=readdir($h_dir);
    close($h_dir);

    foreach (@file){
        my $my_time = (stat "$path\\$_")[9];
        my @t = localtime $my_time;
        my $date = sprintf "--%02u%02u-%02u-%02u",$t[4] + 1 ,$t[3], $t[2], $t[1];
        my $newFile="$path\\$_$date.png";
        print($newFile ."\n");
        rename "$path\\$_",$newFile;
    }
}