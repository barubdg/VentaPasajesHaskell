{-# LANGUAGE OverloadedStrings #-}

module Cliente.Leer (leerClientes) where

import Database.SQLite.Simple
import Database.SQLite.Simple.FromRow

data Cliente = Cliente {clienteId :: Int, nombre :: String, apellido :: String, email :: String, telefono :: Maybe String, dni_cli :: String}
  deriving (Show)

instance FromRow Cliente where
  fromRow = Cliente <$> field <*> field <*> field <*> field <*> field <*> field

leerClientes :: Connection -> IO ()
leerClientes conn = do
  clientes <- query_ conn "SELECT * FROM Cliente" :: IO [Cliente]
  mapM_ print clientes
