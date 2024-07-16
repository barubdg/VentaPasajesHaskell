{-# LANGUAGE OverloadedStrings #-}

module Cliente.Eliminar where

import qualified Data.Text as T
import Database.SQLite.Simple

eliminarCliente :: Connection -> IO ()
eliminarCliente conn = do
  putStrLn "ID del cliente a eliminar:"
  clienteIdStr <- getLine
  let clienteId :: Int
      clienteId = read clienteIdStr -- Convertir a Int
  execute conn "DELETE FROM Cliente WHERE cliente_id = ?" (Only clienteId)
  putStrLn "Cliente eliminado exitosamente"
