import Data.ByteString qualified as BS
import System.Environment
import System.IO

-- Функция для сравнения количества символов с размером файла
compareFileSizeAndCharacterCount :: FilePath -> IO ()
compareFileSizeAndCharacterCount fileName = do
  handle <- openFile fileName ReadMode
  fileSize <- hFileSize handle
  fileContent <- BS.readFile fileName
  let characterCount = length (BS.unpack fileContent)
  hClose handle
  putStrLn $ "The number of characters in the file:" ++ show characterCount
  putStrLn $ "File size:" ++ show fileSize
  if fromIntegral characterCount == fileSize
    then putStrLn "The number of characters in the file is equal to the file size in bytes."
    else putStrLn "The number of characters in the file is not equal to the file size in bytes."

-- Область main с примером использования
main :: IO ()
main = do
  args <- getArgs
  case args of
    [fileName] -> compareFileSizeAndCharacterCount fileName
    _ -> putStrLn "Usage: compareFileSizeAndCharacterCount <filename>"