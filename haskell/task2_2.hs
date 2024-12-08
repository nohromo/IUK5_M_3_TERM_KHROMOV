inc :: (Num a) => a -> a
inc n = n + 1

double :: (Num a) => a -> a
double n = 2 * n

square :: (Num a) => a -> a
square n = n * n

main :: IO ()
main = do
  print $ inc 10 -- 10 + 1
  print $ double 2 -- 2 * 2
  print $ square 4 -- 4^2