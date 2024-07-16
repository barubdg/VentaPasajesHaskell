{-# LANGUAGE OverloadedStrings #-}

module Reserva.Eliminar where

import qualified Data.Text as T
import Database.SQLite.Simple

eliminarReserva :: Connection -> IO ()
eliminarReserva conn = do
  putStrLn "ID de reserva a eliminar:"
  reservaIdStr <- getLine
  let reservaId :: Int
      reservaId = read reservaIdStr -- Convertir a Int
  execute conn "DELETE FROM Reserva WHERE reserva_id = ?" (Only reservaId)
  putStrLn "Reserva eliminado exitosamente"
