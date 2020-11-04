# 16sines

A simple FM sine synth with 16 independant but harmonically related sine waves, optionally controlled by 16n. Each sine wave is FM modulated with configurable carrier - modulator FM index.

## Installation

To install, ssh into norns:  

	$ cd dust/code
	$ git clone https://github.com/aidanreilly/16sines.git

Then, `SYSTEM => RESET` to pick up the new SuperCollider engine.

## Play

Select a root note and scale from the norns parameters menu. 16 frequencies based on the selected scale are applied to the sc engine.  

* [Enc 1] controls overall volume
* [Enc 2] select sine wave 1-16
* [Enc 3] control selected sine wave amplitude
* [Key 1] exit to norns main menu
* [Key 2] + [Enc 2] change sine wave octave
* [Key 2] + [Enc 3] change FM index

### Optional

Control individual sine wave amplitudes with 16n midi controller, on cc's 32-47, channel 1.

