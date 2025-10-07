import cosas.*
import camion.*

object almacen {
    const cosasAlmacenadas = #{}

    method cosasAlmacenadas() = cosasAlmacenadas

    method almacenar(cosas){
        cosasAlmacenadas.addAll(cosas)
    }
}
class Ruta {
    const property pesoMaximo
    const property peligrosidadMaxima
}
