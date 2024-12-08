fastFib :: Integer -> Integer -> Integer -> Integer
fastFib _ num2 0 = num2
fastFib num1 num2 counter = fastFib num2 (num1 + num2) (counter - 1)

main :: IO ()
main = do
  print $ fastFib 0 1 1000 -- 1000 число