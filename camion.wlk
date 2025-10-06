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

	method hayCargaConPeso(peso){
		return self.todaLaCarga().any({cosa => cosa.peso() == peso})
	}
	method estaLleno() {
		return self.pesoTotal() >= pesoMaximo
	}
	method cosaConPeligrosidad(nivelPeligrosidad){
		return self.todaLaCarga().findOrDefault({cosa => cosa.nivelPeligrosidad() == nivelPeligrosidad}, null)
	}
	method cosasQueSuperanPeligrosidad(nivelPeligrosidad){
		return self.todaLaCarga().filter({cosa => cosa.nivelPeligrosidad() > nivelPeligrosidad})
	}
	method cosasMasPeligrosasQue(unaCosa){
		return self.cosasQueSuperanPeligrosidad(unaCosa.nivelPeligrosidad())
	}
	method puedeCircularEnRutaDeNivel(nivelPeligrosidadMaximo){
		return (self.todaLaCarga().all({cosa => cosa.nivelPeligrosidad() <= nivelPeligrosidadMaximo}) and (not self.estaLleno()))
	}
}
