// Objetos
object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
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
object contenedorPortuario {
	const cosasAdentro = #{}
	
	method peso() = 100 + cosasAdentro.sum({cosa => cosa.peso()})
	method nivelPeligrosidad() {
			if (cosasAdentro.isEmpty()) {
				return 0
			}
			else {
				return cosasAdentro.map({cosa => cosa.nivelPeligrosidad()}).max() // Transformo objetos a numeros(peligrosidad) y hago un max
			}
	}
}
// Clases
class ArenaAGranel {
	const cantidad

	method peso() = cantidad
	method nivelPeligrosidad() = 1
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

class EmbalajeDeSeguridad {
	var property cosaEmbalada

	
	method peso() = cosaEmbalada.peso()
	method nivelPeligrosidad() = cosaEmbalada.nivelPeligrosidad() / 2
	method embalar(unaCosa){
		cosaEmbalada = unaCosa
	}
}