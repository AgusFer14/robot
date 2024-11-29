import naves.*

class Piloto {
  var property peso
  const navesPilotadas = #{}

  method leAgrada(unaNave)


  method pilotar(unaNave) {
    if(not self.leAgrada(unaNave)){
        self.error("No le agrada la nave")
    }
    navesPilotadas.add(unaNave)
  }

  method pesoDeNavesPilotadas() {
    return navesPilotadas.sum({n => n.peso()})
  }

  method estaSatisfecho() {
    return self.pesoDeNavesPilotadas() * 0.1 >= self.peso() and
    self.condicionAdicional()
  }

  method condicionAdicional() {
    return true
  }
}

class PilotoSecundario inherits Piloto {
  override method leAgrada(unaNave) {
    return unaNave.esCompatible() and unaNave.valoracion() > 85
  }

  override method condicionAdicional() {
    return navesPilotadas.all({n => not n.esPoderosa()})
  }
}

class PilotoDeAtaque inherits Piloto {
  override method leAgrada(unaNave) {
    return unaNave.esPoderosa()
  }
}

class PilotoTactico inherits Piloto {
  override method leAgrada(unaNave) {
    return unaNave.peso().between(6, 12) or 
    unaNave.valoracion() > 100
  }

  override method condicionAdicional() {
    return navesPilotadas.size().even()
  }
}