{-# LANGUAGE NamedFieldPuns #-}

module Builder where

import           Data.List as List
import qualified Data.Map  as Map
import           Data.Set  as Set

import           Ops
import           Types

{- from inclusive, to exclusive -}
maybeTimeIntervalOf :: Hour -> Hour -> Maybe TimeInterval
maybeTimeIntervalOf from to
  | isOutOfBounds from || isOutOfBounds to = Nothing
  | isFlipped = Nothing
  | otherwise = Just $ TimeInterval from to
  where
    isOutOfBounds h = h < 7 || 23 < h
    isFlipped = to <= from

maybeCourseOf :: Subject -> [Schedule] -> Maybe Course
maybeCourseOf _ [] = Nothing
maybeCourseOf subject schedules
  | hasOverlappingSchedules = Nothing
  | otherwise = Just $ Course subject $ Set.fromList schedules
  where
    hasOverlappingSchedules = List.any (uncurry overlaps) combinations
    combinations = [(x, y) | (x:rest) <- List.tails schedules, y <- rest]

sOverlaps :: ScheduleSet -> ScheduleSet -> Bool
sOverlaps as bs = List.any (uncurry overlaps) combinations
  where
    combinations = [(x, y) | x <- xs, y <- ys]
    xs = Set.toList as
    ys = Set.toList bs

overlaps :: Schedule -> Schedule -> Bool
overlaps a b
  | isDifferentDay = False
  | otherwise = interval a `tOverlaps` interval b
  where
    isDifferentDay = day a /= day b

tOverlaps :: TimeInterval -> TimeInterval -> Bool
tOverlaps a b
  | bothStartAtSameTime = True
  | aIsBefore = to a > from b
  | otherwise = to b > from a
  where
    bothStartAtSameTime = from a == from b
    aIsBefore = from a < from b

maybeEnrollmentOf :: [Course] -> Enrollment
maybeEnrollmentOf courses = courses -- TODO

courseOffersOf :: [Course] -> CourseOffers
courseOffersOf = toMap . tupled
  where
    tupled = fmap $ \c -> (subject c, Set.fromList [schedules c])
    toMap = Map.fromListWith Set.union

buildPossibilities :: CourseOffers -> [Enrollment]
buildPossibilities cos = undefined


