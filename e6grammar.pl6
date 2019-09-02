grammar number {

  token TOP { <integer> }
  
  token integer           { <dec_integer>       |
                            <dec_integer_sep>   |
                            <hex_integer>       |
                            <hex_integer_sep>   |
                            <bin_integer>       |
                            <bin_integer_sep>   } 
  
  token dec_integer_sep   { <pos_neg>? \d ** 1..3 (',' \d ** 3 )* }
  token dec_integer       { <pos_neg>? \d+ }

  token hex_integer       { <pos_neg>? '#x' <hex_digits>+ }
  token hex_integer_sep   { <pos_neg>? '#x' 
                            <hex_digits> ** 1..2 
                            (',' <hex_digits> ** 2)* }
  
  token bin_integer       { <pos_neg>? '#b' <bin_digits>+ }
  token bin_integer_sep   { <pos_neg>? '#b' 
                            <bin_digits> ** 1..8
                            (',' <bin_digits> ** 8)* }

  token pos_neg           { ['+' | '-'] }
  token hex_digits        { <[a..fA..F0..9]> }
  token bin_digits        { <[01]> }

}
