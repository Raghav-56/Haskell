{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
#if __GLASGOW_HASKELL__ >= 810
{-# OPTIONS_GHC -Wno-prepositive-qualified-module #-}
#endif
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_myapp (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where


import qualified Control.Exception as Exception
import qualified Data.List as List
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

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir `joinFileName` name)

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath




bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath
bindir     = "/home/raghav/.cabal/bin"
libdir     = "/home/raghav/.cabal/lib/x86_64-linux-ghc-9.4.8/myapp-0.1.0.0-inplace-myapp"
dynlibdir  = "/home/raghav/.cabal/lib/x86_64-linux-ghc-9.4.8"
datadir    = "/home/raghav/.cabal/share/x86_64-linux-ghc-9.4.8/myapp-0.1.0.0"
libexecdir = "/home/raghav/.cabal/libexec/x86_64-linux-ghc-9.4.8/myapp-0.1.0.0"
sysconfdir = "/home/raghav/.cabal/etc"

getBinDir     = catchIO (getEnv "myapp_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "myapp_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "myapp_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "myapp_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "myapp_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "myapp_sysconfdir") (\_ -> return sysconfdir)



joinFileName :: String -> String -> FilePath
joinFileName ""  fname = fname
joinFileName "." fname = fname
joinFileName dir ""    = dir
joinFileName dir fname
  | isPathSeparator (List.last dir) = dir ++ fname
  | otherwise                       = dir ++ pathSeparator : fname

pathSeparator :: Char
pathSeparator = '/'

isPathSeparator :: Char -> Bool
isPathSeparator c = c == '/'
