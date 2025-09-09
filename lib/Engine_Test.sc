Engine_Test : CroneEngine {
  var synth;

  *new { ^super.new.init; }

  init {
    synth = SynthDef("TestEngine", {
      arg freq = 440, amp = 0.2;
      Out.ar(0, SinOsc.ar(freq) * amp);
    }).add;
  }

  freq(f) {
    Synth("TestEngine", [\freq, f]);
  }
}
