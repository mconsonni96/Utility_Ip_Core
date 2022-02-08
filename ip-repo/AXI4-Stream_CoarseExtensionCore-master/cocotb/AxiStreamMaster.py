
import cocotb
from cocotb.triggers import Timer, RisingEdge, ReadOnly, ClockCycles
from cocotb.clock import Clock
from cocotb.monitors import BusMonitor
from cocotb.scoreboard import Scoreboard
from cocotb.drivers import BusDriver

class StreamBusMonitor(BusMonitor):
	"""
	Mio esperimento per il monitor di bus di tipo StreamBusMonitor
	"""

	# _signals = ["TDATA", "TVALID", "TREADY"]
	_signals = ["TVALID"]

	_optional_signals = ["TDATA", "TREADY"]

	@cocotb.coroutine
	def _monitor_recv(self):
		""""
		Questa è una coroutine utilizzata per iniettare i segnali alla classe monitor quando questi sono validi
		"""

		while True:
			yield RisingEdge(self.clock)
			#yield ReadOnly()


			if (not hasattr(self.entity, "TREADY") and self.bus.TVALID.value) or (self.bus.TVALID.value and self.bus.TREADY.value):
				self._recv(int(self.bus.TDATA.value))	# Qui dovrei scrivere self.bus.TDATA.integer perchè value è deprecato. Lo testo quando ho tempo






class AxiStreamMaster(BusDriver):
	"""
	Pilotaggio di un semplice AXI Stream considerando che l'unico segnale obbligatorio è il VALID
	"""

	_signals = [ "TVALID" ]

	_optional_signals = [
		"TREADY",	"TDATA",	"TLAST"
	]

	def __init__(self, entity, name, clock ):
		"""
			Initialization of AxiStreamMaster

			Args:
				entity: handle to the simulator entity
				name: Name of the bus
				clock: handle to the clk associated with this bus


		"""

		BusDriver.__init__(self, entity, name, clock)


		# Drive some sensible defaults (setimmediatevalue to avoid x asserts)
		self.bus.TVALID.setimmediatevalue(0)
		self.bus.TDATA.setimmediatevalue(0)
		if hasattr(entity, "TLAST"):
			self.bus.TLAST.setimmediatevalue(0)

		self.clock = clock
		self._entity = entity
		#self.big_endian = big_endian

	@cocotb.coroutine
	def write(self, data, sync=True):
		"""
		Usa per scrivere un dato sul bus

		Args:
			data (int): il dato da scrivere
			sync (bool, optional): Aspetta il prossimo rising edge del clock
				Default to True
		"""

		if sync:
			yield RisingEdge(self.clock)

		self.bus.TDATA <= data
		self.bus.TVALID <= 1
		if hasattr(self._entity, "TLAST"):
			self.bus.TLAST <= 1 # TODO: Accetta anche array come input data e setta di conseguenza il TLAST

		while True:
			yield ReadOnly()
			if not hasattr(self._entity, "TREADY") or self.bus.TREADY.value:
				break
			yield RisingEdge(self.clock)

		yield RisingEdge(self.clock)
		self.bus.TVALID <= 0


	@property
	def n_bits(self):
		return self.bus.TDATA.value.n_bits
