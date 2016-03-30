import System.Directory (doesDirectoryExist, getHomeDirectory)
import XMonad hiding (focus)
import XMonad.StackSet
import XMonad.Util.EZConfig
import Data.Char (toLower)

main = xmonad $ defaultConfig
    { 
      focusFollowsMouse = False
    , normalBorderColor = "#000000"
    , modMask = mod1Mask
    }
    `additionalKeysP`
    [("M-S-<Return>", spawnWithMaybeFocusedTerminal )]
     where returnPath home = replaceTilda . safeTail . takeFrom ':'
             where replaceTilda []     = []
                   replaceTilda p@(x:xs) | x == '~'  = home ++ xs
                                         | otherwise = p    
           safeTail xs = if null xs then xs else tail xs
           takeFrom c = dropWhile (not . (c ==))
           lowerCaseClassName = map toLower <$> className
           spawnSpecialTerminalIf b f | b         = f
                                      | otherwise = io $ spawn terminal
           spawnWithMaybeFocusedTerminal = do
                  mw <- withWindowSet $ return . peek
                  case mw of
                    Just pid  -> flip runQuery pid $ do
                                   isTerminal <- lowerCaseClassName =? terminalName
                                   spawnSpecialTerminalIf isTerminal $ do
                                      home <- io getHomeDirectory
                                      let path = returnPath home <$> title
                                      isDirectory <- path >>= io . doesDirectoryExist
                                      spawnSpecialTerminalIf isDirectory $ path >>= io . spawn . terminalCd
                    Nothing   -> spawn terminal
           terminal = terminalName ++ terminalOptions
           terminalCd dir = terminal ++ " -cd '" ++ dir ++ "'"
           terminalName = "urxvt"
           terminalOptions = "c" -- c stands for demon/client arhitecture
