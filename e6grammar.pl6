grammar number {

  token TOP { <single> }
  
  token integer           { <dec_integer>       |
                            <dec_integer_sep>   |
                            <hex_integer>       |
                            <hex_integer_sep>   |
                            <bin_integer>       |
                            <bin_integer_sep>   } 
  
  token single            { <dec_single> | <hex_single> | <bin_single> }

  token scientific        { <dec_scientific>    |
                            <hex_scientific>    |
                            <bin_scientific>    }
   
  # Numbers in Scientific notation
  token dec_scientific    { <dec_single> 'E' (<dec_integer> | <dec_integer_sep>) }
  token hex_scientific    { <hex_single> 'X' (<hex_integer> | <hex_integer_sep>) }
  token bin_scientific    { <bin_single> 'B' (<bin_integer> | <bin_integer_sep>) }
  
  # Single precision floating point numbers.
  token dec_single        { (<dec_integer> | <dec_integer_sep>) '.' \d+ }
  token hex_single        { (<hex_integer> | <hex_integer_sep>) '.' <hex_digits>+ }
  token bin_single        { (<bin_integer> | <bin_integer_sep>) '.' <bin_digits>+ }
  
  # Integers in decimal
  token dec_integer_sep   { <pos_neg>? \d ** 1..3 (',' \d ** 3 )* }
  token dec_integer       { <pos_neg>? \d+ }
	
	# Integers in hexadecimal
  token hex_integer       { <pos_neg>? '#x' <hex_digits>+ }
  token hex_integer_sep   { <pos_neg>? '#x' 
                            <hex_digits> ** 1..2 
                            (',' <hex_digits> ** 2)* }
  
  # Integers in binary
  token bin_integer       { <pos_neg>? '#b' <bin_digits>+ }
  token bin_integer_sep   { <pos_neg>? '#b' 
                            <bin_digits> ** 1..8
                            (',' <bin_digits> ** 8)* }

  token pos_neg           { ['+' | '-'] }
  token hex_digits        { <[a..fA..F0..9]> }
  token bin_digits        { <[01]> }

}
