// Engine_16Sines
// 16 mono sinewaves

// Inherit methods from CroneEngine
Engine_16Sines : CroneEngine {
	// Define a getter for the synth variable
	var <synth;

	// Define a class method when an object is created
	*new { arg context, doneCallback;
	// Return the object from the superclass (CroneEngine) .new method
	^super.new(context, doneCallback);
}
// Rather than defining a SynthDef, use a shorthand to allocate a function and send it to the engine to play
// Defined as an empty method in CroneEngine
// https://github.com/monome/norns/blob/master/sc/core/CroneEngine.sc#L31
alloc {
	// Define the synth variable, whichis a function
	synth = {
		// define arguments to the function
		arg out, 
		freq1 = 55,
		freq2 = 110,
		freq3 = 220,
		freq4 = 330,
		freq5 = 440,
		freq6 = 550,
		freq7 = 660,
		freq8 = 770,
		freq9 = 880,
		freq10 = 990,
		freq11 = 1110,
		freq12 = 2220,
		freq13 = 3330,
		freq14 = 4440,
		freq15 = 5550,
		freq16 = 6660,
		amp1 = 0.2,
		amp2 = 0.2,
		amp3 = 0.2,
		amp4 = 0.2,
		amp5 = 0.2,
		amp6 = 0.2,
		amp7 = 0.2,
		amp8 = 0.2,
		amp9 = 0.2,
		amp10 = 0.2,
		amp11 = 0.2,
		amp12 = 0.2,
		amp13 = 0.2,
		amp14 = 0.2,
		amp15 = 0.2,
		amp16 = 0.5;
		// Sin OSCs (freq, phase, amplitude)
		var osc1 = SinOsc.ar(freq1, 0, amp1);
		var osc2 = SinOsc.ar(freq2, 0, amp2);
		var osc3 = SinOsc.ar(freq3, 0, amp3);
		var osc4 = SinOsc.ar(freq4, 0, amp4);
		var osc5 = SinOsc.ar(freq5, 0, amp5);
		var osc6 = SinOsc.ar(freq6, 0, amp6);
		var osc7 = SinOsc.ar(freq7, 0, amp7);
		var osc8 = SinOsc.ar(freq8, 0, amp8);
		var osc9 = SinOsc.ar(freq9, 0, amp9);
		var osc10 = SinOsc.ar(freq10, 0, amp10);
		var osc11 = SinOsc.ar(freq11, 0, amp11);
		var osc12 = SinOsc.ar(freq12, 0, amp12);
		var osc13 = SinOsc.ar(freq13, 0, amp13);
		var osc14 = SinOsc.ar(freq14, 0, amp14);
		var osc15 = SinOsc.ar(freq15, 0, amp15);
		var osc16 = SinOsc.ar(freq16, 0, amp16);
		var osc_mix = Mix.new([osc1, osc2, osc3, osc4, osc5, osc6, osc7, osc8, osc9, osc10, osc11, osc12, osc13, osc14, osc15, osc16]);
		// Create an output object with a mix the SineOsc outputs,
		Out.ar(out, (osc_mix).dup);
		// Send the synth function to the engine as a UGen graph.
		// It seems like when an Engine is loaded it is passed an AudioContext
		// that is used to define audio routing stuff (Busses and Groups in SC parlance)
		// These methods are defined in 
		// https://github.com/monome/norns/blob/master/sc/core/CroneAudioContext.sc
		// pass the CroneAudioContext method "out_b" as the value to the \out argument
		// pass the CroneAudioContext method "xg" as the value to the target.
	}.play(args: [\out, context.out_b], target: context.xg);

	// Export freq and amp argument symbols as modulatable paramaters
	this.addCommand("freq1", "f", { arg msg;
		synth.set(\freq1, msg[1]);
	});
	this.addCommand("amp1", "f", { arg msg;
		synth.set(\amp1, msg[1]);
	});

	this.addCommand("freq2", "f", { arg msg;
		synth.set(\freq2, msg[1]);
	});
	this.addCommand("amp2", "f", { arg msg;
		synth.set(\amp2, msg[1]);
	});

	this.addCommand("freq3", "f", { arg msg;
		synth.set(\freq3, msg[1]);
	});
	this.addCommand("amp3", "f", { arg msg;
		synth.set(\amp3, msg[1]);
	});

	this.addCommand("freq4", "f", { arg msg;
		synth.set(\freq4, msg[1]);
	});
	this.addCommand("amp4", "f", { arg msg;
		synth.set(\amp4, msg[1]);
	});

	this.addCommand("freq5", "f", { arg msg;
		synth.set(\freq5, msg[1]);
	});
	this.addCommand("amp5", "f", { arg msg;
		synth.set(\amp5, msg[1]);
	});

	this.addCommand("freq6", "f", { arg msg;
		synth.set(\freq6, msg[1]);
	});
	this.addCommand("amp6", "f", { arg msg;
		synth.set(\amp6, msg[1]);
	});

	this.addCommand("freq7", "f", { arg msg;
		synth.set(\freq7, msg[1]);
	});
	this.addCommand("amp7", "f", { arg msg;
		synth.set(\amp7, msg[1]);
	});

	this.addCommand("freq8", "f", { arg msg;
		synth.set(\freq8, msg[1]);
	});
	this.addCommand("amp8", "f", { arg msg;
		synth.set(\amp8, msg[1]);
	});

	this.addCommand("freq9", "f", { arg msg;
		synth.set(\freq9, msg[1]);
	});
	this.addCommand("amp9", "f", { arg msg;
		synth.set(\amp9, msg[1]);
	});

	this.addCommand("freq10", "f", { arg msg;
		synth.set(\freq10, msg[1]);
	});
	this.addCommand("amp10", "f", { arg msg;
		synth.set(\amp10, msg[1]);
	});

	this.addCommand("freq11", "f", { arg msg;
		synth.set(\freq11, msg[1]);
	});
	this.addCommand("amp11", "f", { arg msg;
		synth.set(\amp11, msg[1]);
	});

	this.addCommand("freq12", "f", { arg msg;
		synth.set(\freq12, msg[1]);
	});
	this.addCommand("amp12", "f", { arg msg;
		synth.set(\amp12, msg[1]);
	});

	this.addCommand("freq13", "f", { arg msg;
		synth.set(\freq13, msg[1]);
	});
	this.addCommand("amp13", "f", { arg msg;
		synth.set(\amp13, msg[1]);
	});

	this.addCommand("freq14", "f", { arg msg;
		synth.set(\freq14, msg[1]);
	});
	this.addCommand("amp14", "f", { arg msg;
		synth.set(\amp14, msg[1]);
	});

	this.addCommand("freq15", "f", { arg msg;
		synth.set(\freq15, msg[1]);
	});
	this.addCommand("amp15", "f", { arg msg;
		synth.set(\amp15, msg[1]);
	});

	this.addCommand("freq16", "f", { arg msg;
		synth.set(\freq16, msg[1]);
	});
	this.addCommand("amp16", "f", { arg msg;
		synth.set(\amp16, msg[1]);
	});

}
// define a function that is called when the synth is shut down
free {
	synth.free;
}
}
