USE MediSistema;

-- 1. Número de pacientes atendidos por cada médico
SELECT
    m.id                            AS id_medico,
    CONCAT(m.nombre, ' ', m.apellido) AS medico,
    COUNT(p.id)                     AS numero_pacientes
FROM medico m
LEFT JOIN paciente p ON p.id_medico = m.id
GROUP BY m.id, m.nombre, m.apellido
ORDER BY numero_pacientes DESC;

-- 2. Total de días de vacaciones planificadas y disfrutadas por cada empleado
SELECT
    e.id                                  AS id_empleado,
    CONCAT(e.nombre, ' ', e.apellido)     AS empleado,
    COALESCE(SUM(CASE WHEN v.estado = 'PLANIFICADA'
                       THEN DATEDIFF(v.fecha_fin, v.fecha_inicio) END), 0) AS dias_planificados,
    COALESCE(SUM(CASE WHEN v.estado = 'DISFRUTADA'
                       THEN DATEDIFF(v.fecha_fin, v.fecha_inicio) END), 0) AS dias_disfrutados,
    COALESCE(SUM(DATEDIFF(v.fecha_fin, v.fecha_inicio)), 0)               AS total_dias
FROM empleado e
LEFT JOIN vacaciones_empleado v ON v.id_empleado = e.id
GROUP BY e.id, e.nombre, e.apellido
ORDER BY e.id;

-- 3. Médicos con mayor cantidad de horas de consulta en la semana
SELECT
    m.id                              AS id_medico,
    CONCAT(m.nombre, ' ', m.apellido) AS medico,
    SUM(TIME_TO_SEC(TIMEDIFF(h.hora_fin, h.hora_inicio))) / 3600 AS horas_semanales
FROM medico m
JOIN horario_consulta h ON h.id_medico = m.id
GROUP BY m.id, m.nombre, m.apellido
ORDER BY horas_semanales DESC;

-- 4. Número de sustituciones realizadas por cada médico sustituto
SELECT
    m.id                              AS id_medico,
    CONCAT(m.nombre, ' ', m.apellido) AS medico_sustituto,
    COUNT(s.id)                       AS numero_sustituciones
FROM medico m
JOIN tipo_medico tm ON tm.id = m.id_tipo_medico AND tm.nombre = 'Sustituto'
LEFT JOIN sustitucion s ON s.id_medico_sustituto = m.id
GROUP BY m.id, m.nombre, m.apellido
ORDER BY numero_sustituciones DESC;

-- 5. Número de médicos que están actualmente en sustitución
SELECT
    COUNT(DISTINCT s.id_medico_sustituido) AS medicos_en_sustitucion_actual
FROM sustitucion s
WHERE CURDATE() BETWEEN s.fecha_inicio AND s.fecha_fin;
