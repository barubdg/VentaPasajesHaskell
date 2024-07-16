module Asiento.Menu (menuAsiento) where

import Asiento.Actualizar (actualizarAsiento)
import Asiento.Crear (crearAsiento)
import Asiento.Eliminar (eliminarAsiento)
import Asiento.Leer (leerAsientos)
import Database.SQLite.Simple

menuAsiento :: Connection -> IO ()
menuAsiento conn = do
  putStrLn "1. Crear asiento"
  putStrLn "2. Leer asientos"
  putStrLn "3. Actualizar asiento"
  putStrLn "4. Eliminar asiento"
  putStrLn "5. Volver al menú principal"
  putStrLn "Selecciona una opción:"
  opcion <- getLine
  case opcion of
    "1" -> crearAsiento conn
    "2" -> leerAsientos conn
    "3" -> actualizarAsiento conn
    "4" -> eliminarAsiento conn
    "5" -> return ()
    _ -> putStrLn "Opción no válida" >> menuAsiento conn