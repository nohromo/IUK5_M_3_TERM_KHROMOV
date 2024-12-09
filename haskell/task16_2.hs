-- Определение типа данных для фигур
data Shape = Circle Float | Square Float | Rectangle Float Float

-- Функция для вычисления площади фигуры
area :: Shape -> Float
area (Circle r) = pi * r * r
area (Square s) = s * s
area (Rectangle l w) = l * w

-- Функция для вычисления периметра фигуры
perimeter :: Shape -> Float
perimeter (Circle r) = 2 * pi * r
perimeter (Square s) = 4 * s
perimeter (Rectangle l w) = 2 * (l + w)

-- Пример использования
main :: IO ()
main = do
  let circleArea = area (Circle 3.0)
  let squarePerimeter = perimeter (Square 4.0)
  putStrLn $ "Area of the circle: " ++ show circleArea
  putStrLn $ "Perimeter of the square: " ++ show squarePerimeter