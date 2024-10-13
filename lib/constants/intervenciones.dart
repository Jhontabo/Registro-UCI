import 'package:registro_uci/features/intervenciones/domain/models/actividad.dart';
import 'package:registro_uci/features/intervenciones/domain/models/intervencion.dart';
import 'package:registro_uci/features/resultados/domain/models/indicador.dart';
import 'package:registro_uci/features/resultados/domain/models/resultado.dart';

final Map<String, Intervencion> mapaIntervenciones = {
  "NIC-001": const Intervencion(
    idIntervencion: "NIC-001",
    idNIC: "NIC-001",
    nombre: "Manejo del dolor",
  ),
  "NIC-002": const Intervencion(
    idIntervencion: "NIC-002",
    idNIC: "NIC-002",
    nombre: "Cuidados postoperatorios",
  ),
  "NIC-003": const Intervencion(
    idIntervencion: "NIC-003",
    idNIC: "NIC-003",
    nombre: "Vigilancia de la piel",
  ),
  "NIC-004": const Intervencion(
    idIntervencion: "NIC-004",
    idNIC: "NIC-004",
    nombre: "Control de infecciones",
  ),
  "NIC-005": const Intervencion(
    idIntervencion: "NIC-005",
    idNIC: "NIC-005",
    nombre: "Cuidados respiratorios",
  ),
  "NIC-006": const Intervencion(
    idIntervencion: "NIC-006",
    idNIC: "NIC-006",
    nombre: "Control de líquidos",
  ),
  "NIC-007": const Intervencion(
    idIntervencion: "NIC-007",
    idNIC: "NIC-007",
    nombre: "Manejo de la nutrición",
  ),
  "NIC-008": const Intervencion(
    idIntervencion: "NIC-008",
    idNIC: "NIC-008",
    nombre: "Terapia intravenosa",
  ),
  "NIC-009": const Intervencion(
    idIntervencion: "NIC-009",
    idNIC: "NIC-009",
    nombre: "Cuidados de la movilidad",
  ),
  "NIC-010": const Intervencion(
    idIntervencion: "NIC-010",
    idNIC: "NIC-010",
    nombre: "Vigilancia de los signos vitales",
  ),
  "NIC-011": const Intervencion(
    idIntervencion: "NIC-011",
    idNIC: "NIC-011",
    nombre: "Terapia de oxígeno",
  ),
  "NIC-012": const Intervencion(
    idIntervencion: "NIC-012",
    idNIC: "NIC-012",
    nombre: "Control de la glucosa",
  ),
  "NIC-013": const Intervencion(
    idIntervencion: "NIC-013",
    idNIC: "NIC-013",
    nombre: "Manejo de las vías aéreas",
  ),
  "NIC-014": const Intervencion(
    idIntervencion: "NIC-014",
    idNIC: "NIC-014",
    nombre: "Manejo de la fiebre",
  ),
  "NIC-015": const Intervencion(
    idIntervencion: "NIC-015",
    idNIC: "NIC-015",
    nombre: "Control de medicamentos",
  ),
  "NIC-016": const Intervencion(
    idIntervencion: "NIC-016",
    idNIC: "NIC-016",
    nombre: "Cuidados de heridas",
  ),
  "NIC-017": const Intervencion(
    idIntervencion: "NIC-017",
    idNIC: "NIC-017",
    nombre: "Manejo de la eliminación urinaria",
  ),
  "NIC-018": const Intervencion(
    idIntervencion: "NIC-018",
    idNIC: "NIC-018",
    nombre: "Cuidados de ostomía",
  ),
  "NIC-019": const Intervencion(
    idIntervencion: "NIC-019",
    idNIC: "NIC-019",
    nombre: "Manejo de la ansiedad",
  ),
  "NIC-020": const Intervencion(
    idIntervencion: "NIC-020",
    idNIC: "NIC-020",
    nombre: "Educación al paciente",
  ),
};

