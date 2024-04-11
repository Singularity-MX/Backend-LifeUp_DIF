
CREATE DATABASE Life_Up_DB;
USE Life_Up_DB;

-- Nueva Estructura de DB--------------------------------------------------------

CREATE TABLE Users (
  UserID varchar(100) NOT NULL,
  Email varchar(50) NOT NULL,
  Password varchar(100) NOT NULL,
  Rol varchar(50) NOT NULL,
  ID_Centro varchar(20) NOT NULL,
  PRIMARY KEY (UserID) -- Definir UserID como clave primaria
);


--
-- Estructura de tabla para la tabla `InformationPersonal`
--
CREATE TABLE InformationPersonal (
  UserID varchar(100) NOT NULL,
  Nombre varchar(50) NOT NULL,
  ApellidoP varchar(50) NOT NULL,
  ApellidoM varchar(50) NOT NULL,
  PRIMARY KEY (UserID)
);


-- Estructura de tabla para la tabla `centros`
CREATE TABLE centros (
  ID_Centro varchar(20) NOT NULL,
  Nombre varchar(100) NOT NULL,
  Direccion varchar(200) NOT NULL,
  ID_Delegacion varchar(50) NOT NULL,
  CodigoPostal int(5) NOT NULL,
  PRIMARY KEY (ID_Centro)
);

-- Estructura de tabla para la tabla `delegacion`
CREATE TABLE delegacion (
  ID_Delegacion varchar(20) NOT NULL,
  Nombre varchar(100) NOT NULL,
  PRIMARY KEY (ID_Delegacion)
);

-- Volcado de datos para la tabla `delegacion`
INSERT INTO `delegacion` (`ID_Delegacion`, `Nombre`) VALUES
('DL-01', 'Cerro Gordo'),
('DL-02', 'Las Joyas'),
('DL-03', 'Coecillo'),
('DL-04', 'San Juan Bosco'),
('DL-05', 'San Miguel'),
('DL-06', 'Del Carmen'),
('DL-07', 'Cerrito de Jerez');


INSERT INTO `centros` (`ID_Centro`, `Nombre`, `Direccion`, `ID_Delegacion`, `CodigoPostal`) VALUES
('CEDIF-01', 'Centro Gerontológico San Juan de Dios', 'Plaza Revolución 107, San Juan de Dios, León, Gto', 'DL-05', 37004),
('CEDIF-02', 'Sistema Nacional para el Desarrollo Integral de la Familia', 'Familia San Bruno 102, Jardines de Los Naranjos, Praderas de Santa Rosa, León, Gto', 'DL-03', 37210),
('CEDIF-03', 'La Casa de los Abuelos', 'Juan Bautista La Salle 303, Panorama, León, Gto', 'DL-01', 37160);





/*
---- CREAR UAUARIO ADMINISTRADOR ----

CREATE USER 'AdminDif'@'localhost' IDENTIFIED BY 'EcabLUgdwUd71Lw';
GRANT ALL PRIVILEGES ON Life_Up_DB.* TO 'AdminDif'@'localhost';
FLUSH PRIVILEGES;


INSERT INTO Users (UserID, Email, Password, Rol, ID_Centro)
VALUES ('Admin1234567890', 'admin@dif.com', 'c1c224b03cd9bc7b6a86d77f5dace40191766c485cd55dc48caf9ac873335d6f', 'Administrador', 'CEDIF-01');

INSERT INTO InformationPersonal (UserID, Nombre, ApellidoP, ApellidoM)
VALUES ('Admin1234567890', 'Juan', 'Pérez', 'Gómez');

http://localhost:3000/AppConnection/Login
{
  "Email": "admin@dif.com",
  "Password": "Admin"
}
*/








--
-- Volcado de datos para la tabla `centros`
--

INSERT INTO `centros` (`ID_Centro`, `Nombre`, `Direccion`, `Delegacion`, `CodigoPostal`) VALUES
('CEDIF-01', 'Centro Gerontológico San Juan de Dios', 'Plaza Revolución 107, San Juan de Dios,  León, Gto', 'San Miguel', 37004),
('CEDIF-02', 'Sistema Nacional para el Desarrollo Integral de la Familia', 'Familia San Bruno 102, Jardines de Los Naranjos, Praderas de Santa Rosa, León, Gto', 'Coecillo', 37210),
('CEDIF-03', 'La Casa de los Abuelos', 'Juan Bautista La Salle 303, Panorama, León, Gto', 'Cerro Gordo', 37160);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contactoemergencia`
--

CREATE TABLE `contactoemergencia` (
  `UserID` varchar(100) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `ApellidoPaterno` varchar(50) NOT NULL,
  `ApellidoMaterno` varchar(50) NOT NULL,
  `Telefono` int(100) NOT NULL,
  `Parentesco` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direcciones`
--

