{-# LANGUAGE OverloadedStrings #-}

module Avion.Crear (crearAvion) where

import Database.SQLite.Simple

crearAvion :: Connection -> IO ()
crearAvion conn = do
  putStrLn "Modelo:"
  modelo <- getLine
  putStrLn "Capacidad:"
  capacidadStr <- getLine
  let capacidadInt :: Int
      capacidadInt = read capacidadStr -- Convertir a Int
  putStrLn "Aerolinea:"
  aerolinea <- getLine
  execute conn "INSERT INTO Avion (modelo, capacidad, aerolinea) VALUES (?, ?, ?)" (modelo, capacidadInt, aerolinea)
  putStrLn "Avion creado exitosamente"
