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
local scale_names = {}
local notes = {}



engine.name = '16Sines'

MusicUtil = require "musicutil"

function init()
  print("loaded 16Sines engine")
  engine.fm_sine_synth1_amp(0)
  engine.fm_sine_synth2_amp(0)
  engine.fm_sine_synth3_amp(0)
  engine.fm_sine_synth4_amp(0)
  engine.fm_sine_synth5_amp(0)
  engine.fm_sine_synth6_amp(0)
  engine.fm_sine_synth7_amp(0)
  engine.fm_sine_synth8_amp(0)
  engine.fm_sine_synth9_amp(0)
  engine.fm_sine_synth10_amp(0)
  engine.fm_sine_synth11_amp(0)
  engine.fm_sine_synth12_amp(0)
  engine.fm_sine_synth13_amp(0)
  engine.fm_sine_synth14_amp(0)
  engine.fm_sine_synth15_amp(0)
  engine.fm_sine_synth16_amp(0)

  add_params()
end

function add_params()
  for i = 1, #MusicUtil.SCALES do
    table.insert(scale_names, string.lower(MusicUtil.SCALES[i].name))
  end
  
  params:add{type = "option", id = "scale_mode", name = "scale mode",
    options = scale_names, default = 5,
    action = function() build_scale() end}
  params:add{type = "number", id = "root_note", name = "root note",
    min = 0, max = 127, default = 60, formatter = function(param) return MusicUtil.note_num_to_name(param:get(), true) end,
    action = function() build_scale() end}
  params:default()
end

function build_scale()
  notes = MusicUtil.generate_scale_of_length(params:get("root_note"), params:get("scale_mode"), 16)
  local num_to_add = 16 - #notes
  for i = 1, num_to_add do
    table.insert(notes, notes[16 - num_to_add])
  end
  --set notes
  for i = 1,16 do
    set_freq(i, MusicUtil.note_num_to_freq(notes[i]))
  end  
end

function set_freq(freq, value)
  if freq == 1 then engine.fm_sine_synth1_freq(value)
  elseif freq == 2 then engine.fm_sine_synth2_freq(value)
  elseif freq == 3 then engine.fm_sine_synth3_freq(value)
  elseif freq == 4 then engine.fm_sine_synth4_freq(value)
  elseif freq == 5 then engine.fm_sine_synth5_freq(value)
  elseif freq == 6 then engine.fm_sine_synth6_freq(value)
  elseif freq == 7 then engine.fm_sine_synth7_freq(value)
  elseif freq == 8 then engine.fm_sine_synth8_freq(value)
  elseif freq == 9 then engine.fm_sine_synth9_freq(value)
  elseif freq == 10 then engine.fm_sine_synth10_freq(value)
  elseif freq == 11 then engine.fm_sine_synth11_freq(value)
  elseif freq == 12 then engine.fm_sine_synth12_freq(value)
  elseif freq == 13 then engine.fm_sine_synth13_freq(value)
  elseif freq == 14 then engine.fm_sine_synth14_freq(value)
  elseif freq == 15 then engine.fm_sine_synth15_freq(value)
  elseif freq == 16 then engine.fm_sine_synth16_freq(value)
  end
end

function set_amp(amp, value)
  if amp == 1 then engine.fm_sine_synth1_amp(value)
  elseif amp == 2 then engine.fm_sine_synth2_amp(value)
  elseif amp == 3 then engine.fm_sine_synth3_amp(value)
  elseif amp == 4 then engine.fm_sine_synth4_amp(value)
  elseif amp == 5 then engine.fm_sine_synth5_amp(value)
  elseif amp == 6 then engine.fm_sine_synth6_amp(value)
  elseif amp == 7 then engine.fm_sine_synth7_amp(value)
  elseif amp == 8 then engine.fm_sine_synth8_amp(value)
  elseif amp == 9 then engine.fm_sine_synth9_amp(value)
  elseif amp == 10 then engine.fm_sine_synth10_amp(value)
  elseif amp == 11 then engine.fm_sine_synth11_amp(value)
  elseif amp == 12 then engine.fm_sine_synth12_amp(value)
  elseif amp == 13 then engine.fm_sine_synth13_amp(value)
  elseif amp == 14 then engine.fm_sine_synth14_amp(value)
  elseif amp == 15 then engine.fm_sine_synth15_amp(value)
  elseif amp == 16 then engine.fm_sine_synth16_amp(value)
  end
end

function set_amp_from_cc(amp, value)
  if amp == 32 then engine.fm_sine_synth1_amp(value)
  elseif amp == 33 then engine.fm_sine_synth2_amp(value)
  elseif amp == 34 then engine.fm_sine_synth3_amp(value)
  elseif amp == 35 then engine.fm_sine_synth4_amp(value)
  elseif amp == 36 then engine.fm_sine_synth5_amp(value)
  elseif amp == 37 then engine.fm_sine_synth6_amp(value)
  elseif amp == 38 then engine.fm_sine_synth7_amp(value)
  elseif amp == 39 then engine.fm_sine_synth8_amp(value)
  elseif amp == 40 then engine.fm_sine_synth9_amp(value)
  elseif amp == 41 then engine.fm_sine_synth10_amp(value)
  elseif amp == 42 then engine.fm_sine_synth11_amp(value)
  elseif amp == 43 then engine.fm_sine_synth12_amp(value)
  elseif amp == 44 then engine.fm_sine_synth13_amp(value)
  elseif amp == 45 then engine.fm_sine_synth14_amp(value)
  elseif amp == 46 then engine.fm_sine_synth15_amp(value)
  elseif amp == 47 then engine.fm_sine_synth16_amp(value)
  end
end

function map_cc_to_slider(cc_num)
  if cc_num == 32 then cc_num = 0
  elseif cc_num == 33 then cc_num = 1
  elseif cc_num == 34 then cc_num = 2
  elseif cc_num == 35 then cc_num = 3
  elseif cc_num == 36 then cc_num = 4
  elseif cc_num == 37 then cc_num = 5
  elseif cc_num == 38 then cc_num = 6
  elseif cc_num == 39 then cc_num = 7
  elseif cc_num == 40 then cc_num = 8
  elseif cc_num == 41 then cc_num = 9
  elseif cc_num == 42 then cc_num = 10
  elseif cc_num == 43 then cc_num = 11
  elseif cc_num == 44 then cc_num = 12
  elseif cc_num == 45 then cc_num = 13
  elseif cc_num == 46 then cc_num = 14
  elseif cc_num == 47 then cc_num = 15
  end
  return cc_num
end



m = midi.connect()
m.event = function(data)
  local d = midi.to_msg(data)
  if d.type == "cc" then
    --clamp the cc value to acceptable range for engine sinOsc
    cc_val = util.clamp((d.val/127), 0.0, 1.0)
    set_amp_from_cc(d.cc, cc_val)
    --edit is the current slider
    edit = map_cc_to_slider(d.cc)
    --clamp cc_val value to set GUI slider
    sliders[edit+1] = util.clamp(d.val, 0.0, 32.0)
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
    --accum wraps around 0-15
    accum = (accum + delta) % 16
    --edit is the slider number
    edit = accum
  elseif n == 3 then
    sliders[edit+1] = sliders[edit+1] + delta
    amp_value = util.clamp(((sliders[edit+1] + delta) * .026), 0.0, 1.0)
    set_amp(edit+1, amp_value)
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
