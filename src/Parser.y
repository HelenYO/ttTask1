{
module Parser where

import Grammar
import Lexer
}

%name      parseExpr
%tokentype { Token }
%error     { parseError }
%monad     { Either String }{ >>= }{ return }

%token IDENT   { Ident $$ }
%token DOT     { DotT }
%token LAMBDA { Lamb }
%token LEFTP   { LeftP }
%token RIGHTP  { RightP }

%%

Expression
  : LAMBDA Var DOT Expression 		    { Ab $2 $4 }
  | App LAMBDA Var DOT Expression 		{ Ap $1 (Ab $3 $5) }
  | App                      			{ $1 }

App
  : App Atom       	   					{ Ap $1 $2 }
  | Atom               					{ $1 }

Atom
  : Var               	    			{ $1 }
  | LEFTP Expression RIGHTP 			{ $2 }

Var
  : IDENT              					{ Var $1 }

{
parseError = fail "Parse error"
}