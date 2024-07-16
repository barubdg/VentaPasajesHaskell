{-# LANGUAGE OverloadedStrings #-}

module Cliente.Crear (crearCliente) where

import Database.SQLite.Simple

crearCliente :: Connection -> IO ()
crearCliente conn = do
  putStrLn "Nombre:"
  nombre <- getLine
  putStrLn "Apellido:"
  apellido <- getLine
  putStrLn "Email:"
  email <- getLine
  putStrLn "Teléfono (opcional):"
  telefono <- getLine
  putStrLn "Dni:"
  dni_cli <- getLine
  execute conn "INSERT INTO Cliente (nombre, apellido, email, telefono, dni_cli) VALUES (?, ?, ?, ?,?)" (nombre, apellido, email, telefono, dni_cli)
  putStrLn "Cliente creado exitosamente"
