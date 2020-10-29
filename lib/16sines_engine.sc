//16 FM modulated sine waves
Engine_16Sines : CroneEngine {

	var fm_sine_synth1;
	var fm_sine_synth2;
	var fm_sine_synth3;
	var fm_sine_synth4;
	var fm_sine_synth5;
	var fm_sine_synth6;
	var fm_sine_synth7;
	var fm_sine_synth8;
	var fm_sine_synth9;
	var fm_sine_synth10;
	var fm_sine_synth11;
	var fm_sine_synth12;
	var fm_sine_synth13;
	var fm_sine_synth14;
	var fm_sine_synth15;
	var fm_sine_synth16;

	*new { arg context, doneCallback;
		^super.new(context, doneCallback);
	}

	alloc {
		//https://depts.washington.edu/dxscdoc/Help/Tutorials/Mark_Polishook_tutorial/18_Frequency_modulation.html
		SynthDef.new(\fm1, { arg bus = 0, freq = 440, carPartial = 1, modPartial = 1, index = 3, mul = 0.05;
			// index values usually are between 0 and 24
    		// carPartial :: modPartial => car/mod ratio

    		var mod;
    		var car;

		    mod = SinOsc.ar(
		        freq * modPartial,
		        0,
		        freq * index * LFNoise1.kr(5.reciprocal).abs
		    );

		    car = SinOsc.ar(
		        (freq * carPartial) + mod,
		        0,
		        mul
		    );

		    Out.ar(
		        bus,
		        car
		    )
		}).add;

		context.server.sync;

		fm_sine_synth1 = Synth.new(\fm1, target: context.og);
		fm_sine_synth2 = Synth.new(\fm1, target: context.og);
		fm_sine_synth3 = Synth.new(\fm1, target: context.og);
		fm_sine_synth4 = Synth.new(\fm1, target: context.og);
		fm_sine_synth5 = Synth.new(\fm1, target: context.og);
		fm_sine_synth6 = Synth.new(\fm1, target: context.og);
		fm_sine_synth7 = Synth.new(\fm1, target: context.og);
		fm_sine_synth8 = Synth.new(\fm1, target: context.og);
		fm_sine_synth9 = Synth.new(\fm1, target: context.og);
		fm_sine_synth10 = Synth.new(\fm1, target: context.og);
		fm_sine_synth11 = Synth.new(\fm1, target: context.og);
		fm_sine_synth12 = Synth.new(\fm1, target: context.og);
		fm_sine_synth13 = Synth.new(\fm1, target: context.og);
		fm_sine_synth14 = Synth.new(\fm1, target: context.og);
		fm_sine_synth15 = Synth.new(\fm1, target: context.og);
		fm_sine_synth16 = Synth.new(\fm1, target: context.og);

		this.addCommand(\fm_sine_synth1_amp, "f", {
			arg msg;
			fm_sine_synth1.set(\mul, msg[1]);
		});
		this.addCommand(\fm_sine_synth1_freq, "f", {
			arg msg;
			fm_sine_synth1.set(\freq, msg[1]);
		});


		this.addCommand(\fm_sine_synth2_amp, "f", {
			arg msg;
			fm_sine_synth2.set(\mul, msg[1]);
		});
		this.addCommand(\fm_sine_synth2_freq, "f", {
			arg msg;
			fm_sine_synth2.set(\freq, msg[1]);
		});


		this.addCommand(\fm_sine_synth3_amp, "f", {
			arg msg;
			fm_sine_synth3.set(\mul, msg[1]);
		});
		this.addCommand(\fm_sine_synth3_freq, "f", {
			arg msg;
			fm_sine_synth3.set(\freq, msg[1]);
		});


		this.addCommand(\fm_sine_synth4_amp, "f", {
			arg msg;
			fm_sine_synth4.set(\mul, msg[1]);
		});
		this.addCommand(\fm_sine_synth4_freq, "f", {
			arg msg;
			fm_sine_synth4.set(\freq, msg[1]);
		});


		this.addCommand(\fm_sine_synth5_amp, "f", {
			arg msg;
			fm_sine_synth5.set(\mul, msg[1]);
		});
		this.addCommand(\fm_sine_synth5_freq, "f", {
			arg msg;
			fm_sine_synth5.set(\freq, msg[1]);
		});


		this.addCommand(\fm_sine_synth6_amp, "f", {
			arg msg;
			fm_sine_synth6.set(\mul, msg[1]);
		});
		this.addCommand(\fm_sine_synth6_freq, "f", {
			arg msg;
			fm_sine_synth6.set(\freq, msg[1]);
		});


		this.addCommand(\fm_sine_synth7_amp, "f", {
			arg msg;
			fm_sine_synth7.set(\mul, msg[1]);
		});
		this.addCommand(\fm_sine_synth7_freq, "f", {
			arg msg;
			fm_sine_synth7.set(\freq, msg[1]);
		});


		this.addCommand(\fm_sine_synth8_amp, "f", {
			arg msg;
			fm_sine_synth8.set(\mul, msg[1]);
		});
		this.addCommand(\fm_sine_synth8_freq, "f", {
			arg msg;
			fm_sine_synth8.set(\freq, msg[1]);
		});


		this.addCommand(\fm_sine_synth9_amp, "f", {
			arg msg;
			fm_sine_synth9.set(\mul, msg[1]);
		});
		this.addCommand(\fm_sine_synth9_freq, "f", {
			arg msg;
			fm_sine_synth9.set(\freq, msg[1]);
		});


		this.addCommand(\fm_sine_synth10_amp, "f", {
			arg msg;
			fm_sine_synth10.set(\mul, msg[1]);
		});
		this.addCommand(\fm_sine_synth10_freq, "f", {
			arg msg;
			fm_sine_synth10.set(\freq, msg[1]);
		});


		this.addCommand(\fm_sine_synth11_amp, "f", {
			arg msg;
			fm_sine_synth11.set(\mul, msg[1]);
		});
		this.addCommand(\fm_sine_synth11_freq, "f", {
			arg msg;
			fm_sine_synth11.set(\freq, msg[1]);
		});


		this.addCommand(\fm_sine_synth12_amp, "f", {
			arg msg;
			fm_sine_synth12.set(\mul, msg[1]);
		});

		this.addCommand(\fm_sine_synth12_freq, "f", {
			arg msg;
			fm_sine_synth12.set(\freq, msg[1]);
		});


		this.addCommand(\fm_sine_synth13_amp, "f", {
			arg msg;
			fm_sine_synth13.set(\mul, msg[1]);
		});
		this.addCommand(\fm_sine_synth13_freq, "f", {
			arg msg;
			fm_sine_synth13.set(\freq, msg[1]);
		});


		this.addCommand(\fm_sine_synth14_amp, "f", {
			arg msg;
			fm_sine_synth14.set(\mul, msg[1]);
		});
		this.addCommand(\fm_sine_synth14_freq, "f", {
			arg msg;
			fm_sine_synth14.set(\freq, msg[1]);
		});


		this.addCommand(\fm_sine_synth15_amp, "f", {
			arg msg;
			fm_sine_synth15.set(\mul, msg[1]);
		});
		this.addCommand(\fm_sine_synth15_freq, "f", {
			arg msg;
			fm_sine_synth15.set(\freq, msg[1]);
		});


		this.addCommand(\fm_sine_synth16_amp, "f", {
			arg msg;
			fm_sine_synth16.set(\mul, msg[1]);
		});
		this.addCommand(\fm_sine_synth16_freq, "f", {
			arg msg;
			fm_sine_synth16.set(\freq, msg[1]);
		});

	}

	free {
		fm_sine_synth1.free;
		fm_sine_synth2.free;
		fm_sine_synth3.free;
		fm_sine_synth4.free;
		fm_sine_synth5.free;
		fm_sine_synth6.free;
		fm_sine_synth7.free;
		fm_sine_synth8.free;
		fm_sine_synth9.free;
		fm_sine_synth10.free;
		fm_sine_synth11.free;
		fm_sine_synth12.free;
		fm_sine_synth13.free;
		fm_sine_synth14.free;
		fm_sine_synth15.free;
		fm_sine_synth16.free;
	}
}
