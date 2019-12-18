{-# LANGUAGE OverloadedStrings #-}

import Web.Scotty (scotty, param, html, get, setHeader, file, notFound)
import qualified Data.Text.Lazy as TL
import qualified Data.Text as T
import Network.Mime (defaultMimeLookup)
import Data.Text.Lazy.Encoding (decodeUtf8)
import qualified Data.ByteString.Lazy as BL

main :: IO ()
main = scotty 3000 $ do
  get "/:word" $ do
    beam <- param "word"
    html $ mconcat ["<h1>Scotty, ", beam, " me up!</h1>"]
  get "/add/:x/:y" $ do
    x <- param "x"
    y <- param "y"
    html $ mconcat ["<h1>", TL.pack $ show (x + y :: Int), "</h1>"]
  get "/file/:file" $ do
    fn <- param "file"
    let mimeType = decodeUtf8 
                 $ BL.fromStrict 
                 $ defaultMimeLookup fn
    setHeader "Content-Type" mimeType
    file $ T.unpack fn
  notFound $ do
    html $ "<h1>Not Found</h1>"
