{-# LANGUAGE OverloadedStrings #-}

module Reserva.Leer (leerReservas) where

import Database.SQLite.Simple
import Database.SQLite.Simple.FromRow

data Reserva = Reserva
  { reservaId :: Int,
    fechaReserva :: String,
    cliente :: Cliente,
    vuelo :: Vuelo
  }
  deriving (Show)

data Cliente = Cliente
  { dni :: String,
    nombre :: String,
    apellido :: String,
    email :: String,
    telefono :: Maybe String
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

instance FromRow Reserva where
  fromRow = Reserva <$> field <*> field <*> clienteFromRow <*> vueloFromRow

clienteFromRow :: RowParser Cliente
clienteFromRow = Cliente <$> field <*> field <*> field <*> field <*> field

vueloFromRow :: RowParser Vuelo
vueloFromRow = Vuelo <$> field <*> field <*> field <*> field <*> field

leerReservas :: Connection -> IO ()
leerReservas conn = do
  let queryStr = "SELECT r.reserva_id, r.fecha_reserva, c.dni_cli, c.nombre, c.apellido, c.email, c.telefono, v.cod_vuelo, v.origen, v.destino, v.fecha_salida, v.fecha_llegada FROM Reserva r JOIN Cliente c ON r.dni_cli = c.dni_cli JOIN Vuelo v ON r.cod_vuelo = v.cod_vuelo"
  reservas <- query_ conn (Query queryStr) :: IO [Reserva]
  mapM_ print reservas
