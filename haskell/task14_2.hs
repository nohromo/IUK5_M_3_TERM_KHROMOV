-- Определение типа данных для пятигранной кости
data FiveSidedDie = S1 | S2 | S3 | S4 | S5 deriving (Show)

-- Определение класса типов Die
class Die a where
  roll :: a -> Int

-- Создание экземпляра пятигранной кости
instance Die FiveSidedDie where
  roll S1 = 1
  roll S2 = 2
  roll S3 = 3
  roll S4 = 4
  roll S5 = 5

-- Пример использования
main :: IO ()
main = do
  let exampleDie = S3
  putStrLn $ "Rolling the die: " ++ show (roll exampleDie)