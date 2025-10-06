// Objetos
object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
	method bulto() = 1
	method sufrioAccidente() {}
}
object bumblebee {
	var esAuto = true
	
	method peso() = 800
	method bulto() = 2
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
	method sufrioAccidente() {
		self.cambiarModo()
	}
}
object contenedorPortuario {
	const cosas = #{}
	
	method peso() = 100 + cosas.sum({cosa => cosa.peso()})
	method nivelPeligrosidad() {
			if (cosas.isEmpty()) {
				return 0
			}
			else {
				return cosas.map({cosa => cosa.nivelPeligrosidad()}).max() // Transformo objetos a numeros(peligrosidad) y hago un max
 			}
	}
	method cargar(unaCosa) {
		cosas.add(unaCosa)
	}
	method descargar(unaCosa) {
		cosas.remove(unaCosa)
	}
	method bulto() = 1 + cosas.sum({cosa => cosa.bulto()})
	method sufrioAccidente(){
		cosas.forEach({cosa => cosa.sufrioAccidente()})
	}
}
// Clases
class ArenaAGranel {
	var cantidad

	method peso() = cantidad
	method nivelPeligrosidad() = 1
	method bulto() = 1
	method sufrioAccidente() {
		cantidad += 20
	}
}


class PaqueteDeLadrillos {
	var cantidad

	method peso() = cantidad * 2
	method nivelPeligrosidad() = 2
	method bulto() {
		if (cantidad <= 100){
			return 1
		}
		else if (cantidad > 100 and cantidad <= 300){
			return 2
		}
		else {
			return 3
		}
	}
	method sufrioAccidente() {
		if (cantidad >= 12) {
			cantidad -= 12
		}
		else {
			cantidad = 0
		}
	}
}

class BateriaAntiaerea {
	var property tieneMisiles

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
	method bulto() {
		if (tieneMisiles) {
			return 2
		}
		else {
			return 1
		}
	}
	method sufrioAccidente() {
		tieneMisiles = false
	}
}
class ResiduosRadiactivos {
	var cantidad

	method peso() = cantidad
	method nivelPeligrosidad() = 200
	method bulto() = 1
	method sufrioAccidente() {
		cantidad += 15
	}
}

class EmbalajeDeSeguridad {
	var property cosaEmbalada

	
	method peso() = cosaEmbalada.peso()
	method bulto() = 2
	method nivelPeligrosidad() = cosaEmbalada.nivelPeligrosidad() / 2
	method embalar(unaCosa){
		cosaEmbalada = unaCosa
	}
	method sufrioAccidente(){}
}