{-# LANGUAGE OverloadedStrings #-}

module Vuelo.Crear (crearVuelo) where

import Database.SQLite.Simple

crearVuelo :: Connection -> IO ()
crearVuelo conn = do
  putStrLn "Origen:"
  origen <- getLine
  putStrLn "destino:"
  destino <- getLine
  putStrLn "fecha salida:"
  fechaSalida <- getLine
  putStrLn "fecha llegada:"
  fechaLlegada <- getLine
  putStrLn "código vuelo:"
  cod_vuelo <- getLine
  execute conn "INSERT INTO Vuelo (origen, destino, fecha_salida, fecha_llegada, cod_vuelo) VALUES (?, ?, ?, ?,?)" (origen, destino, fechaSalida, fechaLlegada, cod_vuelo)
  putStrLn "Vuelo creado exitosamente"
