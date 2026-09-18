
CREATE DATABASE IF NOT EXISTS MediSistema
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_general_ci;

USE MediSistema;

CREATE TABLE tipo_medico (
    id     INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE especialidad (
    id     INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(60) NOT NULL UNIQUE
);

CREATE TABLE medico (
    id              INT AUTO_INCREMENT PRIMARY KEY,
    dni             VARCHAR(15)  NOT NULL UNIQUE,
    nombre          VARCHAR(50)  NOT NULL,
    apellido        VARCHAR(100) NOT NULL,
    telefono        VARCHAR(20),
    email           VARCHAR(100),
    id_tipo_medico  INT NOT NULL,
    activo          BOOLEAN NOT NULL DEFAULT TRUE,
    id_especialidad INT NOT NULL,
    CONSTRAINT fk_medico_tipo FOREIGN KEY (id_tipo_medico)
        REFERENCES tipo_medico (id),
    CONSTRAINT fk_medico_especialidad FOREIGN KEY (id_especialidad)
        REFERENCES especialidad (id)
);

CREATE TABLE horario_consulta (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    id_medico   INT NOT NULL,
    dia_semana  ENUM('LUNES', 'MARTES', 'MIERCOLES', 'JUEVES', 'VIERNES') NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fin    TIME NOT NULL,
    CONSTRAINT chk_horario_horas CHECK (hora_fin > hora_inicio),
    CONSTRAINT fk_horario_medico FOREIGN KEY (id_medico)
        REFERENCES medico (id)
);

CREATE TABLE sustitucion (
    id                   INT AUTO_INCREMENT PRIMARY KEY,
    id_medico_sustituto  INT NOT NULL,
    id_medico_sustituido INT NOT NULL,
    fecha_inicio         DATE NOT NULL,
    fecha_fin            DATE NOT NULL,
    motivo               ENUM('VACACIONES', 'BAJA', 'OTRO') NOT NULL,
    CONSTRAINT chk_sustitucion_fechas CHECK (fecha_fin > fecha_inicio),
    CONSTRAINT chk_sustitucion_distintos CHECK (id_medico_sustituto <> id_medico_sustituido),
    CONSTRAINT fk_sustitucion_sustituto FOREIGN KEY (id_medico_sustituto)
        REFERENCES medico (id),
    CONSTRAINT fk_sustitucion_sustituido FOREIGN KEY (id_medico_sustituido)
        REFERENCES medico (id)
);

CREATE TABLE tipo_empleado (
    id     INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE empleado (
    id               INT AUTO_INCREMENT PRIMARY KEY,
    dni              VARCHAR(15)  NOT NULL UNIQUE,
    nombre           VARCHAR(50)  NOT NULL,
    apellido         VARCHAR(100) NOT NULL,
    telefono         VARCHAR(20),
    email            VARCHAR(100),
    id_tipo_empleado INT NOT NULL,
    activo           BOOLEAN NOT NULL DEFAULT TRUE,
    CONSTRAINT fk_empleado_tipo FOREIGN KEY (id_tipo_empleado)
        REFERENCES tipo_empleado (id)
);

CREATE TABLE vacaciones_medico (
    id           INT AUTO_INCREMENT PRIMARY KEY,
    id_medico    INT NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin    DATE NOT NULL,
    estado       ENUM('PLANIFICADA', 'DISFRUTADA') NOT NULL DEFAULT 'PLANIFICADA',
    CONSTRAINT chk_vac_medico_fechas CHECK (fecha_fin > fecha_inicio),
    CONSTRAINT fk_vac_medico FOREIGN KEY (id_medico)
        REFERENCES medico (id)
);

CREATE TABLE vacaciones_empleado (
    id           INT AUTO_INCREMENT PRIMARY KEY,
    id_empleado  INT NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin    DATE NOT NULL,
    estado       ENUM('PLANIFICADA', 'DISFRUTADA') NOT NULL DEFAULT 'PLANIFICADA',
    CONSTRAINT chk_vac_empleado_fechas CHECK (fecha_fin > fecha_inicio),
    CONSTRAINT fk_vac_empleado FOREIGN KEY (id_empleado)
        REFERENCES empleado (id)
);

CREATE TABLE paciente (
    id        INT AUTO_INCREMENT PRIMARY KEY,
    dni       VARCHAR(15)  NOT NULL UNIQUE,
    nombre    VARCHAR(50)  NOT NULL,
    apellido  VARCHAR(100) NOT NULL,
    telefono  VARCHAR(20),
    email     VARCHAR(100),
    direccion VARCHAR(150),
    id_medico INT NOT NULL,
    CONSTRAINT fk_paciente_medico FOREIGN KEY (id_medico)
        REFERENCES medico (id)
);
