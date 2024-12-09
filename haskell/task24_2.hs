import Data.Char (toUpper)
import Data.Text qualified as T
import Data.Text.IO qualified as TIO
import System.Environment

-- Функция для преобразования содержимого файла в прописные буквы и записи обратно в файл
capitalizeFile :: FilePath -> IO ()
capitalizeFile fileName = do
  text <- TIO.readFile fileName
  let capitalizedText = T.toUpper text
  TIO.writeFile fileName capitalizedText
  putStrLn $ "File content capitalized and written back to " ++ fileName

-- Область main с примером использования
main :: IO ()
main = do
  args <- getArgs
  case args of
    [fileName] -> capitalizeFile fileName
    _ -> putStrLn "Usage: capitalize <filename>"