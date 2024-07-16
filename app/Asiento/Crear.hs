{-# LANGUAGE OverloadedStrings #-}

module Asiento.Crear (crearAsiento) where

import Database.SQLite.Simple

crearAsiento :: Connection -> IO ()
crearAsiento conn = do
  putStrLn "N° Asiento:"
  numero_asiento <- getLine
  putStrLn "Clase:"
  clase <- getLine
  putStrLn "Estado:"
  estado <- getLine
  putStrLn "Código de Vuelo:"
  cod_vuelo <- getLine
  execute conn "INSERT INTO Asiento (numero_asiento, clase, estado, cod_vuelo) VALUES (?, ?, ?,?)" (numero_asiento, clase, estado, cod_vuelo)
  putStrLn "Asiento creado exitosamente"
