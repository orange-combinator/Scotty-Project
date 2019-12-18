{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_neatup (
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

bindir     = "/Users/johnlonganecker/projects/neatup/.stack-work/install/x86_64-osx/096c66c5896545ce618e530a97579bb5be2ee32310a011304c402791cb4051ce/8.6.5/bin"
libdir     = "/Users/johnlonganecker/projects/neatup/.stack-work/install/x86_64-osx/096c66c5896545ce618e530a97579bb5be2ee32310a011304c402791cb4051ce/8.6.5/lib/x86_64-osx-ghc-8.6.5/neatup-0.1.0.0-H6UM67AzJEkCo1A9Dtm2Kx-neatup"
dynlibdir  = "/Users/johnlonganecker/projects/neatup/.stack-work/install/x86_64-osx/096c66c5896545ce618e530a97579bb5be2ee32310a011304c402791cb4051ce/8.6.5/lib/x86_64-osx-ghc-8.6.5"
datadir    = "/Users/johnlonganecker/projects/neatup/.stack-work/install/x86_64-osx/096c66c5896545ce618e530a97579bb5be2ee32310a011304c402791cb4051ce/8.6.5/share/x86_64-osx-ghc-8.6.5/neatup-0.1.0.0"
libexecdir = "/Users/johnlonganecker/projects/neatup/.stack-work/install/x86_64-osx/096c66c5896545ce618e530a97579bb5be2ee32310a011304c402791cb4051ce/8.6.5/libexec/x86_64-osx-ghc-8.6.5/neatup-0.1.0.0"
sysconfdir = "/Users/johnlonganecker/projects/neatup/.stack-work/install/x86_64-osx/096c66c5896545ce618e530a97579bb5be2ee32310a011304c402791cb4051ce/8.6.5/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "neatup_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "neatup_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "neatup_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "neatup_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "neatup_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "neatup_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
