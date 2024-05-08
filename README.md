# Implementation of the In-DSP Prefetching Technique

The In-DSP prefetching technique requires two sets of clock enables applied to the input pipeline registers. Without these enables, the implementation functions as a simple FIR filter.

## Experiments

The experiments were conducted in Vivado 2022.2 using the ZCU104 board file.

The designs were synthesized using the tcl command `synth_design -mode out_of_context`.

- **Without Clock Enable**: Vivado successfully synthesized the input cascade path into the DSP without enabling the input pipeline registers. This implementation is demonstrated in `dsp_chain_no_en.v`.
- **With Clock Enable**: Vivado could not synthesize the input cascade path into the DSP when enabling the input pipeline registers. This implementation is demonstrated in `dsp_chain_has_en.v`.
- **Direct Instantiation with Clock Enable**: Vivado was able to synthesize the input cascade path into the DSP with enables when using direct instantiation of primitives. This implementation is demonstrated in `dsp_chain_has_en_direct_inst.v`.
