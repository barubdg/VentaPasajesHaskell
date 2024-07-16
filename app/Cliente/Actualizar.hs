{-# LANGUAGE OverloadedStrings #-}

module Cliente.Actualizar where

import qualified Data.Text as T
import Database.SQLite.Simple

actualizarCliente :: Connection -> IO ()
actualizarCliente conn = do
  putStrLn "ID del cliente a actualizar:"
  clienteIdStr <- getLine
  let clienteId :: Int
      clienteId = read clienteIdStr -- Convertir a Int
  putStrLn "Nuevo nombre:"
  nombre <- getLine
  putStrLn "Nuevo apellido:"
  apellido <- getLine
  putStrLn "Nuevo email:"
  email <- getLine
  putStrLn "Nuevo teléfono:"
  telefono <- getLine
  putStrLn "Nuevo dni:"
  dni_cli <- getLine
  execute conn "UPDATE Cliente SET nombre = ?, apellido = ?, email = ?, telefono = ?, dni_cli = ? WHERE cliente_id = ?" (nombre, apellido, email, telefono, dni_cli, clienteId)
  putStrLn "Cliente actualizado exitosamente"
