import Control.Monad
import System.IO

import PowerMate

updateLed :: Handle -> Int -> Int -> IO ()
updateLed h speed mode = writeStatus h status
  where status = statusInit
                 { brightness = 255
                 , pulse_speed = speed
                 , pulse_mode = mode
                 , pulse_awake = True
                 }

handleEvent :: Handle -> Maybe Event -> Int -> Int -> IO (Int, Int)
handleEvent h (Just (Button True)) speed mode = do
  let mode' = (mode + 1) `mod` 3
  putStrLn $ "mode " ++ show mode'
  updateLed h speed mode'
  return (speed, mode')
handleEvent h (Just (Rotate r)) speed mode = do
  let speed' = max 0 $ min 510 $ speed + r
  putStrLn $ "speed " ++ show speed'
  updateLed h speed' mode
  return (speed', mode)
handleEvent _ _ speed mode = return (speed, mode)

loop :: Handle -> Int -> Int -> IO ()
loop h speed mode = do
  e <- readEvent h
  (speed', mode') <- handleEvent h e speed mode
  loop h speed' mode'

main' :: Maybe FilePath -> IO ()
main' Nothing = putStrLn "No PowerMate found!"
main' (Just dev) = do
  h <- openDevice dev
  loop h 255 0

main = searchForDevice >>= main'