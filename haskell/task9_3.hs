harmonic :: (Fractional a, Enum a) => Int -> a
harmonic n = sum (take n [1 / x | x <- [2 ..]])

main :: IO ()
main = do
  print $ harmonic 10 -- Сумма первых 10 членов