{-# LANGUAGE OverloadedStrings #-}

module Vuelo.Leer (leerVuelos) where

import Database.SQLite.Simple
import Database.SQLite.Simple.FromRow

data Vuelo = Vuelo {vueloId :: Int, origen :: String, destino :: String, fecha_salida :: String, fecha_llegada :: Maybe String, cod_vuelo :: String}
  deriving (Show)

instance FromRow Vuelo where
  fromRow = Vuelo <$> field <*> field <*> field <*> field <*> field <*> field

leerVuelos :: Connection -> IO ()
leerVuelos conn = do
  vuelos <- query_ conn "SELECT * FROM Vuelo" :: IO [Vuelo]
  mapM_ print vuelos
