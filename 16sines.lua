--- ~ 16Sines v0.1 ~
-- @oootini October 2020
-- 16 harmonically related sines
-- enc 2 = select step
-- enc 3 = tune step
-- key 2 = grab pitch
-- key 3 = mutate

local sliders = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
local edit = 1
local accum = 1
local cc_accum = 1
local step = 0
local master_freq = 220

engine.name = '16Sines'

function init()
  print("loaded 16Sines engine")
  engine.amp1(0)
  engine.amp2(0)
  engine.amp3(0)
  engine.amp4(0)
  engine.amp5(0)
  engine.amp6(0)
  engine.amp7(0)
  engine.amp8(0)
  engine.amp9(0)
  engine.amp10(0)
  engine.amp11(0)
  engine.amp12(0)
  engine.amp13(0)
  engine.amp14(0)
  engine.amp15(0)
  engine.amp16(0)
end

function set_freq(freq, value)
  if freq == 1 then engine.freq1(value)
  elseif freq == 2 then engine.freq2(value)
  elseif freq == 3 then engine.freq3(value)
  elseif freq == 4 then engine.freq4(value)
  elseif freq == 5 then engine.freq5(value)
  elseif freq == 6 then engine.freq6(value)
  elseif freq == 7 then engine.freq7(value)
  elseif freq == 8 then engine.freq8(value)
  elseif freq == 9 then engine.freq9(value)
  elseif freq == 10 then engine.freq10(value)
  elseif freq == 11 then engine.freq11(value)
  elseif freq == 12 then engine.freq12(value)
  elseif freq == 13 then engine.freq13(value)
  elseif freq == 14 then engine.freq14(value)
  elseif freq == 15 then engine.freq15(value)
  elseif freq == 16 then engine.freq16(value) 
  end
end

function set_amp(amp, value)
  if amp == 1 then engine.amp1(value)
  elseif amp == 2 then engine.amp2(value)
  elseif amp == 3 then engine.amp3(value)
  elseif amp == 4 then engine.amp4(value)
  elseif amp == 5 then engine.amp5(value)
  elseif amp == 6 then engine.amp6(value)
  elseif amp == 7 then engine.amp7(value)
  elseif amp == 8 then engine.amp8(value)
  elseif amp == 9 then engine.amp9(value)
  elseif amp == 10 then engine.amp10(value)
  elseif amp == 11 then engine.amp11(value)
  elseif amp == 12 then engine.amp12(value)
  elseif amp == 13 then engine.amp13(value)
  elseif amp == 14 then engine.amp14(value)
  elseif amp == 15 then engine.amp15(value)
  elseif amp == 16 then engine.amp16(value)
  end
end

function set_amp_from_cc(amp, value)
  if amp == 32 then engine.amp1(value)
  elseif amp == 33 then engine.amp2(value)
  elseif amp == 34 then engine.amp3(value)
  elseif amp == 35 then engine.amp4(value)
  elseif amp == 36 then engine.amp5(value)
  elseif amp == 37 then engine.amp6(value)
  elseif amp == 38 then engine.amp7(value)
  elseif amp == 39 then engine.amp8(value)
  elseif amp == 40 then engine.amp9(value)
  elseif amp == 41 then engine.amp10(value)
  elseif amp == 42 then engine.amp11(value)
  elseif amp == 43 then engine.amp12(value)
  elseif amp == 44 then engine.amp13(value)
  elseif amp == 45 then engine.amp14(value)
  elseif amp == 46 then engine.amp15(value)
  elseif amp == 47 then engine.amp16(value)
  end
end

function map_cc_to_slider(cc_num)
  if cc_num == 32 then cc_num = 1
  elseif cc_num == 33 then cc_num = 2
  elseif cc_num == 34 then cc_num = 3
  elseif cc_num == 35 then cc_num = 4
  elseif cc_num == 36 then cc_num = 5
  elseif cc_num == 37 then cc_num = 6
  elseif cc_num == 38 then cc_num = 7
  elseif cc_num == 39 then cc_num = 8
  elseif cc_num == 40 then cc_num = 9
  elseif cc_num == 41 then cc_num = 10
  elseif cc_num == 42 then cc_num = 11
  elseif cc_num == 43 then cc_num = 12
  elseif cc_num == 44 then cc_num = 13
  elseif cc_num == 45 then cc_num = 14
  elseif cc_num == 46 then cc_num = 15
  elseif cc_num == 47 then cc_num = 16
  end
  return cc_num
end



m = midi.connect()
m.event = function(data)
  local d = midi.to_msg(data)
  if d.type == "cc" then
    --clamp the cc value to acceptable range for engine sinOsc
    cc_val = util.clamp((d.val/127), 0.0, 1.0)
    --clamp to a slightly different range to control GUI sliders
    set_amp_from_cc(d.cc, cc_val)
    --what is accum?
    cc_accum = (cc_accum + cc_val) % 16
    edit = cc_accum
    --edit is the current slider
    edit = map_cc_to_slider(d.cc) - 1
    sliders[edit+1] = sliders[edit+1] + cc_val
    if sliders[edit+1] > 32 then sliders[edit+1] = 32 end
    if sliders[edit+1] < 0 then sliders[edit+1] = 0 end
  end
  redraw()
end

function enc(n, delta)
  if n == 1 then
    --do something
    mix:delta("output", delta)
  elseif n == 2 then
    accum = (accum + delta) % 16
    --edit is the slider number
    edit = accum
  elseif n == 3 then
    sliders[edit+1] = sliders[edit+1] + delta
    --print (delta)
    amp_value = util.clamp(((sliders[edit+1] + delta) * .01), 0.0, 1.0)
    set_amp(edit, amp_value)
    if sliders[edit+1] > 32 then sliders[edit+1] = 32 end
    if sliders[edit+1] < 0 then sliders[edit+1] = 0 end
  end
  redraw()
end

function key(n, z)
  if n == 2 and z == 1 then
    sliders[1] = math.floor(math.random()*4)
    for i=2, 16 do
      sliders[i] = sliders[i-1]+math.floor(math.random()*9)-3
    end
    redraw()
  elseif n == 3 and z == 1 then
    for i=1, 16 do
      sliders[i] = sliders[i]+math.floor(math.random()*5)-2
    end
    redraw()
  end
end

function redraw()
  screen.aa(1)
  screen.line_width(2.0)
  screen.clear()

  for i=0, 15 do
    if i == edit then
      screen.level(15)
    else
      screen.level(2)
    end
    screen.move(32+i*4, 48)
    screen.line(32+i*4, 46-sliders[i+1])
    screen.stroke()
  end

  screen.level(10)
  screen.line(32+step*4, 54)
  screen.stroke()

  screen.update()
end
