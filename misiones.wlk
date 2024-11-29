import naves.*

class Mision {
  const navesAsignadas = #{}
  const nombre

  method peso() {
	return navesAsignadas.sum({n => n.peso()})
  }

  method valoracion() {
	return 0.max((15 * self.maximaCalidadDeNaves()) - navesAsignadas.size())
  }

  method maximaCalidadDeNaves() {
	return navesAsignadas.max({n => n.calidad()}).calidad()
  }
}
