import personas.*
import carpas.*

class Marcas {
	var property pais
	var property lupulo	
}

class Rubia inherits Marcas {
	var property alcohol
}

class Negra inherits Marcas {
	method alcohol() {
		return graduacionReglamentaria.nivel().min(self.lupulo()*2)
	}
}

class Roja inherits Negra {
	override method alcohol(){
		return super() *1.25
	}
}

object graduacionReglamentaria {
	var property nivel
}

class Jarra inherits Marcas {
	var property capacidad
	var property marca
	var property carpa

	
	method contenidoAlcoholico(){
		return capacidad * marca.alcohol()
	}
}
