grammar e6grammar {

	token TOP 					{ <number> }
  
	token identifier 			{ <id_dash> | <id_no_dash> }
  
	token number 				{ <integer> | <single> | <double> }
  
	token integer           	{ 	<dec_integer>       |
                            		<dec_integer_sep>   |
                            		<hex_integer>       |
                            		<hex_integer_sep>   |
                            		<bin_integer>       |
                            		<bin_integer_sep>   }
							
	token single				{ <double> 's' }
  
	token double				{ <dec_double> | <hex_double> | <bin_double> | <scientific> }

	token scientific			{ 	<dec_scientific>      |
                            		<dec_scientific_sep>  |
                            		<hex_scientific>      |
                            		<hex_scientific_sep>  |
                            		<bin_scientific>      |
                            		<bin_scientific_sep>  }


	# Numbers written in scientific notation for decimal, binary and hexadecimal
  
	token dec_scientific		{	<pos_neg>? \d '.' \d+ 'E' <pos_neg>? \d+ }
	token dec_scientific_sep	{	<pos_neg>? \d '.' \d+ 
                            		'E' <pos_neg>? \d ** 1..3 (',' \d ** 3)* }

	token hex_scientific		{	<pos_neg>? '#x' <hex_digits> '.' <hex_digits>+
                        			'X' <pos_neg>? <hex_digits>+ }
	token hex_scientific_sep	{	<pos_neg>? '#x' <hex_digits> '.' <hex_digits>+
                            		'X' <pos_neg>? <hex_digits> ** 1..2 (',' <hex_digits> ** 2)* }

	token bin_scientific		{	<pos_neg>? '#b' <bin_digits> '.' <bin_digits>+
                            		'B' <pos_neg>? <bin_digits>+ }
	token bin_scientific_sep	{ 	<pos_neg>? '#b' <bin_digits> '.' <bin_digits>+
                            		'B' <pos_neg>? <bin_digits> ** 1..8 (',' <bin_digits> ** 8)* } 

  
	# Double precision floating point numbers.
	token dec_double			{ (<dec_integer> | <dec_integer_sep>) '.' \d+ }
	token hex_double			{ (<hex_integer> | <hex_integer_sep>) '.' <hex_digits>+ }
	token bin_double			{ (<bin_integer> | <bin_integer_sep>) '.' <bin_digits>+ }
  
	# Integers in decimal
	token dec_integer_sep		{ <pos_neg>? \d ** 1..3 (',' \d ** 3 )* }
	token dec_integer    		{ <pos_neg>? \d+ }
	
	# Integers in hexadecimal
	token hex_integer			{	<pos_neg>? '#x' <hex_digits>+ }
	token hex_integer_sep		{	<pos_neg>? '#x' 
                        		<hex_digits> ** 1..2 
                            	(',' <hex_digits> ** 2)* }
  
	# Integers in binary
	token bin_integer			{	<pos_neg>? '#b' <bin_digits>+ }
	token bin_integer_sep		{	<pos_neg>? '#b' 
                        			<bin_digits> ** 1..8
                        			(',' <bin_digits> ** 8)* }

	# Match identifiers. Note that identifiers must be preceded by the '$' sigil
	token id_dash				{	'$' <[a..zA..Z_~]><[a..zA..Z0..9_~]>*
  									'-' <[a..zA..Z_~]><[a..zA..Z0..9_~]>* }
	token id_no_dash			{	'$' <[a..zA..Z_~]><[a..zA..Z0..9_~]>* }

	token boolean				{ 'true' | 'false' }
	token pos_neg				{ ['+' | '-'] }
	token hex_digits			{ <[a..fA..F0..9]> }
	token bin_digits			{ <[01]> }

}
