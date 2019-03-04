{-# LANGUAGE DeriveGeneric #-}

module Types where

import           GHC.Generics

import           Data.Aeson
import qualified Data.List    as List
import           Data.Map     (Map)
import qualified Data.Map     as Map
import           Data.Maybe
import           Data.Set     (Set)
import qualified Data.Set     as Set

data Subject
  = Filo
  | CsPoliticas
  deriving (Eq, Ord, Show, Generic)

data Day
  = Monday
  | Tuesday
  | Wednesday
  | Thursday
  | Friday
  | Saturday
  deriving (Eq, Ord, Show, Generic)

type Hour = Int

data TimeInterval = TimeInterval
  { from :: Hour
  , to   :: Hour
  } deriving (Eq, Ord, Show, Generic)

data Schedule = Schedule
  { day      :: Day
  , interval :: TimeInterval
  } deriving (Eq, Ord, Show, Generic)

data Course = Course
  { subject   :: Subject
  , schedules :: ScheduleSet
  } deriving (Eq, Ord, Show, Generic)

type ScheduleSet = Set Schedule

type CourseOffers = Map Subject (Set ScheduleSet)

type Enrollment = [Course]
