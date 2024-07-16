module Conexion (conectar) where

import Database.SQLite.Simple

conectar :: FilePath -> IO Connection
conectar dbFile = open dbFile
