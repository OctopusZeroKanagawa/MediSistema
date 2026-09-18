# MediSistema

Base de datos para la gestión de un centro de salud: médicos (titulares, interinos y sustitutos), empleados no médicos, pacientes, horarios de consulta, sustituciones y vacaciones.

## Contenido del repositorio

- `estructura.sql` — Creación de la base de datos y de todas las tablas, con sus claves primarias, foráneas y restricciones (`CHECK`) de integridad.
- `datos.sql` — Datos de prueba para todas las tablas (médicos, empleados, pacientes, horarios, sustituciones y vacaciones).
- `consultas.sql` — Las 5 consultas SQL solicitadas.
- `README.md` — Este documento.

## Cómo ejecutar el proyecto en MySQL

1. Abrir una terminal o MySQL Workbench con acceso a un servidor MySQL.
2. Ejecutar el script de estructura (crea la base de datos `MediSistema` y todas las tablas):
   ```bash
   mysql -u tu_usuario -p < estructura.sql
   ```
3. Ejecutar el script de datos (inserta los registros de prueba):
   ```bash
   mysql -u tu_usuario -p < datos.sql
   ```
4. Ejecutar las consultas:
   ```bash
   mysql -u tu_usuario -p < consultas.sql
   ```
   o abrir `consultas.sql` en MySQL Workbench y ejecutarlas una por una.

> **Nota:** `estructura.sql` crea la base de datos con `CREATE DATABASE IF NOT EXISTS MediSistema CHARACTER SET utf8mb4`, necesario porque varios nombres de la tabla `paciente`/`medico` incluyen tildes y la letra "ñ".

## Modelo de datos (resumen)

- `tipo_medico` (1) — `medico` (N): cada médico es titular, interino o sustituto.
- `especialidad` (1) — `medico` (N).
- `medico` (1) — `horario_consulta` (N): franjas horarias semanales de consulta.
- `medico` (1) — `sustitucion` (N), dos veces: como sustituto (`id_medico_sustituto`) y como sustituido (`id_medico_sustituido`).
- `medico` (1) — `vacaciones_medico` (N).
- `tipo_empleado` (1) — `empleado` (N).
- `empleado` (1) — `vacaciones_empleado` (N).
- `medico` (1) — `paciente` (N): cada paciente tiene un médico asignado.

## Consultas

### 1. Número de pacientes atendidos por cada médico

### 3. Médicos con mayor cantidad de horas de consulta en la semana


### 4. Número de sustituciones realizadas por cada médico sustituto

### 5. Número de médicos que están actualmente en sustitución

### 7. Médico con mayor cantidad de pacientes asignados


