import personas.*
import marcas.*

class Carpa {
	
	var property limiteDePersonas =10
	var property tieneBanda 
	var property marcaQueVende 
	var property personasEnLaCarpa = []
	
	method coicidenConLaMusica(unaPersona){
		return unaPersona.leGustaLaMusica() and self.tieneBanda()
	}
	
	method cantPersonasEnLaCarpa(){	return personasEnLaCarpa.size()}
	
	method esAlemanYHayPar(unaPersona){
		if (unaPersona.pais() == alemania) {
			return self.cantPersonasEnLaCarpa()% 2 == 0
		} 
		else {return true}  
	}
	
			// 6) 
	method dejarEntrarA(unaPersona){
		return (self.limiteDePersonas()>= (self.cantPersonasEnLaCarpa()+ 1)and (not unaPersona.estaEbria()))
	}
	
	method quiereEntrar(unaPersona){
		return  unaPersona.leGustaLaMarca(self.marcaQueVende())
			and self.coicidenConLaMusica(unaPersona) 
			and self.esAlemanYHayPar(unaPersona)
		}		
	}
	
	method puedeEntrar(unaPersona) {
		return self.quiereEntrar(unaPersona) and self.dejaEntrarA(unaPersona)
	}

	method entre(unaPersona){
		if  puedeEntrar(unaPersona) {
			self.personasEnLaCarpa.add(unaPersona)
		}
		else{
			self.error("No puede entrar en la carpa")
		}
	}
	
	method estaEnLaCarpa(unaPersona){
		return self.personasEnLaCarpa.contains(unaPersona)	
	}

// EN LA CREACION DE UNA JARRA HAY ALGO QUE NO ME CIERRA RELACIONADO CON EL NOMBRE Y LA MARCA
// HAY ALGO MAL
	method servirleA(unaPersona, tamanio){
		if self.esta_enLaCarpa(unaPersona) {
			unaPersona.recibirJarraYAgregar(new Jarra(marca=self.marcaQueVende(), capacidad=tamanio, carpa=self))
		}
		else{self.error("No esta en la carpa")}
			
	}
	
}