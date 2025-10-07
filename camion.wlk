import cosas.*

object camion {
	const property cosas = #{}
	const pesoMaximo = 2500
	const pesoCamion = 1000
		
	method estaVacio() = cosas.isEmpty()
	method estaLleno() = self.pesoTotal() >= pesoMaximo
	method cantidadDeBultosTotal() = cosas.sum({cosa => cosa.bulto()})
	
	method todaLaCarga() = cosas
	method pesoTotal() = pesoCamion + cosas.sum({cosa => cosa.peso()})
	method pesoTotalPar() = self.pesoTotal() % 2 == 0
	method hayCargaConPeso(peso) = self.todaLaCarga().any({cosa => cosa.peso() == peso})
	method tieneAlgoQuePesaEntre(pesoMin, pesoMax) =self.todaLaCarga().any({cosa => cosa.peso() >= pesoMin and cosa.peso() <= pesoMax})
	method cosaMasPesada() = self.todaLaCarga().max({cosa => cosa.peso()})//Si no encuentra nada explota(pedido por ejercicio)
	method pesoDeCadaCosaCargada() = self.todaLaCarga().map({cosa => cosa.peso()})

	method cosaConPeligrosidad(nivelPeligrosidad) = self.todaLaCarga().find({cosa => cosa.nivelPeligrosidad() == nivelPeligrosidad})//Si no encuentra nada explota(pedido por ejercicio)
	method cosasQueSuperanPeligrosidad(nivelPeligrosidad) = self.todaLaCarga().filter({cosa => cosa.nivelPeligrosidad() > nivelPeligrosidad})
	method cosasMasPeligrosasQue(unaCosa) = self.cosasQueSuperanPeligrosidad(unaCosa.nivelPeligrosidad())

	method puedeCircularEnRutaDeNivel(nivelPeligrosidadMaximo) = (self.todaLaCarga().all({cosa => cosa.nivelPeligrosidad() <= nivelPeligrosidadMaximo}) and (not self.estaLleno()))
	method puedeCircularEnRutaDePeso(pesoMax) = self.pesoTotal() <= pesoMax

	
	method transportar(unLugar,camino){
		if (self.puedeCircularEnRutaDeNivel(camino.peligrosidadMaxima()) and self.puedeCircularEnRutaDePeso(camino.pesoMaximo())){
			unLugar.almacenar(cosas)
			cosas.clear()
		}
	}
	method cargar(unaCosa) {
		cosas.add(unaCosa)
	}
	method descargar(unaCosa) {
		cosas.remove(unaCosa)
	}
	method huboAccidente() {
		cosas.forEach({cosa => cosa.sufrioAccidente()})
	}
}
