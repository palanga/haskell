module Ops where

(|>) :: a -> (a -> b) -> b
(|>) x f = f x

(||>) :: (a -> b) -> (b -> c) -> a -> c
(||>) f g x = x |> f |> g

(>=>) :: Monad m => (a -> m b) -> (b -> m c) -> a -> m c
(>=>) f g x = f x >>= g
