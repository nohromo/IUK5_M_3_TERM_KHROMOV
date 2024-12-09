import Data.ByteString qualified as BS

-- Функция для копирования файла
copyFile :: FilePath -> FilePath -> IO ()
copyFile sourceFile destFile = do
  content <- BS.readFile sourceFile
  BS.writeFile destFile content
  putStrLn $ "File copied from " ++ sourceFile ++ " to " ++ destFile

-- Область main с примером использования
main :: IO ()
main = do
  putStrLn "Enter the source file name:"
  source <- getLine
  putStrLn "Enter the destination file name:"
  destination <- getLine
  copyFile source destination