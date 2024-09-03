#Merge all the lessons into a single valid html file in the order defined by toc.txt

#Create the file for the result
$result_file = 'completeguide.html';

open RESULT, "+>$result_file" or die "can't open $result_file $!";


#Read in the table of contents
$toc = 'toc.txt';

open TOCFILE, "$toc" or die "can't open $toc $!";

@file_list = <TOCFILE>;
  
#Write the head
$head_file = 'head.txt';

open HEADFILE, "$head_file" or die "can't open $head_file $!";
print RESULT <HEADFILE>;
 
#Process and mergeall files
foreach $file (@file_list) {

	open DATAFILE, "$file" or die "can't open $file $!";
	@file_contents = <DATAFILE>;
	

	#Process the content of each file
	for ($j = 0; $j < scalar(@file_contents); $j++) {
	
    		#Write out past the <h1> tag except for the navigation
    		if (@file_contents[$j] =~ /^\s*<h1>/i) {
    			print RESULT @file_contents[$j];
    			$j++;
    			
    			#Don't output navigation
    			while (@file_contents[$j] !~ /<\/table>/i) {
    				$j++;
    			}
    			$j++;
    			
    			while (  ($j < scalar(@file_contents)) && (@file_contents[$j] !~ /\s*<div class="botmenu">/i) ) {
    				if (@file_contents[$j] =~ /part[0-9]/i) {
    					chomp $file;
    					@file_contents[$j]=~s/part[0-9]/$&\.$file/g;
				}
    					
				print RESULT @file_contents[$j];
    			        $j++;
    			}
    			
    			#Don't output navigation
    			while (@file_contents[$j] !~ /\s*<div class="footer">/i) {
    				$j++;
    			}
    			
    			#Output copyright and license
    			print RESULT "<br />";
    			while (  ($j < scalar(@file_contents)) && (@file_contents[$j] !~ /\s*<\/body>/i) ) {
				print RESULT @file_contents[$j];
    			        $j++;
    			}
 		}
   	}

	close (DATAFILE);
	print RESULT "<br class=\"break\"/>\n";

}

#Finish the file
print RESULT "</body>\n";
print RESULT "</html>";

close (TOCFILE);
close (RESULT);