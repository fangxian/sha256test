TB = sha_256_tb
SEED = 1
VFLIES += sha_256.sv sha_mainloop.sv sha_padder.sv sha_256_tb.sv


VCOMP = -full64 -kdb -ntb_opts uvm-1.2 -sverilog -timescale=1ps/1ps -nc -l comp.log
ELAB = vcs -full64 -kdb -ntb_opts uvm-1.2 -debug_acc+all -debug_region+cell+encrypt -l elab.log -cm line+tgl+branch
RUN = ./$(TB).simv -l run.log -sml -cm line+tgl+branch 
BSUB = bsub -Is -q eri
VCS_FLAGS = +define+PHYSICAL_MEMORY -fsdb -full64 -DPI +v2k -debug_acc+all -debug_region+cell+encrypt +define+FSDB \
            -error+800

.PHONY: elab run verdi clean

elab:
	$(BSUB) $(ELAB) $(VCOMP) $(VCS_FLAGS) $(VFLIES) -top $(TB) -o $(TB).simv

run:
	$(BSUB) $(RUN)

verdi:
	$(BSUB) verdi -ssf $(TB).fsdb

clean:
	rm -rf csrc *.simv *.daidir ucli.key
	rm -rf *.log* verdiLog vdCovLog *.simv.vdb
	rm -rf *~ core simg* vc_hdrs.h urg* novas.* *.fsdb* 64*