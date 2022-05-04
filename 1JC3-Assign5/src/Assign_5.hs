{- Assignment 5
 - Name: Proyetei Reivue Akanda
 - Date: December 13, 2020
 -}
module Assign_5 where

macid :: String
macid = "akandap"


{- -----------------------------------------------------------------
 - definiteIntegral
 - -----------------------------------------------------------------
 - Description: Computes an approximation to the definite integral using the trapezoidal
   rule with n partitions and using g to represent the function. 
 -}

definiteIntegral :: Double -> Double -> (Double -> Double) -> Integer -> Double
definiteIntegral a b g n |n<=0=0
                         |otherwise = delta *((g a + g b)/2 + sum [g(a + fromIntegral k * delta) | k<-[1..n-1]])
                              where 
                                delta =(b-a)/fromIntegral n

{- -----------------------------------------------------------------
 - arcsin1
 - -----------------------------------------------------------------
 - Description: Computes the definite integral of sqrt(1-x^2) using the definiteIntegral function with n partitions.
 -}

arcDeriv::Double -> Double
arcDeriv x = sqrt(1-x**2)
arcsin1 :: Integer -> Double
arcsin1 n |n>0= definiteIntegral (-1) (1) (arcDeriv) n
          |otherwise = 0

{- -----------------------------------------------------------------
 - piApprox
 - -----------------------------------------------------------------
 - Description: Uses arcsin1 to approximate pi where piApprox tol returns a value pi' such that |pi'-pi|<=tol
 -}

piApprox :: Double -> Double
piApprox  tol | tol<0 = error "undefined"
              |otherwise =checkVal tol n
          where
            checkVal tol n=
              if abs(pi'-pi)<=tol
                then 2*arcsin1 n
              else  checkVal tol (n+1)
                    where pi'=2*arcsin1 n
            n = 1

{- -----------------------------------------------------------------
 - logApprox
 - -----------------------------------------------------------------
 - Description: The function logApprox x tol approximates the value of log x by exploiting its definition as a definite integral.
 -}

logApprox :: Double -> Double -> Double
logApprox x tol   | x<=0 = error "undefined"
                  | otherwise =
                      logChecker x tol y 
                          where
                              logChecker x tol y
                                  |abs (definiteIntegral 1 x recip y - definiteIntegral 1 x recip(y-1)) <= tol 
                                   = definiteIntegral 1 x (recip) (y-1)
                                  |otherwise = logChecker x tol (y+1)
                              y=1


{-
----------------------------------------------- TEST CASES ---------------------------------------------------------
Function: definiteIntegral
definiteIntegral (-1) 1 (\x->x^^(-10) + 4*x^^(-6)) 100
Test Case Number: 1
Input: definiteIntegral (-1) 1 (\x->x^10 + 4*x^6) 100
Expected Output: 1.324675324675325
Actual Output: 1.326941458148823

Test Case Number:2
Input: definiteIntegral (-1) 1 (\x -> 6*x^2 - 5*x + 2) 50
Expected Output: 8
Actual Output: 8.003200000000001

Test Case Number: 3
Input: definiteIntegral: definiteIntegral 0 2 (\x -> x^2 + 1) 100 
Expected Output: 4.66666666666667
Actual Output: 4.6668
----------------------------------------------------------------------------------------------------------------------
Function: arcsin1

Test Case Number: 1
Input: arcsin1 100
Expected Output: 1.57079632679
Actual Output: 1.5691342555492498

Test Case Number: 2
Input: arcsin1 0
Expected Output: 0.0
Actual Output: 0.0

Test Case Number: 3
Input: arcsin1 (-55)
Expected Output: 0.0
Actual Output: 0.0
-----------------------------------------------------------------------------------------------------------------------
Function: piApprox

Test Case Number: 1
Input: piApprox (-2)
Expected Output: undefined
Actual Output: undefined

Test Case Number: 2
Input: piApprox 0.00001
Expected Output: 3.141592653589793 (actual value of pi)
Actual Output: 3.1415826549115744

Test Case Number: 3
Input: piApprox 7
Expected Output: 0.0
Actual Output: 0.0
-----------------------------------------------------------------------------------------------------------------------
Function: logApprox

Test Case Number: 1
Input: logApprox (-9) 0.001
Expected Output: undefined
Actual Output: undefined

Test Case Number: 2 
Input: logApprox 10 0.0001
Expected Output: 2.302585093
Actual Output: 2.3051463322890733

Test Case Number: 3
Input: logApprox (80) 0.01
Expected Output: 4.382026635
Actual Output: 4.625013899525665
-----------------------------------------------------------------------------------------------------------------------

-------------------------------------------  QUICKCHECK TEST CASES  ---------------------------------------------------
Function: definiteIntegral
Property: n<=0|| (definiteIntegral a b (^3) n - (-definiteIntegral b a (^3) n)) < 10**(-5)
Actual Test Result: Pass

Function: arcsin1
Property: definiteIntegral 1 (-1) g n == -arcsin1 n
                    where g x = sqrt(1-x**2)
Actual Test Result: Pass

Function: piApprox
Property: tol>0|| (piApprox(10**(-3)) - pi) < 10**(-3)
Actual Test Result: Pass

Function: logApprox
Property:  n>0 || abs(definiteIntegral 1 x g n - definiteIntegral 1 x g n-1) <= tol
        where 
          n = 1
          g t = 1 / t
Actual Test Result: Pass
------------------------------------------------------------------------------------------------------------------------
-}