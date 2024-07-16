module Avion.Menu (menuAvion) where

import Avion.Actualizar (actualizarAvion)
import Avion.Crear (crearAvion)
import Avion.Eliminar (eliminarAvion)
import Avion.Leer (leerAviones)
import Database.SQLite.Simple

menuAvion :: Connection -> IO ()
menuAvion conn = do
  putStrLn "1. Crear avion"
  putStrLn "2. Leer aviones"
  putStrLn "3. Actualizar avion"
  putStrLn "4. Eliminar avion"
  putStrLn "5. Volver al menú principal"
  putStrLn "Selecciona una opción:"
  opcion <- getLine
  case opcion of
    "1" -> crearAvion conn
    "2" -> leerAviones conn
    "3" -> actualizarAvion conn
    "4" -> eliminarAvion conn
    "5" -> return ()
    _ -> putStrLn "Opción no válida" >> menuAvion conn