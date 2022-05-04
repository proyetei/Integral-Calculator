module Main where

import ClassList (allKnownMacIDs)
import Assign_5 (macid
                ,definiteIntegral
                ,arcsin1
                ,piApprox
                ,logApprox)

main :: IO ()
main = if macid `elem` allKnownMacIDs
          then putStrLn "Compiled 1JC3-Assign5 successfully"
          else putStrLn "ERROR! Your Mac ID is not in the list of known Mac ID's"
