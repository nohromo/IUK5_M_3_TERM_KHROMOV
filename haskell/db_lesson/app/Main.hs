-- module Main where
-- import Control.Applicative
-- import Data.Time
-- import Database.SQLite.Simple
-- import Database.SQLite.Simple.FromRow
-- data Tool = Tool
--   { toolId :: Int,
--     name :: String,
--     description :: String,
--     lastReturned :: Day,
--     timesBorrowed :: Int
--   }
-- data User = User
--   { userId :: Int,
--     userName :: String
--   }
-- instance Show User where
--   show user = mconcat [show $ userId user, ".) ", userName user]
-- instance Show Tool where
--   show tool =
--     mconcat
--       [ show $ toolId tool,
--         ".) ",
--         name tool,
--         "\n описание: ",
--         description tool,
--         "\n последний раз возвращено: ",
--         show $ lastReturned tool,
--         "\n количество раз сдано в аренду: ",
--         show $ timesBorrowed tool,
--         "\n"
--       ]
-- withConn ::
--   String ->
--   (Connection -> IO a) ->
--   IO a
-- withConn dbName action = do
--   conn <- open dbName
--   res <- action conn
--   close conn
--   return res
-- addUser ::
--   String ->
--   IO ()
-- addUser userName =
--   withConn "tools.db" $ \conn -> do
--     execute conn "INSERT INTO users (username) VALUES (?)" (Only userName)
--     putStrLn "пользователь добавлен"
-- checkout ::
--   Int ->
--   Int ->
--   IO ()
-- checkout userId toolId =
--   withConn "tools.db" $ \conn ->
--     execute conn "INSERT INTO checkedout (user_id, tool_id) VALUES (?,?)" (userId, toolId)
-- instance FromRow User where
--   fromRow = User <$> field <*> field
-- instance FromRow Tool where
--   fromRow = Tool <$> field <*> field <*> field <*> field <*> field
-- printUsers ::
--   IO ()
-- printUsers =
--   withConn "tools.db" $ \conn -> do
--     resp <- query_ conn "SELECT * FROM users;" :: IO [User]
--     mapM_ print resp
-- addTool ::
--   String ->
--   String ->
--   Day ->
--   Int ->
--   IO ()
-- addTool toolName toolDescription lastReturn timesBorrowed =
--   withConn "tools.db" $ \conn -> do
--     execute
--       conn
--       "INSERT INTO tools (name, description, lastReturned, timesBorrowed) VALUES (?,?,?,?)"
--       (toolName, toolDescription, lastReturn, timesBorrowed)
--     putStrLn "Инструмент добавлен"
-- main ::
--   IO ()
-- main = do
--   addTool "Новый инсGhbтрумент" "Описание нового инструмента" (fromGregorian 2022 12 31) 0
--
--
--
--
--
--
--
--
--
--
-- import Network.HTTP.Client
-- import Network.HTTP.Types.Method
-- import Network.HTTP.Types.Status
-- -- Функция для создания HTTP-запроса без поддержки SSL
-- buildRequestNOSSL :: String -> String -> IO ()
-- buildRequestNOSSL method url = do
--   manager <- newManager defaultManagerSettings
--   request <- parseRequest url
--   let method' = case method of
--         "GET" -> "GET"
--         "POST" -> "POST"
--         _ -> error "Unsupported method"
--   let request' = request {method = method'}
--   response <- httpLbs request' manager
--   print $ statusCode $ responseStatus response
-- -- Область main с примером использования
-- main :: IO ()
-- main = do
--
--
--
--
--
--
--
--
--
--
{-# LANGUAGE DeriveGeneric #-}

import Data.Aeson
import GHC.Generics

-- Определение типа-суммы IntList
data IntList = Cons Int IntList | EmptyList
  deriving (Generic, Show)

-- Создание экземпляра ToJSON для типа IntList с использованием DeriveGeneric
instance ToJSON IntList

-- Пример значения типа IntList
intListExample :: IntList
intListExample = Cons 1 $ Cons 2 EmptyList

-- Область main с примером использования
main :: IO ()
main = do
  putStrLn $ "JSON representation of intListExample: " ++ (show $ encode intListExample)