{-# LANGUAGE OverloadedStrings #-}

module Asiento.Actualizar where

import qualified Data.Text as T
import Database.SQLite.Simple

actualizarAsiento :: Connection -> IO ()
actualizarAsiento conn = do
  putStrLn "ID del Asiento a actualizar:"
  asientoIdStr <- getLine
  let asientoId :: Int
      asientoId = read asientoIdStr -- Convertir a Int
  putStrLn "N° Asiento:"
  numero_asiento <- getLine
  putStrLn "Clase:"
  clase <- getLine
  putStrLn "Estado:"
  estado <- getLine
  putStrLn "Código de Vuelo:"
  cod_vuelo <- getLine
  execute conn "UPDATE Asiento SET numero_asiento = ?, clase = ?, estado = ?, cod_vuelo = ? WHERE asiento_id = ?" (numero_asiento, clase, estado, cod_vuelo, asientoId)
  putStrLn "Asiento actualizado exitosamente"
