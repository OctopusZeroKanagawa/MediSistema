USE MediSistema;

INSERT INTO tipo_medico (nombre) VALUES
('Titular'),
('Interino'),
('Sustituto');

INSERT INTO especialidad (nombre) VALUES
('Medicina Familiar y Comunitaria'),
('Pediatría'),
('Medicina General');

INSERT INTO medico (dni, nombre, apellido, telefono, email, id_tipo_medico, activo, id_especialidad) VALUES
('10000001A', 'Carlos', 'Perez',    '600100001', 'cgomez@gmail.com',     1, TRUE, 1),
('10000002B', 'Laura',  'Martinez',  '600100002', 'lmartinez@gmail.com',  1, TRUE, 2),
('10000003C', 'Javier', 'Sánchez', '600100003', 'jsanchez@gmail.com',   2, TRUE, 3),
('10000004D', 'Marta',  'Lopez',     '600100004', 'mlopez@gmail.com',     3, TRUE, 1),
('10000005E', 'Pablo',  'Gil',  '600100005', 'pfernandez@gmail.com', 3, TRUE, 3),
('10000006F', 'Elena',  'Duarte',   '600100006', 'enavarro@gmail.com',   1, TRUE, 2);

INSERT INTO horario_consulta (id_medico, dia_semana, hora_inicio, hora_fin) VALUES

(1, 'LUNES',     '09:00', '14:00'),
(1, 'VIERNES',   '09:00', '14:00'),
(2, 'LUNES',     '15:00', '20:00'),
(3, 'JUEVES',    '09:00', '15:00'),
(4, 'LUNES',     '09:00', '14:00'),
(4, 'MARTES',    '09:00', '14:00'),
(4, 'JUEVES',    '09:00', '14:00'),
(5, 'VIERNES',   '09:00', '13:00'),
(6, 'LUNES',     '10:00', '15:00'),
(6, 'VIERNES',   '10:00', '15:00');

INSERT INTO sustitucion (id_medico_sustituto, id_medico_sustituido, fecha_inicio, fecha_fin, motivo) VALUES
(4, 1, '2026-01-05', '2026-01-16', 'VACACIONES'),
(5, 2, '2026-04-06', '2026-04-17', 'VACACIONES'),
(5, 4, '2026-06-01', '2026-08-31', 'BAJA'),
(4, 6, '2026-07-06', '2026-07-24', 'VACACIONES'),
(4, 3, '2026-09-14', '2026-09-25', 'VACACIONES');

INSERT INTO tipo_empleado (nombre) VALUES
('ATS'),
('Auxiliar de enfermería'),
('Celador'),
('Administrativo');

INSERT INTO empleado (dni, nombre, apellido, telefono, email, id_tipo_empleado, activo) VALUES
('20000001A', 'Ana',    'Romero',   '610200001', 'aromero@gmail.com',   1, TRUE),
('20000004D', 'Diego',  'Ramirez',  '610200004', 'dortega@gmail.com',   2, TRUE),
('20000005E', 'Manuel', 'Campos',   '610200005', 'mrios@gmail.com',     3, TRUE),
('20000008H', 'Andres', 'Rueda',   '610200008', 'ablanco@gmail.com',   4, TRUE);

INSERT INTO vacaciones_medico (id_medico, fecha_inicio, fecha_fin, estado) VALUES
(1, '2026-09-14', '2026-09-25', 'PLANIFICADA'),
(1, '2026-01-05', '2026-01-16', 'DISFRUTADA'),
(2, '2026-04-06', '2026-04-17', 'DISFRUTADA'),
(3, '2026-12-21', '2027-01-01', 'PLANIFICADA'),
(6, '2026-07-06', '2026-07-24', 'DISFRUTADA'),
(6, '2026-12-14', '2026-12-23', 'PLANIFICADA'),
(3, '2026-11-02', '2026-11-13', 'PLANIFICADA');

INSERT INTO vacaciones_empleado (id_empleado, fecha_inicio, fecha_fin, estado) VALUES
(1, '2026-08-03', '2026-08-21', 'DISFRUTADA'),
(2, '2026-09-14', '2026-09-30', 'PLANIFICADA'),
(3, '2026-07-13', '2026-07-31', 'DISFRUTADA');

INSERT INTO paciente (dni, nombre, apellido, telefono, email, direccion, id_medico) VALUES
('30000001A', 'María',   'García Lozano',   '620300001', 'maria@gmail.com',    'Calle Mayor 12',    1),
('30000002B', 'José',    'Pérez Duarte',    '620300002', 'jose@gmail.com',      'Av. Libertad 45',   1),
('30000003C', 'Lucía',   'Fuentes Ramos',   '620300003', 'lucia@gmail.com',   'Calle Olmo 8',      6),
('30000004D', 'Antonio', 'Serrano Bravo',   '620300004', 'antonio@gmail.com', 'Plaza Nueva 3',     2),
('30000005E', 'Carmen',  'Iglesias Mena',   '620300005', 'carmen@gmail.com', 'Calle Sol 27',      5),
('30000006F', 'Pedro',   'Cano Prieto',     '620300006', 'pedro@gmail.com',      'Calle Luna 5',      3),
('30000013N', 'Isabel',  'Crespo Ávila',    '620300013', 'isabel@gmail.com',   'Calle Cedro 9',     1),
('30000014P', 'Tomás',   'Escudero Paz',    '620300014', 'tomas@gmail.com',  'Calle Nogal 17',    4);
