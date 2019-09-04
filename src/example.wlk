object alquimista {
	var itemsDeCombate = []
	
	method tieneCriterio(){
		return self.cantidadDeItemsDeCombateEfectivos() >= self.cantidadDeItems() / 2 
	}	
	method cantidadDeItems(){
		return itemsDeCombate.size()
	}
	
	method cantidadDeItemsDeCombateEfectivos(){
		return itemsDeCombate.count({itemDeCombate => itemDeCombate.esEfectivo()})
	}
	
	
}

object bomba {
	var materiales = []
	var daño = 0
	
	method esEfectivo ()
	{
		return daño > 100
	}
	method calidadCombate(){
		return 
		
	}
	
}

object pocion{
	var materiales = []
	var poderCurativo = 0
	method esEfectivo ()
	{
		return poderCurativo >50 && self.tieneAlgunoMistico()
	}
	
	method tieneAlgunoMistico(){
		return materiales.any({material=>material.esMistico()})
	}
	
}

object debilitador {
	var potencia = 0
	var materiales = []
	method esEfectivo ()
	{
		return potencia > 0 && self.tieneAlgunoMistico().negate()
	}
	
	method tieneAlgunoMistico(){
		return materiales.any({material=>material.esMistico()})
	}
	
}

//materiales


object flor {
	var calidad = 20
	method esMistico(){
		return true
	}
}

object polvora {
	var calidad = 30
	method esMistico(){
		return false
	}
}

object uni{
	var calidad = 25
	method esMistico(){
		return false
	}
}

//items de recoleccion


object cañaDePescar {
	
}

