import cosas.*

object camion {
	const property cosas = #{}
	const pesoMaximo = 2500
	const pesoCamion = 1000
		
	method todaLaCarga() = cosas
	method estaVacio() = cosas.isEmpty()

	method cargar(unaCosa) {
		cosas.add(unaCosa)
	}
	method descargar(unaCosa) {
		cosas.remove(unaCosa)
	}
	method pesoTotal() {
		return pesoCamion + cosas.sum({cosa => cosa.peso()})
	}
	method totalPesoPar(){
		return self.pesoTotal() % 2 == 0
	}

	method hayCargaConPesoX(peso){
		return self.todaLaCarga().any({cosa => cosa.peso() == peso})
	}
	method camionLleno() {
		return self.pesoTotal() >= pesoMaximo
	}
}
