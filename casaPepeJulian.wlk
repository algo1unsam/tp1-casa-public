object casa {
  var viveres = 50 //porcentual
  const valorSuficiente = 40
  var montoReparacion = 0
  var property cuenta = cuentaCombinada
  
  method asignarCuenta(unaCuenta) {
    cuenta = unaCuenta
  }
  
  method tieneViveresSuficientes() = viveres > valorSuficiente
  
  method necesitaReparaciones() = montoReparacion > 0
  
  method montoReparacion(valor) {
    montoReparacion = valor
    self.gastar(valor)
  }
  
  method viveres(valor) {
    viveres = valor
  }
  
  method viveres() = viveres
  
  method estaEnOrden() = self.tieneViveresSuficientes() and (not self.necesitaReparaciones())
  
  method gastar(valor) {
    cuenta.extraer(valor)
  }
} //Cuentas bancarias

object cuentaCorriente {
  var property saldo = 0
  
  method depositar(valor) {
    //saldo = saldo + valor
    saldo += valor
  }
  
  method extraer(valor) {
    saldo -= valor
  }
}

object cuentaConGasto {
  var saldo = 0
  var costoOperacion = 0
  
  method depositar(valor) {
    saldo += valor - costoOperacion
  }
  
  method saldo() = saldo
  
  method extraer(valor) {
    saldo -= valor
  }
  
  method costoOperacion(valor) {
    costoOperacion = valor
  }
}

object cuentaCombinada {
  var primaria = cuentaConGasto
  var secundaria = cuentaCorriente
  
  method primaria(cuenta) {
    primaria = cuenta
  }
  
  method secundaria() = secundaria
  
  method secundaria(cuenta) {
    secundaria = cuenta
  }
  
  method primaria() = primaria
  
  method depositar(valor) {
    primaria.depositar(valor)
  }
  
  method extraer(valor) {
    if (primaria.saldo() > valor) primaria.extraer(valor)
    else secundaria.extraer(valor)
  }
  
  method saldo() = primaria.saldo() + secundaria.saldo()
}
