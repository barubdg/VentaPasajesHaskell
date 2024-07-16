{-# LANGUAGE OverloadedStrings #-}

module Vuelo.Eliminar where

import qualified Data.Text as T
import Database.SQLite.Simple

eliminarVuelo :: Connection -> IO ()
eliminarVuelo conn = do
  putStrLn "ID del vuelo a eliminar:"
  vueloIdStr <- getLine
  let vueloId :: Int
      vueloId = read vueloIdStr -- Convertir a Int
  execute conn "DELETE FROM Vuelo WHERE vuelo_id = ?" (Only vueloId)
  putStrLn "Vuelo eliminado exitosamente"
