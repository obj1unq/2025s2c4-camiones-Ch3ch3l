object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
}

class ArenaAGranel {
	const cantidad

	method peso() = cantidad
	method nivelPeligrosidad() = 1
}

object bumblebee {
	var esAuto = true
	
	method peso() = 800
	method nivelPeligrosidad() {
		if (esAuto) {
			return 15
		}
		else {
			return 30
		}
	}
	method cambiarModo() {
		esAuto = not esAuto
	}
}

class PaqueteDeLadrillos {
	const cantidad

	method peso() = cantidad * 2
	method nivelPeligrosidad() = 2
}

class BateriaAntiaerea {
	const tieneMisiles

	method peso() {
		if (tieneMisiles) {
			return 300
		}
		else {
			return 200
		}
	}
	method nivelPeligrosidad() {
		if (tieneMisiles) {
			return 100
		}
		else {
			return 0
		}
	}
}
class ResiduosRadiactivos {
	const cantidad

	method peso() = cantidad
	method nivelPeligrosidad() = 200
}
