module Cliente.Menu (menuCliente) where

import Cliente.Actualizar (actualizarCliente)
import Cliente.Crear (crearCliente)
import Cliente.Eliminar (eliminarCliente)
import Cliente.Leer (leerClientes)
import Database.SQLite.Simple

menuCliente :: Connection -> IO ()
menuCliente conn = do
  putStrLn "1. Crear cliente"
  putStrLn "2. Leer clientes"
  putStrLn "3. Actualizar cliente"
  putStrLn "4. Eliminar cliente"
  putStrLn "5. Volver al menú principal"
  putStrLn "Selecciona una opción:"
  opcion <- getLine
  case opcion of
    "1" -> crearCliente conn
    "2" -> leerClientes conn
    "3" -> actualizarCliente conn
    "4" -> eliminarCliente conn
    "5" -> return ()
    _ -> putStrLn "Opción no válida" >> menuCliente conn
