import XMonad
import XMonad.Hooks.ICCCMFocus
import XMonad.Hooks.SetWMName

myTerminal = "urxvtc"
myFocusFollowsMouse = False
myBorderWidth = 1
myModMask = mod1Mask
myWorkspaces = map show [1..9]
myNormalBorderColor = "#000000"
myFocusedBorderColor = "#000000"

myManageHook = composeAll
  [ className =? "weka-gui-GUIChooser" --> doFloat
  , className =? "gimp" --> doFloat ]

main = do
     xmonad defaultConfig{
       terminal = myTerminal,
       focusFollowsMouse = myFocusFollowsMouse,
       borderWidth = myBorderWidth,
       modMask = myModMask,
       workspaces = myWorkspaces,
       manageHook = myManageHook,
       normalBorderColor = myNormalBorderColor,
       logHook = takeTopFocus
}