final Map<String, List<Actividad>> actividadesDeIntervencion = {
  "NIC-001": [
    const Actividad(
        idActividad: '001',
        descripcion: 'Evaluar el nivel de dolor del paciente.'),
    const Actividad(
        idActividad: '002',
        descripcion: 'Administrar analgesia según indicación médica.'),
  ],
  "NIC-002": [
    const Actividad(
        idActividad: '003',
        descripcion: 'Monitorizar signos vitales postcirugía.'),
    const Actividad(
        idActividad: '004',
        descripcion: 'Evaluar la herida quirúrgica y su curación.'),
  ],
  "NIC-003": [
    const Actividad(
        idActividad: '005',
        descripcion: 'Realizar inspección diaria de la piel.'),
    const Actividad(
        idActividad: '006',
        descripcion: 'Aplicar medidas para prevenir úlceras por presión.'),
  ],
  "NIC-004": [
    const Actividad(
        idActividad: '007',
        descripcion: 'Implementar medidas de control de infecciones.'),
    const Actividad(
        idActividad: '008',
        descripcion: 'Educar al paciente sobre la prevención de infecciones.'),
  ],
  "NIC-005": [
    const Actividad(
        idActividad: '009',
        descripcion: 'Monitorizar el esfuerzo respiratorio del paciente.'),
    const Actividad(
        idActividad: '010',
        descripcion: 'Asegurar una posición adecuada para la ventilación.'),
  ],
  "NIC-006": [
    const Actividad(
        idActividad: '011',
        descripcion: 'Monitorizar el equilibrio hídrico del paciente.'),
    const Actividad(
        idActividad: '012',
        descripcion: 'Administrar fluidos según prescripción médica.'),
  ],
  "NIC-007": [
    const Actividad(
        idActividad: '013',
        descripcion: 'Evaluar las necesidades nutricionales del paciente.'),
    const Actividad(
        idActividad: '014',
        descripcion: 'Planificar una dieta adecuada según el estado clínico.'),
  ],
  "NIC-008": [
    const Actividad(
        idActividad: '015',
        descripcion: 'Insertar y mantener accesos intravenosos.'),
    const Actividad(
        idActividad: '016',
        descripcion: 'Monitorizar las infusiones intravenosas.'),
  ],
  "NIC-009": [
    const Actividad(
        idActividad: '017',
        descripcion: 'Evaluar el rango de movilidad del paciente.'),
    const Actividad(
        idActividad: '018',
        descripcion:
            'Implementar un plan de ejercicios para mejorar la movilidad.'),
  ],
  "NIC-010": [
    const Actividad(
        idActividad: '019',
        descripcion: 'Monitorizar signos vitales cada 4 horas.'),
    const Actividad(
        idActividad: '020',
        descripcion: 'Registrar los cambios en los signos vitales.'),
  ],
  "NIC-011": [
    const Actividad(
        idActividad: '021',
        descripcion: 'Administrar oxígeno según indicación médica.'),
    const Actividad(
        idActividad: '022',
        descripcion: 'Monitorizar la saturación de oxígeno del paciente.'),
  ],
  "NIC-012": [
    const Actividad(
        idActividad: '023',
        descripcion: 'Controlar los niveles de glucosa en sangre.'),
    const Actividad(
        idActividad: '024',
        descripcion:
            'Administrar insulina o medicación antidiabética según prescripción.'),
  ],
  "NIC-013": [
    const Actividad(
        idActividad: '025',
        descripcion: 'Mantener la permeabilidad de las vías aéreas.'),
    const Actividad(
        idActividad: '026',
        descripcion: 'Aspirar secreciones según sea necesario.'),
  ],
  "NIC-014": [
    const Actividad(
        idActividad: '027',
        descripcion: 'Tomar la temperatura del paciente regularmente.'),
    const Actividad(
        idActividad: '028',
        descripcion: 'Administrar antipiréticos según indicación médica.'),
  ],
  "NIC-015": [
    const Actividad(
        idActividad: '029',
        descripcion: 'Administrar la medicación según el plan prescrito.'),
    const Actividad(
        idActividad: '030',
        descripcion: 'Controlar los efectos secundarios de los medicamentos.'),
  ],
  "NIC-016": [
    const Actividad(
        idActividad: '031',
        descripcion: 'Lavar y cubrir la herida con apósitos estériles.'),
    const Actividad(
        idActividad: '032',
        descripcion: 'Evaluar la cicatrización de la herida.'),
  ],
  "NIC-017": [
    const Actividad(
        idActividad: '033',
        descripcion: 'Monitorizar la frecuencia urinaria del paciente.'),
    const Actividad(
        idActividad: '034',
        descripcion: 'Educar sobre el manejo de catéteres.'),
  ],
  "NIC-018": [
    const Actividad(
        idActividad: '035', descripcion: 'Proporcionar cuidados a la ostomía.'),
    const Actividad(
        idActividad: '036',
        descripcion: 'Educar al paciente sobre el manejo de la ostomía.'),
  ],
  "NIC-019": [
    const Actividad(
        idActividad: '037',
        descripcion: 'Evaluar los niveles de ansiedad del paciente.'),
    const Actividad(
        idActividad: '038', descripcion: 'Ofrecer técnicas de relajación.'),
  ],
  "NIC-020": [
    const Actividad(
        idActividad: '039',
        descripcion: 'Proporcionar información clara sobre la enfermedad.'),
    const Actividad(
        idActividad: '040',
        descripcion: 'Instruir al paciente en el autocuidado.'),
  ],
};