CREATE TABLE `direcciones` (
  `UserID` varchar(100) NOT NULL,
  `Calle` varchar(50) NOT NULL,
  `Colonia` varchar(20) NOT NULL,
  `CodigoPostal` int(5) NOT NULL,
  `Delegacion` varchar(20) NOT NULL,
  `Ciudad` varchar(50) NOT NULL,
  `Estado` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fotouser`
--

CREATE TABLE `fotouser` (
  `UserID` varchar(100) NOT NULL,
  `FotoURL` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `numerousuarios`
--

CREATE TABLE `numerousuarios` (
  `Indice` int(11) NOT NULL,
  `User_ID` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `numerousuarios`
--

INSERT INTO `numerousuarios` (`Indice`, `User_ID`) VALUES
(1, 'INIT');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal`
--

CREATE TABLE `personal` (
  `PersonalID` varchar(20) NOT NULL,
  `Rol` varchar(50) NOT NULL,
  `ID_Centro` varchar(20) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Password` varchar(10000) NOT NULL,
  `Acceso` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `personal`
--

INSERT INTO `personal` (`PersonalID`, `Rol`, `ID_Centro`, `Email`, `Password`, `Acceso`) VALUES
('CEDIF-01P232', 'Psicología', 'CEDIF-01', 'psicologia@dif.com', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'ÁREA DE PSICOLOGÍA'),
('CEDIF-01P233', 'Enfermería', 'CEDIF-01', 'enfermeria@dif.com', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'ÁREA DE ENFERMERÍA'),
('CEDIF-01P234', 'Instructor', 'CEDIF-01', 'instructora@dif.com', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'ÁREA DE TALLERES Y ACTIVIDADES'),
('CEDIF-01P235', 'Administración', 'CEDIF-01', 'administradora@dif.com', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'TODAS LAS ÁREAS'),
('CEDIF-01P236', 'Recepción', 'CEDIF-01', 'recepcionista@dif.com', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'ÁREA DE REGISTRO DE USUARIOS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `psicologia`
--

CREATE TABLE `psicologia` (
  `Numero` int(11) NOT NULL,
  `UserID` varchar(100) NOT NULL,
  `Motivo` varchar(50) NOT NULL,
  `Objetivos` text NOT NULL,
  `Recomendaciones` varchar(100) NOT NULL,
  `Fecha` varchar(15) NOT NULL,
  `PersonalID` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salud_consultas`
--

CREATE TABLE `salud_consultas` (
  `UserID` varchar(100) NOT NULL,
  `PersonalID` varchar(100) NOT NULL,
  `FrecuenciaCardiaca` int(15) NOT NULL,
  `FrecuenciaRespiratoria` int(15) NOT NULL,
  `Glucosa` int(15) NOT NULL,
  `SatOxigeno` int(15) NOT NULL,
  `PresionArterial` varchar(15) NOT NULL,
  `Medicacion` text NOT NULL,
  `Fecha` varchar(50) NOT NULL,
  `NumeroConsulta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salud_expedientes`
--

CREATE TABLE `salud_expedientes` (
  `UserID` varchar(10) NOT NULL,
  `PersonalID` varchar(10) NOT NULL,
  `Alergias` varchar(50) NOT NULL,
  `Padecimientos` text NOT NULL,
  `NumeroExpediente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `superusuarios`
--

CREATE TABLE `superusuarios` (
  `SU_ID` int(11) NOT NULL,
  `Username` varchar(40) NOT NULL,
  `Contraseña` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `superusuarios`
--

INSERT INTO `superusuarios` (`SU_ID`, `Username`, `Contraseña`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `talleres`
--

CREATE TABLE `talleres` (
  `TallerID` varchar(100) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `CentroID` varchar(20) NOT NULL,
  `Instructor` varchar(100) NOT NULL,
  `Duracion` int(5) NOT NULL,
  `Dias` varchar(200) NOT NULL,
  `Hora` varchar(100) NOT NULL,
  `NumeroTaller` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `UserID` varchar(50) NOT NULL,
  `CentroID` varchar(50) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `ApellidoPaterno` varchar(100) NOT NULL,
  `ApellidoMaterno` varchar(100) NOT NULL,
  `Edad` varchar(10) NOT NULL,
  `Telefono` varchar(10) NOT NULL,
  `Sexo` varchar(50) NOT NULL,
  `Fecha` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asistencia`
--
ALTER TABLE `asistencia`
  ADD PRIMARY KEY (`TallerID`);

--
-- Indices de la tabla `centros`
--
ALTER TABLE `centros`
  ADD PRIMARY KEY (`ID_Centro`);

--
-- Indices de la tabla `contactoemergencia`
--
ALTER TABLE `contactoemergencia`
  ADD PRIMARY KEY (`UserID`);

--
-- Indices de la tabla `direcciones`
--
ALTER TABLE `direcciones`
  ADD PRIMARY KEY (`UserID`);

--
-- Indices de la tabla `fotouser`
--
ALTER TABLE `fotouser`
  ADD PRIMARY KEY (`UserID`);

--
-- Indices de la tabla `numerousuarios`
--
ALTER TABLE `numerousuarios`
  ADD PRIMARY KEY (`Indice`);

--
-- Indices de la tabla `personal`
--
ALTER TABLE `personal`
  ADD PRIMARY KEY (`PersonalID`);

--
-- Indices de la tabla `psicologia`
--
ALTER TABLE `psicologia`
  ADD PRIMARY KEY (`Numero`);

--
-- Indices de la tabla `salud_consultas`
--
ALTER TABLE `salud_consultas`
  ADD PRIMARY KEY (`NumeroConsulta`);

--
-- Indices de la tabla `salud_expedientes`
--
ALTER TABLE `salud_expedientes`
  ADD PRIMARY KEY (`NumeroExpediente`);

--
-- Indices de la tabla `superusuarios`
--
ALTER TABLE `superusuarios`
  ADD PRIMARY KEY (`SU_ID`);

--
-- Indices de la tabla `talleres`
--
ALTER TABLE `talleres`
  ADD PRIMARY KEY (`NumeroTaller`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`UserID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `numerousuarios`
--
ALTER TABLE `numerousuarios`
  MODIFY `Indice` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `psicologia`
--
ALTER TABLE `psicologia`
  MODIFY `Numero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `salud_consultas`
--
ALTER TABLE `salud_consultas`
  MODIFY `NumeroConsulta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `salud_expedientes`
--
ALTER TABLE `salud_expedientes`
  MODIFY `NumeroExpediente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `superusuarios`
--
ALTER TABLE `superusuarios`
  MODIFY `SU_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `talleres`
--
ALTER TABLE `talleres`
  MODIFY `NumeroTaller` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
