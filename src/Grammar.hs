module Grammar where

data Expression = Var String | Ap Expression Expression | Ab Expression Expression
  deriving (Eq)

instance Show Expression where
  show (Var s) = s
  show (Ap f s) = "(" ++ show f ++ " " ++ show s ++ ")"
  show (Ab f s) = "(\\" ++ show f ++ "." ++ show s ++ ")"