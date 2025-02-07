module Main where

import System.Random

single :: (RandomGen g) => g -> (Float, g)
single = go 0.0 0.0
  where
    go iters total g
        | total < 1.0 = let (x, g') = uniformR @Float (0.0, 1.0) g in go (1 + iters) (total + x) g'
        | otherwise = (iters, g)

many :: (RandomGen g) => Int -> g -> Float
many n = go 0 0.0
  where
    go i x g
        | i < n = let (y, g') = single g in go (succ i) (x + y) g'
        | otherwise = x / fromIntegral n

main :: IO ()
main = print . many 1_000_000 $ mkStdGen 1729
