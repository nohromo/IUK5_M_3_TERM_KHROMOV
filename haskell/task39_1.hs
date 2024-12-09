import Network.HTTP.Client
import Network.HTTP.Types.Header
import Network.HTTP.Types.URI

-- Функция для создания HTTP-запроса без поддержки SSL
buildRequestNOSSL :: String -> String -> [(HeaderName, ByteStringValue)] -> Request
buildRequestNOSSL method url headers = setRequestSecure request False
  where
    request = setRequestHeaders (map (fmap original) headers) $ setRequestMethod method $ parseRequest_ url

-- Область main с примером использования
main :: IO ()
main = do
  let request = buildRequestNOSSL "GET" "http://example.com/api/data" [("User-Agent", "MyApp/1.0")]
  print request