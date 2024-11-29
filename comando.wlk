import naves.*
import pilotos.*

object flota {
  const pilotosDisponibles = []
  const navesDisponibles = []

  method cantNavesCompatibles() {
    return navesDisponibles.count({n => n.esCompatible()})
  }

  method cantNavesNoCompatibles() {
    return navesDisponibles.count({n => not n.esCompatible()})
  }

  method buenaOfertaPilotosSecundarios() {
    return self.cantNavesCompatibles() - self.cantNavesNoCompatibles() >= 2
  }

  method navePoderosaNoCompatible() {
    const navesNoCompatibles = navesDisponibles.filter({n => not n.esCompatible()})
    return navesNoCompatibles.max({n => n.valoracion()})
  }

  method navesQueLeAgrada(unPiloto) {
    return navesDisponibles.filter({n => unPiloto.leAgrada(n)})
  }

  method elegirNavePara(unPiloto) {
		if(self.navesQueLeAgrada(unPiloto).isEmpty()){
            self.error("Al piloto no le gusta ninguna nave")
        }
		const unaNave = self.navesQueLeAgrada(unPiloto).anyOne()
		unPiloto.pilotar(unaNave)
		pilotosDisponibles.add(unPiloto)
		navesDisponibles.remove(unaNave)
  }
}