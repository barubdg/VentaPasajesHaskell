{-# LANGUAGE OverloadedStrings #-}

module Reserva.Crear (crearReserva) where

import Database.SQLite.Simple

crearReserva :: Connection -> IO ()
crearReserva conn = do
  putStrLn "Fecha de Reserva:"
  fecha_reserva <- getLine
  putStrLn "Código del Vuelo:"
  cod_vuelo <- getLine
  putStrLn "Dni del cliente:"
  dni_cli <- getLine
  execute conn "INSERT INTO Reserva (fecha_reserva, cod_vuelo, dni_cli) VALUES (?, ?, ?)" (fecha_reserva, cod_vuelo, dni_cli)
  putStrLn "Reserva creado exitosamente"