final Map<String, List<Resultado>> resultadosDeIntervencion = {
  "NIC-001": [
    const Resultado(
      idResultado: 'NOC-143',
      idNOC: 'NOC-143',
      nombre: 'Control del dolor',
    ),
    const Resultado(
      idResultado: 'NOC-210',
      idNOC: 'NOC-210',
      nombre: 'Nivel de malestar',
    ),
  ],
  "NIC-002": [
    const Resultado(
      idResultado: 'NOC-290',
      idNOC: 'NOC-290',
      nombre: 'Recuperación postoperatoria',
    ),
    const Resultado(
      idResultado: 'NOC-2902',
      idNOC: 'NOC-2902',
      nombre: 'Estado de la herida quirúrgica',
    ),
  ],
  "NIC-003": [
    const Resultado(
      idResultado: 'NOC-1902',
      idNOC: 'NOC-1902',
      nombre: 'Integridad tisular: piel',
    ),
    const Resultado(
      idResultado: 'NOC-1103',
      idNOC: 'NOC-1103',
      nombre: 'Riesgo de úlceras por presión',
    ),
  ],
  "NIC-004": [
    const Resultado(
      idResultado: 'NOC-1834',
      idNOC: 'NOC-1834',
      nombre: 'Prevención de infecciones',
    ),
    const Resultado(
      idResultado: 'NOC-0703',
      idNOC: 'NOC-0703',
      nombre: 'Estado de infección',
    ),
  ],
  "NIC-005": [
    const Resultado(
      idResultado: 'NOC-0405',
      idNOC: 'NOC-0405',
      nombre: 'Estado respiratorio',
    ),
    const Resultado(
      idResultado: 'NOC-0403',
      idNOC: 'NOC-0403',
      nombre: 'Ventilación espontánea',
    ),
  ],
  "NIC-006": [
    const Resultado(
      idResultado: 'NOC-0410',
      idNOC: 'NOC-0410',
      nombre: 'Equilibrio de líquidos',
    ),
    const Resultado(
      idResultado: 'NOC-0605',
      idNOC: 'NOC-0605',
      nombre: 'Manejo de electrolitos',
    ),
  ],
  "NIC-007": [
    const Resultado(
      idResultado: 'NOC-1024',
      idNOC: 'NOC-1024',
      nombre: 'Estado nutricional',
    ),
    const Resultado(
      idResultado: 'NOC-0603',
      idNOC: 'NOC-0603',
      nombre: 'Ingesta de nutrientes',
    ),
  ],
  "NIC-008": [
    const Resultado(
      idResultado: 'NOC-2304',
      idNOC: 'NOC-2304',
      nombre: 'Manejo de infusión intravenosa',
    ),
    const Resultado(
      idResultado: 'NOC-2303',
      idNOC: 'NOC-2303',
      nombre: 'Complicaciones por terapia intravenosa',
    ),
  ],
  "NIC-009": [
    const Resultado(
      idResultado: 'NOC-0208',
      idNOC: 'NOC-0208',
      nombre: 'Movilidad física',
    ),
    const Resultado(
      idResultado: 'NOC-0205',
      idNOC: 'NOC-0205',
      nombre: 'Capacidad para caminar',
    ),
  ],
  "NIC-010": [
    const Resultado(
      idResultado: 'NOC-0412',
      idNOC: 'NOC-0412',
      nombre: 'Estado de los signos vitales',
    ),
    const Resultado(
      idResultado: 'NOC-1908',
      idNOC: 'NOC-1908',
      nombre: 'Estabilidad hemodinámica',
    ),
  ],
  "NIC-011": [
    const Resultado(
      idResultado: 'NOC-0404',
      idNOC: 'NOC-0404',
      nombre: 'Oxigenación tisular',
    ),
    const Resultado(
      idResultado: 'NOC-0414',
      idNOC: 'NOC-0414',
      nombre: 'Intercambio gaseoso',
    ),
  ],
  "NIC-012": [
    const Resultado(
      idResultado: 'NOC-2121',
      idNOC: 'NOC-2121',
      nombre: 'Control de la glucosa en sangre',
    ),
    const Resultado(
      idResultado: 'NOC-2122',
      idNOC: 'NOC-2122',
      nombre: 'Estabilidad glucémica',
    ),
  ],
  "NIC-013": [
    const Resultado(
      idResultado: 'NOC-0415',
      idNOC: 'NOC-0415',
      nombre: 'Permeabilidad de las vías aéreas',
    ),
    const Resultado(
      idResultado: 'NOC-0417',
      idNOC: 'NOC-0417',
      nombre: 'Limpieza de las vías respiratorias',
    ),
  ],
  "NIC-014": [
    const Resultado(
      idResultado: 'NOC-0805',
      idNOC: 'NOC-0805',
      nombre: 'Control de la temperatura',
    ),
    const Resultado(
      idResultado: 'NOC-0806',
      idNOC: 'NOC-0806',
      nombre: 'Temperatura corporal',
    ),
  ],
  "NIC-015": [
    const Resultado(
      idResultado: 'NOC-2107',
      idNOC: 'NOC-2107',
      nombre: 'Control de los efectos de la medicación',
    ),
    const Resultado(
      idResultado: 'NOC-2108',
      idNOC: 'NOC-2108',
      nombre: 'Cumplimiento de la terapia farmacológica',
    ),
  ],
  "NIC-016": [
    const Resultado(
      idResultado: 'NOC-1903',
      idNOC: 'NOC-1903',
      nombre: 'Cicatrización de heridas',
    ),
    const Resultado(
      idResultado: 'NOC-1904',
      idNOC: 'NOC-1904',
      nombre: 'Prevención de infecciones en heridas',
    ),
  ],
  "NIC-017": [
    const Resultado(
      idResultado: 'NOC-0505',
      idNOC: 'NOC-0505',
      nombre: 'Control de la eliminación urinaria',
    ),
    const Resultado(
      idResultado: 'NOC-0507',
      idNOC: 'NOC-0507',
      nombre: 'Continencia urinaria',
    ),
  ],
  "NIC-018": [
    const Resultado(
      idResultado: 'NOC-0509',
      idNOC: 'NOC-0509',
      nombre: 'Manejo de la ostomía',
    ),
    const Resultado(
      idResultado: 'NOC-0510',
      idNOC: 'NOC-0510',
      nombre: 'Autocuidado del estoma',
    ),
  ],
  "NIC-019": [
    const Resultado(
      idResultado: 'NOC-1210',
      idNOC: 'NOC-1210',
      nombre: 'Reducción de la ansiedad',
    ),
    const Resultado(
      idResultado: 'NOC-1202',
      idNOC: 'NOC-1202',
      nombre: 'Nivel de ansiedad',
    ),
  ],
  "NIC-020": [
    const Resultado(
      idResultado: 'NOC-1803',
      idNOC: 'NOC-1803',
      nombre: 'Conocimiento sobre la enfermedad',
    ),
    const Resultado(
      idResultado: 'NOC-1805',
      idNOC: 'NOC-1805',
      nombre: 'Conocimiento sobre el autocuidado',
    ),
  ],
};

