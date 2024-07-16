{-# LANGUAGE OverloadedStrings #-}

module Asiento.Leer (leerAsientos) where

import Database.SQLite.Simple
import Database.SQLite.Simple.FromRow

data Asiento = Asiento
  { asientoId :: Int,
    numeroAsiento :: String,
    clase :: String,
    estado :: String,
    vuelo :: Vuelo
  }
  deriving (Show)

data Vuelo = Vuelo
  { codVuelo :: String,
    origen :: String,
    destino :: String,
    fechaSalida :: String,
    fechaLlegada :: String
  }
  deriving (Show)

instance FromRow Asiento where
  fromRow = Asiento <$> field <*> field <*> field <*> field <*> (Vuelo <$> field <*> field <*> field <*> field <*> field)

leerAsientos :: Connection -> IO ()
leerAsientos conn = do
  let queryStr = "SELECT a.asiento_id, a.numero_asiento, a.clase, a.estado, v.cod_vuelo, v.origen, v.destino, v.fecha_salida, v.fecha_llegada FROM Asiento a JOIN Vuelo v ON a.cod_vuelo = v.cod_vuelo"
  asientos <- query_ conn (Query queryStr) :: IO [Asiento]
  mapM_ print asientos
