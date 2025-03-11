-- PRUEBA TÉCNICA SKANDIA - PUNTO 3: MODELADO Y CONSULTAS SQL
-- Autor: FLAVIO ALEXANDER NAVARRO CARMONA - ASPIRANTE A * Especialista de Desarrollo de Aplicaciones IT *

-- ***********************************
-- 1. CREACIÓN DE TABLAS
-- ***********************************

-- Tabla: Persona
CREATE TABLE Persona (
    PersonaID INT PRIMARY KEY,
    TipoPersona VARCHAR(20), -- 'Natural' o 'Juridica'
    TipoDocumento VARCHAR(30),
    NumeroDocumento VARCHAR(30),
    Nombres VARCHAR(100),
    Apellidos VARCHAR(100),
    RazonSocial VARCHAR(150),
    TipoEmpresa VARCHAR(50),
    RepresentanteLegalID INT,
    DepartamentoResidencia VARCHAR(50),
    MunicipioResidencia VARCHAR(50)
);

-- Tabla: RolPersona
CREATE TABLE RolPersona (
    PersonaID INT,
    Rol VARCHAR(50),
    PRIMARY KEY (PersonaID, Rol),
    FOREIGN KEY (PersonaID) REFERENCES Persona(PersonaID)
);

-- Tabla: CuentaAhorro
CREATE TABLE CuentaAhorro (
    CuentaID INT PRIMARY KEY,
    NumeroCuenta VARCHAR(20) UNIQUE,
    SaldoTotal DECIMAL(18,2),
    SaldoCanje DECIMAL(18,2),
    SaldoDisponible DECIMAL(18,2),
    Estado VARCHAR(10)
);

-- Tabla: TitularesCuenta
CREATE TABLE TitularesCuenta (
    CuentaID INT,
    PersonaID INT,
    PRIMARY KEY (CuentaID, PersonaID),
    FOREIGN KEY (CuentaID) REFERENCES CuentaAhorro(CuentaID),
    FOREIGN KEY (PersonaID) REFERENCES Persona(PersonaID)
);

-- Tabla: MovimientoCuenta
CREATE TABLE MovimientoCuenta (
    MovimientoID INT PRIMARY KEY,
    CuentaID INT,
    TipoMovimiento VARCHAR(30),
    Monto DECIMAL(18,2),
    FechaTransaccion DATE,
    NumeroTransaccion VARCHAR(30),
    FOREIGN KEY (CuentaID) REFERENCES CuentaAhorro(CuentaID)
);

-- Tabla: TarjetaCredito
CREATE TABLE TarjetaCredito (
    TarjetaID INT PRIMARY KEY,
    NumeroTarjeta VARCHAR(20),
    Franquicia VARCHAR(50),
    CupoAprobado DECIMAL(18,2),
    CupoDisponible DECIMAL(18,2),
    Estado VARCHAR(10),
    TitularID INT,
    FOREIGN KEY (TitularID) REFERENCES Persona(PersonaID)
);

-- Tabla: MovimientoTarjeta
CREATE TABLE MovimientoTarjeta (
    MovimientoID INT PRIMARY KEY,
    TarjetaID INT,
    TipoMovimiento VARCHAR(30),
    Monto DECIMAL(18,2),
    FechaTransaccion DATE,
    NumeroTransaccion VARCHAR(30),
    FOREIGN KEY (TarjetaID) REFERENCES TarjetaCredito(TarjetaID)
);

-- Tabla: Accionista
CREATE TABLE Accionista (
    EmpresaID INT,
    PersonaID INT,
    PRIMARY KEY (EmpresaID, PersonaID),
    FOREIGN KEY (EmpresaID) REFERENCES Persona(PersonaID),
    FOREIGN KEY (PersonaID) REFERENCES Persona(PersonaID)
);

-- ***************************************
-- 2. CONSULTA 1
-- **************************************
-- Deuda total de Tarjeta de Crédito por Franquicia

SELECT 
    tc.Franquicia,
    SUM(
        CASE 
            WHEN mt.TipoMovimiento IN ('Compra Nacional', 'Cuota de Manejo', 'Retiros por Avance') THEN mt.Monto
            WHEN mt.TipoMovimiento = 'Pago de Tarjeta' THEN -mt.Monto
            ELSE 0
        END
    ) AS DeudaTotal
FROM TarjetaCredito tc
JOIN MovimientoTarjeta mt ON tc.TarjetaID = mt.TarjetaID
GROUP BY tc.Franquicia;
