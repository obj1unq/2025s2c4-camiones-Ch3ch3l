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
	method nivelPeligrosidad() { return if (esAuto) 15 else 30}
	method bulto() = 2
	
	method cambiarModo() {esAuto = not esAuto}
	method sufrioAccidente() {self.cambiarModo()}
}
object contenedorPortuario {
	const cosas = #{}
	
	method peso() = 100 + cosas.sum({cosa => cosa.peso()})
	method nivelPeligrosidad() {return if (cosas.isEmpty()) 0 else cosas.map({cosa => cosa.nivelPeligrosidad()}).max()} // Transformo objetos a numeros(peligrosidad) y hago un max}
	
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
	method sufrioAccidente() {cantidad += 20}
}


class PaqueteDeLadrillos {
	var cantidad

	method peso() = cantidad * 2
	method nivelPeligrosidad() = 2
	method bulto() {return if (cantidad <= 100) 1 else if (cantidad > 100 and cantidad <= 300) 2 else 3}
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

	method peso() {return if (tieneMisiles) 300 else 200}
	method nivelPeligrosidad() {return if (tieneMisiles) 100 else 0}
	method bulto() {return if (tieneMisiles) 2 else 1}
	method sufrioAccidente() {tieneMisiles = false}
}
class ResiduosRadiactivos {
	var cantidad

	method peso() = cantidad
	method nivelPeligrosidad() = 200
	method bulto() = 1
	method sufrioAccidente() {cantidad += 15}
}

class EmbalajeDeSeguridad {
	var property cosaEmbalada

	
	method peso() = cosaEmbalada.peso()
	method bulto() = 2
	method nivelPeligrosidad() = cosaEmbalada.nivelPeligrosidad() / 2
	method embalar(unaCosa){cosaEmbalada = unaCosa}
	method sufrioAccidente(){}
}