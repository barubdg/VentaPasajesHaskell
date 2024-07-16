{-# LANGUAGE OverloadedStrings #-}

module Avion.Leer (leerAviones) where

import Database.SQLite.Simple
import Database.SQLite.Simple.FromRow

data Avion = Avion {vueloId :: Int, modelo :: String, capacidad :: Int, aerolinea :: String}
  deriving (Show)

instance FromRow Avion where
  fromRow = Avion <$> field <*> field <*> field <*> field

leerAviones :: Connection -> IO ()
leerAviones conn = do
  aviones <- query_ conn "SELECT * FROM Avion" :: IO [Avion]
  mapM_ print aviones
