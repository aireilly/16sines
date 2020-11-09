# 16sines

A simple FM sine synth with 16 independant but harmonically related sine waves, optionally controlled by 16n. Each sine wave is FM modulated with configurable carrier - modulator FM index.

## Installation

To install, ssh into norns:  

	$ cd dust/code
	$ git clone https://github.com/aidanreilly/16sines.git

Then, `SYSTEM => RESET` to pick up the new SuperCollider engine.

## Play

Select a root note and scale from the norns parameters menu. 16 frequencies based on the selected scale are applied to the sc engine.  

Controls:

* [E1] overall volume
* [E2] select sine 1-16
* [E3] set sine amplitude
* [K1] exit to norns main menu
* [K2] + [E2] change note
* [K2] + [E3] detune
* [K3] + [E2] change octave
* [K3] + [E3] change fm index
* [K2] + [K3] set all sine waves to the root note, with randomized fm index and detune parameters. 

### Optional

Control individual sine wave amplitudes with 16n midi controller, on cc's 32-47, channel 1.

