all:signal_interrupt_condWait spurious_wakeup

signal_interrupt_condWait : signal_interrupt_condWait.cpp
	g++ signal_interrupt_condWait.cpp  -pthread -o $@ -g3
spurious_wakeup : spurious_wakeup.cpp
	g++ $^ -pthread -g3 -o $@

clean:
	rm signal_interrupt_condWait spurious_wakeup
