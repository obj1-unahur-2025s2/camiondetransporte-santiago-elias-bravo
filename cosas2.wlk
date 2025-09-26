import camion2.*
object knightRider {
    method peso(){
        return 500
    }
    method peligrosidad(){
        return 10
    }
    method bultos(){
      return 1
    }
    method consecuenciasDeLaCarga() {
    }
}
object bumblebee {
  var esAuto = true
  method peso(){
    return 800
  }
  method transformateEnAuto(){
    esAuto = true
  }
  method transformateEnRobot() {
    esAuto = false
  }
  method peligrosidad(){
    if (esAuto){
        return 15
    }
    else{
        return 30
    }
  }
  method bultos(){
      return 2
    }
  method consecuenciasDeLaCarga() {
      self.transformateEnRobot()
    }
}

object ladrillos {
  var cantidad = 10
  method cantidad(nuevaCantidad){
    cantidad = 0.max(nuevaCantidad)
  }
  method peso(){
    return 2 * cantidad
  }
  method peligrosidad() {
    return 2
  }
  method bultos(){
      if(cantidad <= 100){
        return 1
      }
      else if(cantidad.between(101, 300)){
        return 2
      }
      else{
        return 3
      }
    }
  method consecuenciasDeLaCarga() {
     cantidad = cantidad + 12 
    }
}

object arena {
  var peso = 0  // var property peso = 0
  method peso(nuevoPeso){
    peso = nuevoPeso
  }
  method peso(){
    return peso
  }
  method peligrosidad(){
    return 1
  }
  method bultos(){
      return 1
    }
  method consecuenciasDeLaCarga() {
      peso = 0.max(peso - 10)
    }
}

object bateriaAntiaerea {
  var estaConMisiles = false
  method cargarMisiles(){
    estaConMisiles = true
  }
  method descargarMisiles(){
    estaConMisiles = false
  }
  method peso(){
    if(estaConMisiles){
        return 300
    }
    else{
        return 200
    }
  }
  method peligrosidad(){
    if(estaConMisiles){
        return 100
    }
    else{
        return 0
    }
  }
  method bultos(){
      if(estaConMisiles){
        return 2
      }
      else{
        return 1
      }
    }
    method consecuenciasDeLaCarga() {
      self.cargarMisiles()
    }
}

object contenedor{
    const cosasAdentro = []
    method agregar(unaCosa){
        cosasAdentro.add(unaCosa)
    }
    method agregarVarias(variasCosas){
        cosasAdentro.addAll(variasCosas)
    }
    method quitarCosa(unaCosa) {
      cosasAdentro.remove(unaCosa)
    }
    method peso(){
        return 100 + cosasAdentro.sum({c => c.peso()})
    }
    method peligrosidad(){
        if(cosasAdentro.isEmpty()){
            return 0
        }
        else{
            return cosasAdentro.max({c => c.peligrosidad()}).peligrosidad()
        }
    }
    method bultos(){
      return 1 + cosasAdentro.sum({c => c.bultos()})
    }
    method consecuenciasDeLaCarga() {
      if(not cosasAdentro.isEmpty()){
        cosasAdentro.forEach({c => c.consecuenciasDeLaCarga()})
      }
    }
}

object residuos {
  var property peso = 0
  method peligrosidad() {
    return 200
  }
  method bultos(){
      return 1
    }
  method consecuenciasDeLaCarga() {
      peso = peso + 15
    }
}

object embalaje {
  var cosaEnvuelta = arena
  method envolver(unaCosa){
    cosaEnvuelta = unaCosa
  } 
  method peso() {
    return cosaEnvuelta.peso()
  }
  method peligrosidad() {
    return cosaEnvuelta.peligrosidad() / 2
  }
  method bultos(){
      return 2
    }
  method consecuenciasDeLaCarga() {
    }
}