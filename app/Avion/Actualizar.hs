{-# LANGUAGE OverloadedStrings #-}

module Avion.Actualizar where

import qualified Data.Text as T
import Database.SQLite.Simple

actualizarAvion :: Connection -> IO ()
actualizarAvion conn = do
  putStrLn "ID del Avion a actualizar:"
  avionIdStr <- getLine
  let avionId :: Int
      avionId = read avionIdStr -- Convertir a Int
  putStrLn "Modelo:"
  modelo <- getLine
  putStrLn "Capacidad:"
  capacidadStr <- getLine
  let capacidadInt :: Int
      capacidadInt = read capacidadStr -- Convertir a Int
  putStrLn "Aerolinea:"
  aerolinea <- getLine
  execute conn "UPDATE Avion SET modelo = ?, capacidad = ?, aerolinea = ? WHERE avion_id = ?" (modelo, capacidadInt, aerolinea, avionId)
  putStrLn "Avion actualizado exitosamente"
