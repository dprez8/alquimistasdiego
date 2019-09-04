object alquimista {
  var itemsDeCombate = []
  var itemsDeRecoleccion = []
  
  method tieneCriterio() {
    return self.cantidadDeItemsDeCombateEfectivos() >= self.cantidadDeItemsDeCombate() / 2
  }
  
  method cantidadDeItemsDeCombate() {
    return itemsDeCombate.size()
  }
  
  method cantidadDeItemsDeCombateEfectivos() {
    return itemsDeCombate.count({ itemDeCombate => itemDeCombate.esEfectivo() })
  }
  
  method agregarItemDeCombate(item){
  	itemsDeCombate.add(item)
  }
  method agregarItemDeRecoleccion(item){
  	itemsDeRecoleccion.add(item)
  }
  
  method esBuenExplorador(){
  	return self.cantidadDeItemsDeRecoleccion() >= 3 // obs: siempre el metodo tiene que hacer lo que dice, no dos cosas
  }
		
  method cantidadDeItemsDeRecoleccion() { // con ALT+SHIFT + M, CREA UN METODO (seleccionar la linea)
	return itemsDeRecoleccion.size()	// ta muy bueno loco por dios
		}
		
  method capacidadOfensiva(){
   	return itemsDeCombate.sum {item =>item.capacidad()}	
   }
   
  method esProfesional(){
   	if (self.cumpleCondicionesDeProfesional()){
   		return true
   	}
   	return false
   }
   
   
   method buenaCalidadItemsDeCombate(){
   	return itemsDeCombate.all({item=> item.calidad()>50})
   }
   method buenaCalidadItemsDeRecoleccion(){
   	return itemsDeCombate.all({item=> item.calidad()>50})
   }
   method buenaCalidadPromedio(){
   	return self.buenaCalidadItemsDeCombate() && self.buenaCalidadItemsDeRecoleccion()
   }
   
   
   
   method todosItemsDeCombateEfectivo(){
   	return itemsDeCombate.all({item=>item.esEfectivo()})
   	}		
	
	method cumpleCondicionesDeProfesional(){
		if(self.buenaCalidadPromedio() && self.todosItemsDeCombateEfectivo() && self.esBuenExplorador()){
		return true
	}
	return false
}

}




object bomba {
  var danio = 150
  
  method esEfectivo() {
    return danio > 100
  }
  
  method capacidad(){
  	return danio/2
  }




   	
}

object pocion {
  
  var materiales = []
  var poderCurativo = 0
 
  
  method esEfectivo() {
    return poderCurativo > 50 and self.fueCreadaConAlgunMaterialMistico()
  }
  
  method fueCreadaConAlgunMaterialMistico() {
    return materiales.any({ material =>material.esMistico()})
  }
  method capacidad(){
   	return poderCurativo + 10* self.cantidadMaterialesMisticos()
   	}
  
  method cantidadMaterialesMisticos(){
  	return materiales.count({ item => item.esMistico()})
  }
  
}





object debilitador {
  var materiales = []
  var potencia = 0
  
  method esEfectivo() {
    return potencia > 0 and self.fueCreadoConAlgunMaterialMistico().negate()
  }
  
  method fueCreadoConAlgunMaterialMistico() {
    return materiales.any({ material =>material.esMistico()})
  }
 
  method cantidadMaterialesMisticos(){
  	return materiales.count({ item => item.esMistico()})
  }
  
  method capacidad(){
  	if(self.fueCreadoConAlgunMaterialMistico()){
		 return self.cantidadMaterialesMisticos()*12
	}
	return 5
  }
}