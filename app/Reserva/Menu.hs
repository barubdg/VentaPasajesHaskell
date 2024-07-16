module Reserva.Menu (menuReserva) where

import Database.SQLite.Simple
import Reserva.Actualizar (actualizarReserva)
import Reserva.Crear (crearReserva)
import Reserva.Eliminar (eliminarReserva)
import Reserva.Leer (leerReservas)

menuReserva :: Connection -> IO ()
menuReserva conn = do
  putStrLn "1. Crear reserva"
  putStrLn "2. Leer reservas"
  putStrLn "3. Actualizar reserva"
  putStrLn "4. Eliminar reserva"
  putStrLn "5. Volver al menú principal"
  putStrLn "Selecciona una opción:"
  opcion <- getLine
  case opcion of
    "1" -> crearReserva conn
    "2" -> leerReservas conn
    "3" -> actualizarReserva conn
    "4" -> eliminarReserva conn
    "5" -> return ()
    _ -> putStrLn "Opción no válida" >> menuReserva conn