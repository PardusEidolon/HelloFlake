{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_sproj (
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

bindir     = "/Users/jobrien/Downloads/sproj/.stack-work/install/x86_64-osx/460e08385b2fdb8dcaf247ae8233d465e08466df994caf63ac0a377699c43318/8.10.7/bin"
libdir     = "/Users/jobrien/Downloads/sproj/.stack-work/install/x86_64-osx/460e08385b2fdb8dcaf247ae8233d465e08466df994caf63ac0a377699c43318/8.10.7/lib/x86_64-osx-ghc-8.10.7/sproj-0.1.0.0-2O8BRFdPJn6Hc1bt9NRp2Z-sproj"
dynlibdir  = "/Users/jobrien/Downloads/sproj/.stack-work/install/x86_64-osx/460e08385b2fdb8dcaf247ae8233d465e08466df994caf63ac0a377699c43318/8.10.7/lib/x86_64-osx-ghc-8.10.7"
datadir    = "/Users/jobrien/Downloads/sproj/.stack-work/install/x86_64-osx/460e08385b2fdb8dcaf247ae8233d465e08466df994caf63ac0a377699c43318/8.10.7/share/x86_64-osx-ghc-8.10.7/sproj-0.1.0.0"
libexecdir = "/Users/jobrien/Downloads/sproj/.stack-work/install/x86_64-osx/460e08385b2fdb8dcaf247ae8233d465e08466df994caf63ac0a377699c43318/8.10.7/libexec/x86_64-osx-ghc-8.10.7/sproj-0.1.0.0"
sysconfdir = "/Users/jobrien/Downloads/sproj/.stack-work/install/x86_64-osx/460e08385b2fdb8dcaf247ae8233d465e08466df994caf63ac0a377699c43318/8.10.7/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "sproj_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "sproj_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "sproj_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "sproj_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "sproj_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "sproj_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
