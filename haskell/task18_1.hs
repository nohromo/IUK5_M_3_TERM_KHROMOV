-- Определение типа данных для Triple (тройки)
data Triple a = Triple a a a deriving (Show)

-- Определение экземпляра Functor для Triple
instance Functor Triple where
  fmap f (Triple x y z) = Triple (f x) (f y) (f z)

-- Определение типа данных для Box
data Box a = Box a deriving (Show)

-- Определение экземпляра Functor для Box
instance Functor Box where
  fmap f (Box x) = Box (f x)

-- Пример использования
main :: IO ()
main = do
  let triple = Triple 1 2 3
  let mappedTriple = fmap (* 2) triple
  putStrLn $ "Mapped triple: " ++ show mappedTriple

  let box = Box 5
  let mappedBox = fmap (* 3) box
  putStrLn $ "Mapped box: " ++ show mappedBox