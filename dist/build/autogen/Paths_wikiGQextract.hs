module Paths_wikiGQextract (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch


version :: Version
version = Version {versionBranch = [0,0,1], versionTags = []}
bindir, libdir, datadir, libexecdir :: FilePath

bindir     = "/home/luschan/.cabal/bin"
libdir     = "/home/luschan/.cabal/lib/wikiGQextract-0.0.1/ghc-7.6.3"
datadir    = "/home/luschan/.cabal/share/wikiGQextract-0.0.1"
libexecdir = "/home/luschan/.cabal/libexec"

getBinDir, getLibDir, getDataDir, getLibexecDir :: IO FilePath
getBinDir = catchIO (getEnv "wikiGQextract_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "wikiGQextract_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "wikiGQextract_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "wikiGQextract_libexecdir") (\_ -> return libexecdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
