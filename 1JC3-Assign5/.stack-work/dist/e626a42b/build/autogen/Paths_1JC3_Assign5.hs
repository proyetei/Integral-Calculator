{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_1JC3_Assign5 (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Users\\Proyetei\\Documents\\1JC3-Assign5\\.stack-work\\install\\81509be8\\bin"
libdir     = "C:\\Users\\Proyetei\\Documents\\1JC3-Assign5\\.stack-work\\install\\81509be8\\lib\\x86_64-windows-ghc-8.6.5\\1JC3-Assign5-0.1.0.0-8YulXGNO3JV92z2qc0wAyM"
dynlibdir  = "C:\\Users\\Proyetei\\Documents\\1JC3-Assign5\\.stack-work\\install\\81509be8\\lib\\x86_64-windows-ghc-8.6.5"
datadir    = "C:\\Users\\Proyetei\\Documents\\1JC3-Assign5\\.stack-work\\install\\81509be8\\share\\x86_64-windows-ghc-8.6.5\\1JC3-Assign5-0.1.0.0"
libexecdir = "C:\\Users\\Proyetei\\Documents\\1JC3-Assign5\\.stack-work\\install\\81509be8\\libexec\\x86_64-windows-ghc-8.6.5\\1JC3-Assign5-0.1.0.0"
sysconfdir = "C:\\Users\\Proyetei\\Documents\\1JC3-Assign5\\.stack-work\\install\\81509be8\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "1JC3_Assign5_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "1JC3_Assign5_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "1JC3_Assign5_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "1JC3_Assign5_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "1JC3_Assign5_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "1JC3_Assign5_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
