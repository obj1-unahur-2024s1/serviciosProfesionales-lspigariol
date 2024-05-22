// esta clase está completa, no necesita nada más
class ProfesionalAsociado {
	var property universidad

	method provinciasDondePuedeTrabajar() { return #{"Entre Ríos", "Corrientes", "Santa Fe"} }
	
	method honorariosPorHora() { return 3000 }

	method cobrar(monto){
		asociacionPL.donar(monto)
	}
}

object asociacionPL{
	var recaudado = 0

	method donar(importe){
		recaudado += importe
	}


}



// a esta clase le faltan métodos
class ProfesionalVinculado {
	var property universidad

	method provinciasDondePuedeTrabajar() =
	 [universidad.provincia()]

	method honorariosPorHora() = universidad.honorariosPorHora()
 
	method cobrar(monto){
		universidad.donar(monto/2)
	}

}


// a esta clase le faltan atributos y métodos
class ProfesionalLibre {
	var property universidad
	const property provincias = []	
	var property honorariosPorHora


}


class Universidad{

	var property honorariosPorHora
	var property provincia
	var donaciones = 0

	method donar(importe){
		donaciones += importe
	}

}
class Empresa{

  const empleados = []
  const clientes = #{}

  method contratar(emp){
	empleados.add(emp)
  }
  method puedeSatisfacer(solicitante) =
    empleados.any{ e=> solicitante.puedeSerAtendido(e)    }


  method darSercicio(solicitante){
	if (self.puedeSatisfacer(solicitante)){
		const elegido = empleados.anyOne()
		elegido.cobrar(elegido.honorariosPorHora())
		clientes.add(solicitante)
	}
  }
}

class Persona{

   var property provincia 

   	method puedeSerAtendido(profesional) = 
	profesional.provinciasDondePuedeTrabajar().contains(provincia)

}

class Institucion{
	const reconocidas = []

	method agregarReconocida(uni){
		reconocidas.add(uni)
	}

   	method puedeSerAtendido(profesional) = 
		reconocidas.contains(profesional.universidad())

}
