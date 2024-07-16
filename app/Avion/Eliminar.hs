{-# LANGUAGE OverloadedStrings #-}

module Avion.Eliminar where

import qualified Data.Text as T
import Database.SQLite.Simple

eliminarAvion :: Connection -> IO ()
eliminarAvion conn = do
  putStrLn "ID del avion a eliminar:"
  avionIdStr <- getLine
  let avionId :: Int
      avionId = read avionIdStr -- Convertir a Int
  execute conn "DELETE FROM avion WHERE avion_id = ?" (Only avionId)
  putStrLn "Avion eliminado exitosamente"
