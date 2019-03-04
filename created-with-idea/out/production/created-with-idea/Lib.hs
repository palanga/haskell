module Lib where

import           Data.Maybe
import qualified Data.List as List

someFunc :: IO ()
someFunc = putStrLn "someFunc"

(|>) :: a -> (a -> b) -> b
(|>) x f = f x

(||>) :: (a -> b) -> (b -> c) -> a -> c
(||>) f g x = x |> f |> g

(>=>) :: Monad m => (a -> m b) -> (b -> m c) -> a -> m c
(>=>) f g x = f x >>= g

data Subject
  = Filo
  | CsPoliticas
  deriving (Show)

data Day
  = Monday
  | Tuesday
  | Wednesday
  | Thursday
  | Friday
  | Saturday
  deriving (Show)

type Hour = Int

data TimeInterval = TimeInterval
  { from :: Hour
  , to   :: Hour
  } deriving (Show)

{- from inclusive, to exclusive -}
timeIntervalOf :: Hour -> Hour -> Maybe TimeInterval
timeIntervalOf from to
  | isOutOfBounds from || isOutOfBounds to = Nothing
  | isFlipped = Nothing
  | otherwise = Just (TimeInterval from to)
  where
    isOutOfBounds h = h < 7 || 23 < h
    isFlipped = to <= from

data Schedule = Schedule
  { day      :: Day
  , interval :: TimeInterval
  } deriving (Show)

data Course = Course
  { subject   :: Subject
  , schedules :: [Schedule]
  } deriving (Show)

courseOf :: Subject -> [Schedule] -> Maybe Course
courseOf _ [] = Nothing
courseOf subject schedules
  | hasOverlappingSchedules = Nothing
  | otherwise = Just (Course subject schedules)
  where
    hasOverlappingSchedules = False -- TODO

newtype CourseOffers = CourseOffers (Map Subject (Set Schedule)) deriving Show

--courseOffersOf :: [Course] -> CourseOffers
--courseOffersOf courses = courses |> spli |>

