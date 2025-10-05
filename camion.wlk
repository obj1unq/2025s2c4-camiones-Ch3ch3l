import cosas.*

object camion {
	const property cosas = #{}
		
	method todaLaCarga() = cosas
	method estaVacio() = cosas.isEmpty()

	method cargar(unaCosa) {
		cosas.add(unaCosa)
	}
	method descargar(unaCosa) {
		cosas.remove(unaCosa)
	}
	method pesoTotal() {
		return cosas.sum({cosa => cosa.peso()})
	}
	method totalPesoPar(){
		return self.pesoTotal() % 2 == 0
	}

	method hayCargaConPesoX(peso){
		return self.todaLaCarga().any({cosa => cosa.peso() == peso})
	}

}
