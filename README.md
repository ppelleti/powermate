[![Hackage](https://img.shields.io/hackage/v/powermate.svg)](https://hackage.haskell.org/package/powermate)
[![Build Status](https://travis-ci.org/ppelleti/powermate.svg?branch=master)](https://travis-ci.org/ppelleti/powermate)

This library is for interfacing the [Griffin PowerMate USB][1] with
Haskell on Linux.  Besides reading events from the PowerMate, you
can also control the brightness, pulse speed, and pulse waveform of
the built-in LED.

([An earlier version of the library][4] also contained an
implementation of the [MPD][2] protocol.  This was removed, because it
wasn't directly related to the PowerMate functionality, and the
[libmpd][3] library seems to be an alternative which is more complete
and better maintained.)

Besides the library, this package includes two example programs,
`powermate-print` and `powermate-pulse`.  `powermate-print` simply
prints out the events it receives from the PowerMate.
`powermate-pulse` lets you control the LED pulse speed by
turning the knob, and change the pulse waveform by clicking the knob.

[1]: https://griffintechnology.com/us/powermate
[2]: https://musicpd.org/doc/protocol/
[3]: https://hackage.haskell.org/package/libmpd
[4]: https://hackage.haskell.org/package/powermate-0.1
