{-# LANGUAGE OverloadedStrings #-}

module Asiento.Eliminar where

import qualified Data.Text as T
import Database.SQLite.Simple

eliminarAsiento :: Connection -> IO ()
eliminarAsiento conn = do
  putStrLn "ID del asiento a eliminar:"
  asientoIdStr <- getLine
  let asientoId :: Int
      asientoId = read asientoIdStr -- Convertir a Int
  execute conn "DELETE FROM Asiento WHERE asiento_id = ?" (Only asientoId)
  putStrLn "Asiento eliminado exitosamente"
