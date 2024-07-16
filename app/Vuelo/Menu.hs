module Vuelo.Menu (menuVuelo) where

import Database.SQLite.Simple
import Vuelo.Actualizar (actualizarVuelo)
import Vuelo.Crear (crearVuelo)
import Vuelo.Eliminar (eliminarVuelo)
import Vuelo.Leer (leerVuelos)

menuVuelo :: Connection -> IO ()
menuVuelo conn = do
  putStrLn "1. Crear vuelo"
  putStrLn "2. Leer vuelos"
  putStrLn "3. Actualizar vuelo"
  putStrLn "4. Eliminar vuelo"
  putStrLn "5. Volver al menú principal"
  putStrLn "Selecciona una opción:"
  opcion <- getLine
  case opcion of
    "1" -> crearVuelo conn
    "2" -> leerVuelos conn
    "3" -> actualizarVuelo conn
    "4" -> eliminarVuelo conn
    "5" -> return ()
    _ -> putStrLn "Opción no válida" >> menuVuelo conn