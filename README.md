## Implementation of the In-DSP Prefetching Technique

- Vivado can synthesize the input cascade path into the DSP without enable applied on the input pipeline registers. As shown in `dsp_chain_no_en.v`.
- Vivado CANNOT synthesize the input cascade path into the DSP WITH enable applied on the input pipeline registers. As shown in `dsp_chain_has_en.v`.
- Vivado can only synthesize the input cascade path into the DSP using primitive instantiation. As shown in `dsp_chain_has_en_direct_inst.v`

Experiments are done in Vivado 2022.2, using zcu104 board file, running `synth_design -mode out_of_context`.
