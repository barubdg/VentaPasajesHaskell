{-# LANGUAGE OverloadedStrings #-}

module Reserva.Actualizar where

import qualified Data.Text as T
import Database.SQLite.Simple

actualizarReserva :: Connection -> IO ()
actualizarReserva conn = do
  putStrLn "ID del Reserva a actualizar:"
  reservaIdStr <- getLine
  let reservaId :: Int
      reservaId = read reservaIdStr -- Convertir a Int
  putStrLn "Fecha de Reserva:"
  fecha_reserva <- getLine
  putStrLn "Código del Vuelo:"
  cod_vuelo <- getLine
  putStrLn "Dni del cliente:"
  dni_cli <- getLine
  execute conn "UPDATE Reserva SET fecha_reserva = ?, cod_vuelo = ?, dni_cli = ? WHERE reserva_id = ?" (fecha_reserva, cod_vuelo, dni_cli, reservaId)
  putStrLn "Reserva actualizado exitosamente"
