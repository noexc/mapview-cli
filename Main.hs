module Main where

import qualified Brick.Main as M
import Brick.Types
  ( Widget
  , Padding (..)
  )
import Brick.Widgets.Core
  ( (<=>)
  , (<+>)
  , vLimit
  , hBox
  , str
  , padLeft
  , padRight
  )
import qualified Brick.Widgets.Center as C
import qualified Brick.Widgets.Border as B

titleBar :: Widget
titleBar =
  vLimit 1 $ hBox [ padRight Max $ C.vCenter $ str "Mapview 3.0 CLI"
                  , padLeft Max $ C.vCenter $ str "NBP-3"
                  ]

demoData :: Widget
demoData =
  hBox [ padRight Max $
             str "Last packet : Wed Nov 26 07:24:49 UTC 2014"
         <=> str "Altitude    : 1234 meters"
         <=> str "Look angle  : (1234, 4321, 9876)"
         <=> str "Location    : (45.6789000, -65.4321000)"
         <=> str "Temperature : 12°C"
       ]
  <+>
      hBox [ padRight Max $
                 str "GPS time : Wed Nov 26 07:25:01 UTC 2014"
             <=> str "Speed        : 12.3 km/h"
             <=> str "Power        : 4.381v (96%)"
             <=> str "Magnetometer : (123, 456, 789)"
             <=> str "Δ alt.       : 1 meter per second"
           ]

demoLog :: Widget
demoLog =
      str "R1R1R1R1"
  <=> str ":KD8ZRC:40.87204:-82.06390:351.6:183211:717:-215:14:-41.0:"
  <=> str "ZFKQR1R1R1"
  <=> str ":KD8ZRC:40.87204:-82.06390:351.5:183226:721:-214:20:-41.0:"
  <=> str "R1R1R1R1"
  <=> str ":KD8ZRC:40.87204:-82.06389:351.5:183241:720:-216:24:-41.0:"
  <=> str "ZFKQR1R1R1"
  <=> str ":KD8ZRC:40.87202:-82.06389:351.5:183255:720:-214:24:-41.0:"
  <=> str "R1R1R1R1"
  <=> str ":KD8ZRC:40.87201:-82.06389:351.5:183310720:-216:25:-39.0:"
  <=> str "R1R1R1R1"
  <=> str ":KD8ZRC:40.87201:-82.06389:351.4:183325:722:-213:22:-39.0:"
  <=> str "ZR1R1R1R1"
  <=> str ":KD8ZRC:40.87201:-82.06390:351.4:183340:721:-215:22:-39.0:"
  <=> str "R1R1R1R1"
  <=> str ":KD8ZRC:40.87201:-82.06390:351.3:183355:719:-215:24:-39.0:"

ui :: Widget
ui =
    titleBar
    <=> B.hBorder
    <=> demoData
    <=> B.hBorderWithLabel (str "RAW LOG")
    <=> demoLog

main :: IO ()
main = M.simpleMain ui
