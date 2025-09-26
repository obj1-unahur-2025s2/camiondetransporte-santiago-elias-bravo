import cosas2.*
object camion {
    const carga = []
    method cargar(unaCosa) {
      carga.add(unaCosa)
      unaCosa.consecuenciasDeLaCarga()
    }
    method descargar(unaCosa) {
      carga.remove(unaCosa)
    }
    method pesoTotal() {
      return 1000 + carga.sum({c => c.peso()})
    }
    method todoPesoPar(){
        return carga.all({c => c.peso().even()}) //even da true si es numero par
                                                 // odd true si es impar
    }
    method algunaCosaPesa(unPeso){
      return carga.any({c => c.peso() == unPeso})
    }
    method primerCosaConPeligrosidad(unNivel){
        return carga.find({c => c.peligrosidad() == unNivel})
    }
    method todasLasCosasConMasPeligrosidad(unValor){
        return carga.filter({c => c.peligrosidad() > unValor})
    }
    method cosasSuperanPeligrosidadDe(unaCosa) {
      return carga.filter({c => c.peligrosidad() > unaCosa.peligrosidad()})
    }
    method excedePesoMaximo(){
      return self.pesoTotal() > 2500
    }
    method puedeCircular(nivelMaximo){
      return not self.excedePesoMaximo() && 
                 self.todasLasCosasConMasPeligrosidad(nivelMaximo).isEmpty()
    }
    method algunaCosaPesaEntre(valorMin, valorMax) {
      return carga.any({c => c.peso().between(valorMin, valorMax)})
    }
    method laCosaMasPesada(){
      return carga.max({c => c.peso()})
    }
}