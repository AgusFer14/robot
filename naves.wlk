class Nave {
  var property calidad

  method peso()

  method esPoderosa() {
	return self.peso() >= 5
  }

  method esCompatible() = false

  method valoracion()
}

class Cyclone inherits Nave {
  var property peso
  var estaModoAuto = false

  override method esCompatible() {
	return estaModoAuto
  }

  method esEspecial() {
	return self.esPoderosa() and not estaModoAuto
  }

  override method valoracion() {
	if(self.esEspecial()){
		return 120
	}else{
		return 80
	}
  }
}

class VeritechFighter inherits Nave {
	var arma

  override method peso() {
	return 5
  }

  override method valoracion() {
	return 60 + arma.valoracion()
  }
}

object rifle {
  method valoracion() {
	return 0
  }
}

object canion {
  method valoracion() {
	return 20
  }
}

object misiles {
  method valoracion() {
	return 45
  }
}

class AlphaFighter inherits VeritechFighter {
  const property modelo 

  override method peso() {
	return super() * 2
  }

  override method esCompatible() = true

  override method valoracion() {
	return super() + self.plus()
  }

  method plus() {
	return 17.min(2 * (modelo.size()))
  }
}