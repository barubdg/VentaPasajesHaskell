{-# LANGUAGE OverloadedStrings #-}

module Vuelo.Actualizar where

import qualified Data.Text as T
import Database.SQLite.Simple

actualizarVuelo :: Connection -> IO ()
actualizarVuelo conn = do
  putStrLn "ID del vuelo a actualizar:"
  vueloIdStr <- getLine
  let vueloId :: Int
      vueloId = read vueloIdStr -- Convertir a Int
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
  execute conn "UPDATE Vuelo SET origen = ?, destino = ?, fecha_salida = ?, fecha_llegada = ?, cod_vuelo=? WHERE vuelo_id = ?" (origen, destino, fechaSalida, fechaLlegada, cod_vuelo, vueloId)
  putStrLn "Vuelo actualizado exitosamente"