final Map<String, List<Indicador>> indicadoresDeResultados = {
  'NOC-143': [
    const Indicador(idIndicador: '001', descripcion: 'Nivel de confort'),
    const Indicador(idIndicador: '002', descripcion: 'Intensidad del dolor'),
    const Indicador(idIndicador: '003', descripcion: 'Duración del dolor'),
  ],
  'NOC-210': [
    const Indicador(idIndicador: '001', descripcion: 'Frecuencia del malestar'),
    const Indicador(idIndicador: '002', descripcion: 'Severidad del malestar'),
  ],
  'NOC-290': [
    const Indicador(idIndicador: '001', descripcion: 'Tiempo de recuperación'),
    const Indicador(
        idIndicador: '002', descripcion: 'Complicaciones postoperatorias'),
  ],
  'NOC-2902': [
    const Indicador(
        idIndicador: '001',
        descripcion: 'Estado de cicatrización de la herida'),
    const Indicador(
        idIndicador: '002', descripcion: 'Presencia de infección en la herida'),
  ],
  'NOC-1902': [
    const Indicador(idIndicador: '001', descripcion: 'Estado de la piel'),
    const Indicador(
        idIndicador: '002', descripcion: 'Presencia de lesiones cutáneas'),
  ],
  'NOC-1103': [
    const Indicador(
        idIndicador: '001',
        descripcion: 'Grado de riesgo de úlceras por presión'),
    const Indicador(
        idIndicador: '002',
        descripcion: 'Prevención de complicaciones dérmicas'),
  ],
  'NOC-1834': [
    const Indicador(
        idIndicador: '001', descripcion: 'Tasa de infecciones evitadas'),
    const Indicador(
        idIndicador: '002', descripcion: 'Eficacia de las medidas preventivas'),
  ],
  'NOC-0703': [
    const Indicador(idIndicador: '001', descripcion: 'Presencia de infección'),
    const Indicador(
        idIndicador: '002',
        descripcion: 'Tratamiento efectivo de la infección'),
  ],
  'NOC-0405': [
    const Indicador(idIndicador: '001', descripcion: 'Frecuencia respiratoria'),
    const Indicador(idIndicador: '002', descripcion: 'Oximetría de pulso'),
  ],
  'NOC-0403': [
    const Indicador(
        idIndicador: '001',
        descripcion: 'Capacidad para mantener ventilación espontánea'),
    const Indicador(idIndicador: '002', descripcion: 'Saturación de oxígeno'),
  ],
  'NOC-0410': [
    const Indicador(
        idIndicador: '001', descripcion: 'Balance hídrico adecuado'),
    const Indicador(
        idIndicador: '002', descripcion: 'Signos de deshidratación'),
  ],
  'NOC-0605': [
    const Indicador(
        idIndicador: '001', descripcion: 'Nivel de electrolitos en sangre'),
    const Indicador(
        idIndicador: '002',
        descripcion: 'Presencia de desequilibrio electrolítico'),
  ],
  'NOC-1024': [
    const Indicador(
        idIndicador: '001', descripcion: 'Estado general de nutrición'),
    const Indicador(idIndicador: '002', descripcion: 'Índice de masa corporal'),
  ],
  'NOC-0603': [
    const Indicador(
        idIndicador: '001', descripcion: 'Cantidad de ingesta de nutrientes'),
    const Indicador(
        idIndicador: '002', descripcion: 'Diversidad de nutrientes ingeridos'),
  ],
  'NOC-2304': [
    const Indicador(
        idIndicador: '001',
        descripcion: 'Frecuencia de administración intravenosa adecuada'),
    const Indicador(
        idIndicador: '002',
        descripcion: 'Complicaciones relacionadas con infusión IV'),
  ],
  'NOC-2303': [
    const Indicador(
        idIndicador: '001',
        descripcion: 'Tasa de complicaciones por terapia intravenosa'),
    const Indicador(
        idIndicador: '002', descripcion: 'Eficacia de la terapia IV'),
  ],
  'NOC-0208': [
    const Indicador(idIndicador: '001', descripcion: 'Capacidad de movimiento'),
    const Indicador(idIndicador: '002', descripcion: 'Independencia física'),
  ],
  'NOC-0205': [
    const Indicador(idIndicador: '001', descripcion: 'Distancia caminada'),
    const Indicador(
        idIndicador: '002',
        descripcion: 'Capacidad para caminar sin asistencia'),
  ],
  'NOC-0412': [
    const Indicador(
        idIndicador: '001', descripcion: 'Estabilidad de los signos vitales'),
    const Indicador(
        idIndicador: '002',
        descripcion: 'Frecuencia cardíaca dentro de rangos normales'),
  ],
  'NOC-1908': [
    const Indicador(
        idIndicador: '001', descripcion: 'Estabilidad hemodinámica'),
    const Indicador(
        idIndicador: '002',
        descripcion: 'Presión arterial dentro de rangos normales'),
  ],
  'NOC-0404': [
    const Indicador(idIndicador: '001', descripcion: 'Oxigenación adecuada'),
    const Indicador(
        idIndicador: '002', descripcion: 'Saturación de oxígeno en sangre'),
  ],
  'NOC-0414': [
    const Indicador(
        idIndicador: '001', descripcion: 'Intercambio gaseoso adecuado'),
    const Indicador(
        idIndicador: '002',
        descripcion: 'Capacidad para respirar sin asistencia'),
  ],
  'NOC-2121': [
    const Indicador(
        idIndicador: '001',
        descripcion: 'Nivel de glucosa en sangre controlado'),
    const Indicador(
        idIndicador: '002', descripcion: 'Frecuencia de hipoglucemia'),
  ],
  'NOC-2122': [
    const Indicador(
        idIndicador: '001', descripcion: 'Estabilidad de niveles glucémicos'),
    const Indicador(
        idIndicador: '002',
        descripcion:
            'Frecuencia de complicaciones relacionadas con la glucosa'),
  ],
  'NOC-0415': [
    const Indicador(
        idIndicador: '001',
        descripcion: 'Permeabilidad de las vías respiratorias'),
    const Indicador(
        idIndicador: '002',
        descripcion: 'Frecuencia de obstrucción de vías aéreas'),
  ],
  'NOC-0417': [
    const Indicador(
        idIndicador: '001',
        descripcion: 'Eficacia de la limpieza de las vías respiratorias'),
    const Indicador(
        idIndicador: '002',
        descripcion: 'Frecuencia de acumulación de secreciones'),
  ],
  'NOC-0805': [
    const Indicador(
        idIndicador: '001',
        descripcion: 'Mantenimiento de la temperatura corporal'),
    const Indicador(
        idIndicador: '002',
        descripcion: 'Capacidad para regular la temperatura'),
  ],
  'NOC-0806': [
    const Indicador(
        idIndicador: '001',
        descripcion: 'Temperatura corporal dentro de rangos normales'),
    const Indicador(idIndicador: '002', descripcion: 'Frecuencia de fiebre'),
  ],
  'NOC-2107': [
    const Indicador(
        idIndicador: '001',
        descripcion:
            'Control efectivo de los efectos secundarios de medicamentos'),
    const Indicador(
        idIndicador: '002', descripcion: 'Tolerancia a los medicamentos'),
  ],
  'NOC-2108': [
    const Indicador(
        idIndicador: '001',
        descripcion: 'Cumplimiento del régimen farmacológico'),
    const Indicador(
        idIndicador: '002',
        descripcion: 'Adherencia a la medicación prescrita'),
  ],
  'NOC-1903': [
    const Indicador(
        idIndicador: '001',
        descripcion: 'Progreso de cicatrización de heridas'),
    const Indicador(
        idIndicador: '002',
        descripcion: 'Ausencia de complicaciones en la cicatrización'),
  ],
  'NOC-1904': [
    const Indicador(
        idIndicador: '001',
        descripcion: 'Prevención de infecciones en heridas'),
    const Indicador(idIndicador: '002', descripcion: 'Estado de la herida'),
  ],
  'NOC-0505': [
    const Indicador(
        idIndicador: '001',
        descripcion: 'Control efectivo de la eliminación urinaria'),
    const Indicador(
        idIndicador: '002', descripcion: 'Frecuencia de incontinencia'),
  ],
  'NOC-0507': [
    const Indicador(
        idIndicador: '001', descripcion: 'Nivel de continencia urinaria'),
    const Indicador(
        idIndicador: '002',
        descripcion: 'Capacidad para controlar la eliminación urinaria'),
  ],
  'NOC-0509': [
    const Indicador(
        idIndicador: '001', descripcion: 'Manejo adecuado de la ostomía'),
    const Indicador(
        idIndicador: '002',
        descripcion: 'Frecuencia de complicaciones en la ostomía'),
  ],
  'NOC-0510': [
    const Indicador(
        idIndicador: '001',
        descripcion: 'Capacidad para realizar autocuidado del estoma'),
    const Indicador(
        idIndicador: '002',
        descripcion: 'Grado de independencia en el manejo del estoma'),
  ],
  'NOC-1210': [
    const Indicador(idIndicador: '001', descripcion: 'Autocuidado adecuado'),
    const Indicador(
        idIndicador: '002',
        descripcion: 'Independencia en actividades diarias'),
  ],
};
