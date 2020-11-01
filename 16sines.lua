--- ~ 16Sines v0.1 ~
-- @oootini October 2020
-- 16 harmonically related sines
-- enc 2 = select step
-- enc 3 = tune step
-- key 2 = grab pitch
-- key 3 = mutate

local sliders = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
local freq_sliders = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
local index_sliders = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
local current_freq = 0
local current_index = 0
local edit = 1
local accum = 1
local cc_index = 3
local cc_accum = 1
local step = 0
local scale_names = {}
local notes = {}
local key_2_pressed = 0
local key_3_pressed = 0

engine.name = "16Sines"
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

function set_fm_index(synth_num, value)
    --set index between 0-24 for pleasant sounds, and update the current_index
  if synth_num == 1 then 
    engine.fm_sine_synth1_index(value)
    current_index = value
  elseif synth_num == 2 then
    engine.fm_sine_synth2_index(value)
    current_index = value
  elseif synth_num == 3 then 
    engine.fm_sine_synth3_index(value)
    current_index = value
  elseif synth_num == 4 then 
    engine.fm_sine_synth4_index(value)
    current_index = value
  elseif synth_num == 5 then 
    engine.fm_sine_synth5_index(value)
    current_index = value
  elseif synth_num == 6 then 
    engine.fm_sine_synth6_index(value)
    current_index = value
  elseif synth_num == 7 then 
    engine.fm_sine_synth7_index(value)
    current_index = value
  elseif synth_num == 8 then 
    engine.fm_sine_synth8_index(value)
    current_index = value
  elseif synth_num == 9 then 
    engine.fm_sine_synth9_index(value)
    current_index = value
  elseif synth_num == 10 then 
    engine.fm_sine_synth10_index(value)
    current_index = value
  elseif synth_num == 11 then 
    engine.fm_sine_synth11_index(value)
    current_index = value
  elseif synth_num == 12 then 
    engine.fm_sine_synth12_index(value)
    current_index = value
  elseif synth_num == 13 then 
    engine.fm_sine_synth13_index(value)
    current_index = value
  elseif synth_num == 14 then 
    engine.fm_sine_synth14_index(value)
    current_index = value
  elseif synth_num == 15 then 
    engine.fm_sine_synth15_index(value)
    current_index = value
  elseif synth_num == 16 then 
    engine.fm_sine_synth16_index(value)
    current_index = value
  end
end

function set_freq(synth_num, value)
  if synth_num == 1 then engine.fm_sine_synth1_freq(value)
  elseif synth_num == 2 then 
    engine.fm_sine_synth2_freq(value)
    current_freq = value
  elseif synth_num == 3 then 
    engine.fm_sine_synth3_freq(value)
    current_freq = value
  elseif synth_num == 4 then 
    engine.fm_sine_synth4_freq(value)
    current_freq = value
  elseif synth_num == 5 then 
    engine.fm_sine_synth5_freq(value)
    current_freq = value
  elseif synth_num == 6 then 
    engine.fm_sine_synth6_freq(value)
    current_freq = value
  elseif synth_num == 7 then 
    engine.fm_sine_synth7_freq(value)
    current_freq = value
  elseif synth_num == 8 then 
    engine.fm_sine_synth8_freq(value)
    current_freq = value
  elseif synth_num == 9 then 
    engine.fm_sine_synth9_freq(value)
    current_freq = value
  elseif synth_num == 10 then 
    engine.fm_sine_synth10_freq(value)
    current_freq = value
  elseif synth_num == 11 then 
    engine.fm_sine_synth11_freq(value)
    current_freq = value
  elseif synth_num == 12 then 
    engine.fm_sine_synth12_freq(value)
    current_freq = value
  elseif synth_num == 13 then 
    engine.fm_sine_synth13_freq(value)
    current_freq = value
  elseif synth_num == 14 then 
    engine.fm_sine_synth14_freq(value)
    current_freq = value
  elseif synth_num == 15 then 
    engine.fm_sine_synth15_freq(value)
    current_freq = value
  elseif synth_num == 16 then 
    engine.fm_sine_synth16_freq(value)
    current_freq = value
  end
end

function set_amp(synth_num, value)
  if synth_num == 1 then engine.fm_sine_synth1_amp(value)
  elseif synth_num == 2 then engine.fm_sine_synth2_amp(value)
  elseif synth_num == 3 then engine.fm_sine_synth3_amp(value)
  elseif synth_num == 4 then engine.fm_sine_synth4_amp(value)
  elseif synth_num == 5 then engine.fm_sine_synth5_amp(value)
  elseif synth_num == 6 then engine.fm_sine_synth6_amp(value)
  elseif synth_num == 7 then engine.fm_sine_synth7_amp(value)
  elseif synth_num == 8 then engine.fm_sine_synth8_amp(value)
  elseif synth_num == 9 then engine.fm_sine_synth9_amp(value)
  elseif synth_num == 10 then engine.fm_sine_synth10_amp(value)
  elseif synth_num == 11 then engine.fm_sine_synth11_amp(value)
  elseif synth_num == 12 then engine.fm_sine_synth12_amp(value)
  elseif synth_num == 13 then engine.fm_sine_synth13_amp(value)
  elseif synth_num == 14 then engine.fm_sine_synth14_amp(value)
  elseif synth_num == 15 then engine.fm_sine_synth15_amp(value)
  elseif synth_num == 16 then engine.fm_sine_synth16_amp(value)
  end
end

