-- Функция для вычисления n-го числа Фибоначчи
fib :: Int -> Integer
fib 0 = 0
fib 1 = 1
fib n = fib (n - 1) + fib (n - 2)

-- Область main с примером использования
main :: IO ()
main = do
  putStrLn "Enter the value of n to find the nth Fibonacci number:"
  input <- getLine
  let n = read input :: Int
  let result = fib n
  putStrLn $ "The " ++ show n ++ "th Fibonacci number is: " ++ show result