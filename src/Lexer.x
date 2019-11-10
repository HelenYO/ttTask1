{
module Lexer where
}

%wrapper "basic"

$digit = 0-9
$letter = [a-z]
$apostrophe = '
tokens :-
  \(                         	            { \_ -> LeftP }
  \)                         	            { \_ -> RightP }
  \.                         	            { \_ -> DotT }
  \\                         	            { \_ -> Lamb }
  $letter [$letter $digit $apostrophe]*     { \s -> Ident s }
  $white+                    	            ;
  "#".*                      	            ;
  \n                                       ;
  \r                                       ;
{
data Token = Lamb
           | DotT
           | LeftP
           | RightP
           | Ident String
           deriving (Show, Eq)
}
