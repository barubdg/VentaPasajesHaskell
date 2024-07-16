{-# LANGUAGE OverloadedStrings #-}

import qualified Asiento.Menu as Asiento
import qualified Avion.Menu as Avion
import qualified Cliente.Menu as Cliente
import Control.Monad (forever)
import Database.SQLite.Simple
import qualified Reserva.Menu as Reserva
import qualified Vuelo.Menu as Vuelo

main :: IO ()
main = do
  conn <- open "venta_pasajes.db"
  menuPrincipal conn
  close conn

menuPrincipal :: Connection -> IO ()
menuPrincipal conn = do
  let loop = do
        putStrLn "1. Clientes"
        putStrLn "2. Vuelos"
        putStrLn "3. Aviones"
        putStrLn "4. Reservas"
        putStrLn "5. Asiento"
        putStrLn "6. Salir"
        putStrLn "Selecciona una opción:"
        opcion <- getLine
        case opcion of
          "1" -> Cliente.menuCliente conn
          "2" -> Vuelo.menuVuelo conn
          "3" -> Avion.menuAvion conn
          "4" -> Reserva.menuReserva conn
          "5" -> Asiento.menuAsiento conn
          "6" -> do
            putStrLn "Adiós!"
          -- Aquí finalizamos el bucle.
          -- No hay necesidad de retornar nada.
          _ -> putStrLn "Opción no válida"
  -- Ejecutamos el bucle.
  loop