function set_amp_from_cc(cc_num, value)
  if cc_num == 32 then engine.fm_sine_synth1_amp(value)
  elseif cc_num == 33 then engine.fm_sine_synth2_amp(value)
  elseif cc_num == 34 then engine.fm_sine_synth3_amp(value)
  elseif cc_num == 35 then engine.fm_sine_synth4_amp(value)
  elseif cc_num == 36 then engine.fm_sine_synth5_amp(value)
  elseif cc_num == 37 then engine.fm_sine_synth6_amp(value)
  elseif cc_num == 38 then engine.fm_sine_synth7_amp(value)
  elseif cc_num == 39 then engine.fm_sine_synth8_amp(value)
  elseif cc_num == 40 then engine.fm_sine_synth9_amp(value)
  elseif cc_num == 41 then engine.fm_sine_synth10_amp(value)
  elseif cc_num == 42 then engine.fm_sine_synth11_amp(value)
  elseif cc_num == 43 then engine.fm_sine_synth12_amp(value)
  elseif cc_num == 44 then engine.fm_sine_synth13_amp(value)
  elseif cc_num == 45 then engine.fm_sine_synth14_amp(value)
  elseif cc_num == 46 then engine.fm_sine_synth15_amp(value)
  elseif cc_num == 47 then engine.fm_sine_synth16_amp(value)
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
    --also set current_freq and current_index to be displayed
    current_freq = notes[edit+1]
    current_index = index_sliders[edit+1]
    --clamp cc_val value to set gui slider
    sliders[edit+1] = util.clamp(d.val, 0.0, 32.0)
    if sliders[edit+1] > 32 then sliders[edit+1] = 32 end
    if sliders[edit+1] < 0 then sliders[edit+1] = 0 end
  end
  redraw()
end

function keys_down()
  if key_2_pressed == 1 and key_3_pressed == 1 then
    print ("key 2 and 3 were pressed together...")
    --use this to read freq from norns input...?
  end
end


function enc(n, delta)
  if n == 1 then
    mix:delta("output", delta)
  elseif n == 2 then
    if key_2_pressed == 0 and key_3_pressed == 0 then 
      --accum wraps around 0-15
      accum = (accum + delta) % 16
      --edit is the slider number
      edit = accum
    elseif key_2_pressed == 1 and key_3_pressed == 0 then
      -- set the freq_slider value
      freq_sliders[edit+1] = freq_sliders[edit+1] + delta
      if freq_sliders[edit+1] > 2 then freq_sliders[edit+1] = 2 end
      if freq_sliders[edit+1] < -2 then freq_sliders[edit+1] = -2 end
      --set octave based on freq_slider
      if freq_sliders[edit+1] == -2 then
        set_freq(edit+1, MusicUtil.note_num_to_freq(notes[edit+1])/4)
        current_freq = notes[edit+1]/4
      elseif freq_sliders[edit+1] == -1 then
        set_freq(edit+1, MusicUtil.note_num_to_freq(notes[edit+1])/2)
        current_freq = notes[edit+1]/2
      elseif freq_sliders[edit+1] == 0 then
        set_freq(edit+1, MusicUtil.note_num_to_freq(notes[edit+1]))
        current_freq = notes[edit+1]
      elseif freq_sliders[edit+1] == 1 then
        set_freq(edit+1, MusicUtil.note_num_to_freq(notes[edit+1])*2)
        current_freq = notes[edit+1]*2
      elseif freq_sliders[edit+1] == 2 then
        set_freq(edit+1, MusicUtil.note_num_to_freq(notes[edit+1])*4)
        current_freq = notes[edit+1]*4
      end
    end
  elseif n == 3 then
    if key_3_pressed == 0 and key_2_pressed == 0 then
      --set the slider value in the gui
      sliders[edit+1] = sliders[edit+1] + delta
      amp_value = util.clamp(((sliders[edit+1] + delta) * .026), 0.0, 1.0)
      set_amp(edit+1, amp_value)
      if sliders[edit+1] > 32 then sliders[edit+1] = 32 end
      if sliders[edit+1] < 0 then sliders[edit+1] = 0 end
    elseif key_2_pressed == 1 and key_3_pressed == 0 then
      -- set the index_slider value
      index_sliders[edit+1] = index_sliders[edit+1] + delta
      if index_sliders[edit+1] > 500 then index_sliders[edit+1] = 500 end
      if index_sliders[edit+1] < 0 then index_sliders[edit+1] = 0 end
      --print ("index is " .. index_sliders[edit+1] .. " while key2 held, slider " .. edit+1)
      set_fm_index(edit+1, index_sliders[edit+1])
      current_index = index_sliders[edit+1]
      --print ("delta " .. delta .. "  while key3 held freq value is " .. freq_sliders[edit+1] .. ". slider being edited is " .. edit+1)
    end
  end
  redraw()
  keys_down()
end

function key(n, z)
  --use these keypress variables to add extra functionality on key hold
  if n == 2 and z == 1 then
    key_2_pressed = 1
  elseif n == 2 and z == 0 then
    key_2_pressed = 0
  elseif n == 3 and z == 1 then
    key_3_pressed = 1
  elseif n == 3 and z == 0 then
    key_3_pressed = 0
  end
  redraw()
  keys_down()
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
  --display current values
  screen.move(32,56)
  screen.text(MusicUtil.note_num_to_name((MusicUtil.freq_to_note_num(current_freq)),true) .. ", " .. "FM ind: " .. current_index)
  screen.update()
end
