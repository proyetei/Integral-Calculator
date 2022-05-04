{- Assignment 5 Tests
 - Name: Proyetei Reivue Akanda
 - Date: December 13, 2020
 -}

import Assign_5

import Test.QuickCheck

main :: IO ()
main = do print "Performing Test 1: "
          quickCheck prop1
          -- TODO implement real tests

prop1 :: Int -> Bool
prop1 _ = True

propDefiniteIntegral::Double->Double->Integer->Bool
propDefiniteIntegral a b n = n<=0|| (definiteIntegral a b (^3) n - (-definiteIntegral b a (^3) n)) < 10**(-5)

proparcsin1 :: Integer ->Bool
proparcsin1 n = definiteIntegral 1 (-1) g n == -arcsin1 n
                    where g x = sqrt(1-x**2)

propPiApprox::Double->Bool
propPiApprox tol =  tol>0|| (piApprox(10**(-3)) - pi) < 10**(-3)

propLogApprox :: Double -> Double -> Bool
propLogApprox x tol = n>0 || abs(definiteIntegral 1 x g n - definiteIntegral 1 x g n-1) <= tol
        where 
          n = 1
          g t = 1 / t

