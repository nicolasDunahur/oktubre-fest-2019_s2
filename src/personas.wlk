import marcas.*
import carpas.*

class Persona {

	var property peso 
	const property jarrasCompradas = []
	var property leGustaLaMusica
	var property nivelDeAguante
	var property pais

	method recibirJarraYAgregar(unaJarra){jarrasCompradas.add(unaJarra)	}
	
	// 4)
	method leGustaLaMarca(unaMarca) {
		if (pais == belgica) {return unaMarca.lupulo() > 4
		} if (pais == checa) {return unaMarca.alcohol() > 8
		} else { return true }
	}
	// 2)
	method cuantoAlcoholTomo(){
		return jarrasCompradas.sum({ j => j.contenidoAlcoholico()})
	}
	
	method esEbrioEmpedernido(){
		return jarrasCompradas.all({j => j.capacidad() >= 100})
	}
	
	method esPatriota(){
		return jarrasCompradas.all({j => j.pais() == self.pais()})
	}
	
	// 3)
	method estaEbria() {
		return (self.cantJarrasCompradas() * peso > nivelDeAguante)
	}
	
	method cantJarrasCompradas(){return jarrasCompradas.size() }
	
	// 13
	method birrasCompradas(unaPersona){return unaPersona.jarrasCompradas().asSet()}
	method birrasQueCoinciden(otraPersona){return self.birrasCompradas(self).intersection(self.birrasCompradas(otraPersona))}
	method birrasDiferentes(otraPersona){return self.birrasCompradas(self).difference(self.birrasCompradas(otraPersona))}
	method esCompatibleCon(otraPersona){return self.birrasQueCoinciden(otraPersona).size() > self.birrasDiferentes(otraPersona).size()}

}

object alemania {}
object belgica {}
object checa {}
	