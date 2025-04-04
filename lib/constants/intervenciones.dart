import 'package:registro_uci/features/intervenciones/domain/models/actividad.dart';
import 'package:registro_uci/features/intervenciones/domain/models/intervencion.dart';
import 'package:registro_uci/features/resultados/domain/models/indicador.dart';
import 'package:registro_uci/features/resultados/domain/models/resultado.dart';

final Map<String, Intervencion> mapaIntervenciones = {
  // REGIÓN CEFÁLICA (CABEZA Y CUELLO)
  "NIC-3160": const Intervencion(
    idIntervencion: "NIC-3160",
    idNIC: "3160",
    nombre: "Manejo de la Vía Aérea Artificial",
  ),
  "NIC-2620": const Intervencion(
    idIntervencion: "NIC-2620",
    idNIC: "2620",
    nombre: "Monitorización Neurológica",
  ),
  "NIC-2940": const Intervencion(
    idIntervencion: "NIC-2940",
    idNIC: "2940",
    nombre: "Control de la Presión Intracraneana",
  ),
  "NIC-3180": const Intervencion(
    idIntervencion: "NIC-3180",
    idNIC: "3180",
    nombre: "Cuidados de la Cánula de Traqueostomía",
  ),
  "NIC-3320": const Intervencion(
    idIntervencion: "NIC-3320",
    idNIC: "3320",
    nombre: "Administración de Oxígeno",
  ),
  "NIC-2390": const Intervencion(
    idIntervencion: "NIC-2390",
    idNIC: "2390",
    nombre: "Control de la Sedación y Analgesia",
  ),
  "NIC-4040": const Intervencion(
    idIntervencion: "NIC-4040",
    idNIC: "4040",
    nombre: "Monitorización de la Presión Arterial No Invasiva e Invasiva",
  ),
  "NIC-1660": const Intervencion(
    idIntervencion: "NIC-1660",
    idNIC: "1660",
    nombre: "Cuidados de los Ojos en Pacientes Críticos",
  ),
  "NIC-1400": const Intervencion(
    idIntervencion: "NIC-1400",
    idNIC: "1400",
    nombre: "Manejo del Dolor Neurológico y Cefalea",
  ),
  "NIC-2445": const Intervencion(
    idIntervencion: "NIC-2445",
    idNIC: "2445",
    nombre: "Mantenimiento del Acceso Venoso Central",
  ),
  "NIC-4120": const Intervencion(
    idIntervencion: "NIC-4120",
    idNIC: "4120",
    nombre: "Monitorización de la Perfusión Cerebral",
  ),
  "NIC-3900": const Intervencion(
    idIntervencion: "NIC-3900",
    idNIC: "3900",
    nombre: "Control de la Hipotermia/Hipertermia",
  ),
  "NIC-3540": const Intervencion(
    idIntervencion: "NIC-3540",
    idNIC: "3540",
    nombre: "Protección de la Piel en Pacientes con Ventilación Mecánica",
  ),
  "NIC-3165": const Intervencion(
    idIntervencion: "NIC-3165",
    idNIC: "3165",
    nombre: "Aspiración de Secreciones",
  ),
  "NIC-3200": const Intervencion(
    idIntervencion: "NIC-3200",
    idNIC: "3200",
    nombre: "Prevención del Broncoaspirado",
  ),
  "NIC-2625": const Intervencion(
    idIntervencion: "NIC-2625",
    idNIC: "2625",
    nombre: "Evaluación del Reflejo Pupilar y Signos Neurológicos",
  ),
  "NIC-1710": const Intervencion(
    idIntervencion: "NIC-1710",
    idNIC: "1710",
    nombre: "Higiene Bucal en Pacientes Intubados",
  ),
  "NIC-6400": const Intervencion(
    idIntervencion: "NIC-6400",
    idNIC: "6400",
    nombre: "Manejo de Crisis Convulsivas",
  ),
  "NIC-6440": const Intervencion(
    idIntervencion: "NIC-6440",
    idNIC: "6440",
    nombre: "Detección y Control de Delirium en UCI",
  ),
  "NIC-4820": const Intervencion(
    idIntervencion: "NIC-4820",
    idNIC: "4820",
    nombre: "Prevención del Síndrome de Abstinencia en Pacientes Sedados",
  ),

  // REGIÓN TORÁCICA
  "NIC-4220": const Intervencion(
    idIntervencion: "NIC-4220",
    idNIC: "4220",
    nombre: "Monitorización Cardiovascular",
  ),
  "NIC-4250": const Intervencion(
    idIntervencion: "NIC-4250",
    idNIC: "4250",
    nombre: "Monitorización de la Hemodinámica Invasiva",
  ),
  "NIC-4210": const Intervencion(
    idIntervencion: "NIC-4210",
    idNIC: "4210",
    nombre: "Administración de Medicación Cardiovascular",
  ),
  "NIC-1410": const Intervencion(
    idIntervencion: "NIC-1410",
    idNIC: "1410",
    nombre: "Control del Dolor Torácico",
  ),
  "NIC-3430": const Intervencion(
    idIntervencion: "NIC-3430",
    idNIC: "3430",
    nombre: "Manejo del Drenaje Torácico",
  ),
  "NIC-3350": const Intervencion(
    idIntervencion: "NIC-3350",
    idNIC: "3350",
    nombre: "Monitorización de la Respuesta Pulmonar a la Ventilación",
  ),
  "NIC-3325": const Intervencion(
    idIntervencion: "NIC-3325",
    idNIC: "3325",
    nombre: "Monitorización de la Saturación de Oxígeno",
  ),
  "NIC-3250": const Intervencion(
    idIntervencion: "NIC-3250",
    idNIC: "3250",
    nombre: "Fisioterapia Torácica",
  ),

  "NIC-3355": const Intervencion(
    idIntervencion: "NIC-3355",
    idNIC: "3355",
    nombre: "Prevención de la Neumonía Asociada a Ventilador",
  ),
  "NIC-1415-T": const Intervencion(
    idIntervencion: "NIC-1415",
    idNIC: "1415",
    nombre: "Manejo del Dolor Postoperatorio Torácico",
  ),
  "NIC-1415-A": const Intervencion(
    idIntervencion: "NIC-1415",
    idNIC: "1415",
    nombre: "Manejo del Dolor Abdominal",
  ),

  "NIC-2900-T": const Intervencion(
    idIntervencion: "NIC-2900",
    idNIC: "2900",
    nombre: "Cuidado del Paciente con Cirugía Torácica",
  ),

  "NIC-2900-A": const Intervencion(
    idIntervencion: "NIC-2900",
    idNIC: "2900",
    nombre: "Manejo del Paciente con Cirugía Abdominal",
  ),
  "NIC-3322": const Intervencion(
    idIntervencion: "NIC-3322",
    idNIC: "3322",
    nombre: "Manejo del Paciente con Insuficiencia Respiratoria Aguda",
  ),
  "NIC-4140": const Intervencion(
    idIntervencion: "NIC-4140",
    idNIC: "4140",
    nombre: "Monitorización de la Presión Arterial No Invasiva",
  ),
  "NIC-3326": const Intervencion(
    idIntervencion: "NIC-3326",
    idNIC: "3326",
    nombre: "Cuidado del Paciente con Edema Pulmonar",
  ),
  "NIC-2920": const Intervencion(
    idIntervencion: "NIC-2920",
    idNIC: "2920",
    nombre: "Prevención de Tromboembolismo Pulmonar",
  ),

  // REGIÓN ABDOMINAL
  "NIC-1050": const Intervencion(
    idIntervencion: "NIC-1050",
    idNIC: "1050",
    nombre: "Manejo de la Nutrición Enteral",
  ),
  "NIC-1052": const Intervencion(
    idIntervencion: "NIC-1052",
    idNIC: "1052",
    nombre: "Manejo de la Nutrición Parenteral",
  ),
  "NIC-2010": const Intervencion(
    idIntervencion: "NIC-2010",
    idNIC: "2010",
    nombre: "Monitoreo de la Función Gastrointestinal",
  ),

  "NIC-1802": const Intervencion(
    idIntervencion: "NIC-1802",
    idNIC: "1802",
    nombre: "Cuidados del Paciente con Ostomía",
  ),

  "NIC-4170": const Intervencion(
    idIntervencion: "NIC-4170",
    idNIC: "4170",
    nombre: "Prevención de la Hemorragia Digestiva",
  ),
  "NIC-2080": const Intervencion(
    idIntervencion: "NIC-2080",
    idNIC: "2080",
    nombre: "Manejo del Paciente con Insuficiencia Hepática",
  ),
  "NIC-0460": const Intervencion(
    idIntervencion: "NIC-0460",
    idNIC: "0460",
    nombre: "Control de la Diarrea",
  ),
  "NIC-0450": const Intervencion(
    idIntervencion: "NIC-0450",
    idNIC: "0450",
    nombre: "Control del Estreñimiento",
  ),
  "NIC-4190": const Intervencion(
    idIntervencion: "NIC-4190",
    idNIC: "4190",
    nombre: "Manejo del Paciente con Ascitis",
  ),
  "NIC-2030": const Intervencion(
    idIntervencion: "NIC-2030",
    idNIC: "2030",
    nombre: "Manejo del Paciente con Pancreatitis Aguda",
  ),
  "NIC-1850": const Intervencion(
    idIntervencion: "NIC-1850",
    idNIC: "1850",
    nombre: "Monitorización del Reflujo Gastroesofágico",
  ),
  "NIC-2075": const Intervencion(
    idIntervencion: "NIC-2075",
    idNIC: "2075",
    nombre: "Manejo de la Hipertensión Portal",
  ),
  "NIC-2890": const Intervencion(
    idIntervencion: "NIC-2890",
    idNIC: "2890",
    nombre: "Manejo del Paciente con Apendicitis",
  ),
  "NIC-2905": const Intervencion(
    idIntervencion: "NIC-2905",
    idNIC: "2905",
    nombre: "Cuidado del Paciente con Hernia Abdominal",
  ),
  "NIC-2050": const Intervencion(
    idIntervencion: "NIC-2050",
    idNIC: "2050",
    nombre: "Monitorización de la Peritonitis",
  ),
  "NIC-2008": const Intervencion(
    idIntervencion: "NIC-2008",
    idNIC: "2008",
    nombre: "Manejo del Paciente con Síndrome de Intestino Corto",
  ),
  "NIC-2895": const Intervencion(
    idIntervencion: "NIC-2895",
    idNIC: "2895",
    nombre: "Cuidados del Paciente con Colecistitis",
  ),
  "NIC-4175": const Intervencion(
    idIntervencion: "NIC-4175",
    idNIC: "4175",
    nombre: "Manejo del Paciente con Síndrome Compartimental Abdominal",
  ),

  // REGIÓN PÉLVICA Y PERIANAL
  "NIC-0590": const Intervencion(
    idIntervencion: "NIC-0590",
    idNIC: "0590",
    nombre: "Manejo de la Eliminación Urinaria",
  ),
  "NIC-1876": const Intervencion(
    idIntervencion: "NIC-1876",
    idNIC: "1876",
    nombre: "Cuidados del Paciente con Sonda Vesical",
  ),
  "NIC-0595": const Intervencion(
    idIntervencion: "NIC-0595",
    idNIC: "0595",
    nombre: "Monitorización de la Retención Urinaria",
  ),
  "NIC-0591": const Intervencion(
    idIntervencion: "NIC-0591",
    idNIC: "0591",
    nombre: "Manejo del Paciente con Incontinencia Urinaria",
  ),
  "NIC-1845": const Intervencion(
    idIntervencion: "NIC-1845",
    idNIC: "1845",
    nombre: "Cuidados del Paciente con Fístula Perianal",
  ),
  "NIC-0610": const Intervencion(
    idIntervencion: "NIC-0610",
    idNIC: "0610",
    nombre: "Manejo del Paciente con Prolapso Rectal",
  ),
  "NIC-1804": const Intervencion(
    idIntervencion: "NIC-1804",
    idNIC: "1804",
    nombre: "Cuidados del Paciente con Hemorroides",
  ),
  "NIC-1416": const Intervencion(
    idIntervencion: "NIC-1416",
    idNIC: "1416",
    nombre: "Manejo del Dolor Pélvico",
  ),
  "NIC-1803": const Intervencion(
    idIntervencion: "NIC-1803",
    idNIC: "1803",
    nombre: "Cuidados del Paciente con Colostomía",
  ),
  "NIC-0600": const Intervencion(
    idIntervencion: "NIC-0600",
    idNIC: "0600",
    nombre: "Manejo del Paciente con Cistostomía",
  ),
  "NIC-1200": const Intervencion(
    idIntervencion: "NIC-1200",
    idNIC: "1200",
    nombre: "Manejo del Paciente con Endometriosis",
  ),
  "NIC-2085": const Intervencion(
    idIntervencion: "NIC-2085",
    idNIC: "2085",
    nombre: "Cuidados del Paciente con Infección Pélvica",
  ),
  "NIC-1205": const Intervencion(
    idIntervencion: "NIC-1205",
    idNIC: "1205",
    nombre: "Manejo del Paciente con Dispareunia",
  ),
  "NIC-2100": const Intervencion(
    idIntervencion: "NIC-2100",
    idNIC: "2100",
    nombre: "Monitorización del Paciente con Cáncer Ginecológico",
  ),
  "NIC-0585": const Intervencion(
    idIntervencion: "NIC-0585",
    idNIC: "0585",
    nombre: "Manejo del Paciente con Hipertrofia Prostática",
  ),
  "NIC-0455": const Intervencion(
    idIntervencion: "NIC-0455",
    idNIC: "0455",
    nombre: "Manejo del Paciente con Estreñimiento Crónico",
  ),
  "NIC-1877": const Intervencion(
    idIntervencion: "NIC-1877",
    idNIC: "1877",
    nombre: "Cuidados del Paciente con Infección Urinaria",
  ),
  "NIC-0740": const Intervencion(
    idIntervencion: "NIC-0740",
    idNIC: "0740",
    nombre: "Manejo del Paciente con Úlceras por Presión Perineales",
  ),
  "NIC-1805": const Intervencion(
    idIntervencion: "NIC-1805",
    idNIC: "1805",
    nombre: "Cuidados del Paciente con Absceso Perianal",
  ),
};

final Map<String, List<Actividad>> actividadesDeIntervencion = {
  // REGIÓN CEFÁLICA (CABEZA Y CUELLO)
  "NIC-3160": [
    const Actividad(
        idActividad: '3160-001',
        descripcion: 'Mantener permeabilidad de la vía aérea artificial'),
    const Actividad(
        idActividad: '3160-002',
        descripcion: 'Realizar aspiración de secreciones según protocolo'),
    const Actividad(
        idActividad: '3160-003',
        descripcion: 'Monitorear presión del cuff cada 4-6 horas'),
  ],
  "NIC-2620": [
    const Actividad(
        idActividad: '2620-001',
        descripcion: 'Evaluar Escala de Coma de Glasgow cada 2-4 horas'),
    const Actividad(
        idActividad: '2620-002',
        descripcion: 'Monitorear respuesta motora y reflejos'),
    const Actividad(
        idActividad: '2620-003',
        descripcion: 'Documentar cambios neurológicos'),
  ],
  "NIC-2940": [
    const Actividad(
        idActividad: '2940-001',
        descripcion: 'Monitorizar presión intracraneal continuamente'),
    const Actividad(
        idActividad: '2940-002',
        descripcion: 'Mantener cabecera a 30° excepto contraindicación'),
    const Actividad(
        idActividad: '2940-003',
        descripcion: 'Administrar osmoterapia según prescripción'),
  ],
  "NIC-3180": [
    const Actividad(
        idActividad: '3180-001',
        descripcion: 'Realizar curación de traqueostomía según protocolo'),
    const Actividad(
        idActividad: '3180-002',
        descripcion: 'Cambiar fijaciones cada 24 horas o según necesidad'),
    const Actividad(
        idActividad: '3180-003',
        descripcion: 'Evaluar piel periestomal en cada turno'),
  ],
  "NIC-3320": [
    const Actividad(
        idActividad: '3320-001',
        descripcion: 'Ajustar flujo de oxígeno según saturación'),
    const Actividad(
        idActividad: '3320-002', descripcion: 'Monitorear signos de hipoxia'),
    const Actividad(
        idActividad: '3320-003',
        descripcion: 'Evaluar respuesta a la oxigenoterapia'),
  ],
  "NIC-2390": [
    const Actividad(
        idActividad: '2390-001',
        descripcion: 'Monitorizar nivel de sedación (escala RASS)'),
    const Actividad(
        idActividad: '2390-002',
        descripcion: 'Ajustar perfusión de sedantes según protocolo'),
    const Actividad(
        idActividad: '2390-003',
        descripcion: 'Evaluar dolor con escala validada'),
  ],
  "NIC-4040": [
    const Actividad(
        idActividad: '4040-001',
        descripcion: 'Calibrar equipo de presión arterial invasiva'),
    const Actividad(
        idActividad: '4040-002',
        descripcion: 'Documentar valores cada hora o según protocolo'),
    const Actividad(
        idActividad: '4040-003',
        descripcion: 'Notificar cambios significativos inmediatamente'),
  ],
  "NIC-1660": [
    const Actividad(
        idActividad: '1660-001',
        descripcion: 'Aplicar lubricante ocular cada 2-4 horas'),
    const Actividad(
        idActividad: '1660-002',
        descripcion: 'Realizar oclusión palpebral si está indicado'),
    const Actividad(
        idActividad: '1660-003',
        descripcion: 'Evaluar córnea con lámpara de hendidura diariamente'),
  ],
  "NIC-1400": [
    const Actividad(
        idActividad: '1400-001',
        descripcion: 'Evaluar características del dolor neurológico'),
    const Actividad(
        idActividad: '1400-002',
        descripcion: 'Administrar analgesia según escala de dolor'),
    const Actividad(
        idActividad: '1400-003',
        descripcion: 'Monitorear respuesta a la medicación'),
  ],
  "NIC-2445": [
    const Actividad(
        idActividad: '2445-001',
        descripcion:
            'Realizar curación del acceso central con técnica estéril'),
    const Actividad(
        idActividad: '2445-002',
        descripcion: 'Cambiar apósitos según protocolo institucional'),
    const Actividad(
        idActividad: '2445-003',
        descripcion: 'Evaluar signos de infección en cada turno'),
  ],
  "NIC-4120": [
    const Actividad(
        idActividad: '4120-001',
        descripcion: 'Monitorizar presión de perfusión cerebral'),
    const Actividad(
        idActividad: '4120-002',
        descripcion: 'Mantener presión arterial media según metas'),
    const Actividad(
        idActividad: '4120-003',
        descripcion: 'Evaluar respuesta neurológica a intervenciones'),
  ],
  "NIC-3900": [
    const Actividad(
        idActividad: '3900-001',
        descripcion: 'Monitorizar temperatura central cada 2-4 horas'),
    const Actividad(
        idActividad: '3900-002',
        descripcion: 'Aplicar medidas de enfriamiento si es necesario'),
    const Actividad(
        idActividad: '3900-003',
        descripcion: 'Prevenir escalofríos durante el recalentamiento'),
  ],
  "NIC-3540": [
    const Actividad(
        idActividad: '3540-001',
        descripcion: 'Cambiar posición de tubo endotraqueal cada 8 horas'),
    const Actividad(
        idActividad: '3540-002',
        descripcion: 'Evaluar puntos de presión por dispositivos'),
    const Actividad(
        idActividad: '3540-003',
        descripcion: 'Aplicar apósitos protectores en zonas de riesgo'),
  ],
  "NIC-3165": [
    const Actividad(
        idActividad: '3165-001',
        descripcion: 'Aspirar secreciones según necesidad y protocolo'),
    const Actividad(
        idActividad: '3165-002',
        descripcion: 'Evaluar características de las secreciones'),
    const Actividad(
        idActividad: '3165-003',
        descripcion: 'Monitorear respuesta respiratoria post-aspiración'),
  ],
  "NIC-3200": [
    const Actividad(
        idActividad: '3200-001',
        descripcion: 'Elevar cabecera de la cama 30-45 grados'),
    const Actividad(
        idActividad: '3200-002',
        descripcion: 'Evaluar reflejo de tos y deglución'),
    const Actividad(
        idActividad: '3200-003',
        descripcion: 'Implementar medidas para prevenir aspiración'),
  ],
  "NIC-2625": [
    const Actividad(
        idActividad: '2625-001',
        descripcion: 'Evaluar reflejo pupilar y su simetría'),
    const Actividad(
        idActividad: '2625-002',
        descripcion: 'Documentar respuesta a estímulos luminosos'),
    const Actividad(
        idActividad: '2625-003',
        descripcion: 'Monitorear cambios en los signos neurológicos'),
  ],
  "NIC-1710": [
    const Actividad(
        idActividad: '1710-001',
        descripcion: 'Realizar higiene bucal cada 4-6 horas'),
    const Actividad(
        idActividad: '1710-002', descripcion: 'Aplicar hidratación labial'),
    const Actividad(
        idActividad: '1710-003',
        descripcion: 'Inspeccionar mucosa oral en cada turno'),
  ],
  "NIC-6400": [
    const Actividad(
        idActividad: '6400-001',
        descripcion:
            'Administrar medicación anticonvulsivante según protocolo'),
    const Actividad(
        idActividad: '6400-002',
        descripcion: 'Proteger al paciente durante la crisis convulsiva'),
    const Actividad(
        idActividad: '6400-003',
        descripcion: 'Monitorear estado neurológico post-crisis'),
  ],
  "NIC-6440": [
    const Actividad(
        idActividad: '6440-001',
        descripcion: 'Evaluar estado cognitivo usando escala CAM-ICU'),
    const Actividad(
        idActividad: '6440-002',
        descripcion: 'Orientar al paciente frecuentemente'),
    const Actividad(
        idActividad: '6440-003',
        descripcion: 'Implementar medidas no farmacológicas para delirium'),
  ],
  "NIC-4820": [
    const Actividad(
        idActividad: '4820-001',
        descripcion: 'Monitorear signos de abstinencia (CIWA o COWS)'),
    const Actividad(
        idActividad: '4820-002',
        descripcion: 'Administrar medicación para abstinencia según protocolo'),
    const Actividad(
        idActividad: '4820-003',
        descripcion: 'Proporcionar apoyo emocional al paciente'),
  ],

  // REGIÓN TORÁCICA
  "NIC-4220": [
    const Actividad(
        idActividad: '4220-001', descripcion: 'Monitorizar ECG continuamente'),
    const Actividad(
        idActividad: '4220-002',
        descripcion: 'Evaluar ruidos cardíacos cada 4 horas'),
    const Actividad(
        idActividad: '4220-003',
        descripcion: 'Documentar arritmias y notificar cambios'),
  ],
  "NIC-4250": [
    const Actividad(
        idActividad: '4250-001',
        descripcion: 'Calibrar sistema de presión arterial invasiva'),
    const Actividad(
        idActividad: '4250-002', descripcion: 'Monitorear PVC cada hora'),
    const Actividad(
        idActividad: '4250-003',
        descripcion: 'Evaluar balance hídrico cada 8 horas'),
  ],
  "NIC-4210": [
    const Actividad(
        idActividad: '4210-001',
        descripcion: 'Administrar medicación cardiovascular según protocolo'),
    const Actividad(
        idActividad: '4210-002',
        descripcion: 'Monitorizar respuesta hemodinámica a medicación'),
    const Actividad(
        idActividad: '4210-003',
        descripcion: 'Titular dosis según parámetros establecidos'),
  ],
  "NIC-1410": [
    const Actividad(
        idActividad: '1410-001',
        descripcion: 'Evaluar dolor torácico con escala validada'),
    const Actividad(
        idActividad: '1410-002',
        descripcion: 'Administrar analgesia según prescripción'),
    const Actividad(
        idActividad: '1410-003',
        descripcion: 'Monitorear efectos secundarios de la analgesia'),
  ],
  "NIC-3430": [
    const Actividad(
        idActividad: '3430-001',
        descripcion: 'Monitorear drenaje torácico cada hora inicialmente'),
    const Actividad(
        idActividad: '3430-002',
        descripcion: 'Realizar maniobras de sellado según protocolo'),
    const Actividad(
        idActividad: '3430-003',
        descripcion: 'Evaluar signos de neumotórax o hemotórax'),
  ],
  "NIC-3300": [
    const Actividad(
        idActividad: '3300-001',
        descripcion: 'Verificar parámetros del ventilador mecánico'),
    const Actividad(
        idActividad: '3300-002',
        descripcion: 'Monitorear sincronía paciente-ventilador'),
    const Actividad(
        idActividad: '3300-003',
        descripcion: 'Realizar pruebas de desconexión según protocolo'),
  ],
  "NIC-3325": [
    const Actividad(
        idActividad: '3325-001',
        descripcion: 'Monitorizar saturación de oxígeno continuamente'),
    const Actividad(
        idActividad: '3325-002',
        descripcion: 'Realizar gasometrías arteriales periódicas'),
    const Actividad(
        idActividad: '3325-003', descripcion: 'Ajustar FiO2 según resultados'),
  ],
  // "NIC-3320": [
  //   const Actividad(
  //       idActividad: '3320-001',
  //       descripcion: 'Evaluar capacidad de respiración espontánea'),
  //   const Actividad(
  //       idActividad: '3320-002',
  //       descripcion: 'Monitorear parámetros ventilatorios durante destete'),
  //   const Actividad(
  //       idActividad: '3320-003',
  //       descripcion: 'Proporcionar apoyo psicológico durante el destete'),
  // ],
  // "NIC-3200": [
  //   const Actividad(
  //       idActividad: '3200-001',
  //       descripcion: 'Preparar equipo para intubación/extubación'),
  //   const Actividad(
  //       idActividad: '3200-002',
  //       descripcion: 'Monitorear signos vitales durante el procedimiento'),
  //   const Actividad(
  //       idActividad: '3200-003',
  //       descripcion: 'Evaluar función respiratoria post-extubación'),
  // ],
  "NIC-3350": [
    const Actividad(
        idActividad: '3350-001', descripcion: 'Evaluar compliance pulmonar'),
    const Actividad(
        idActividad: '3350-002',
        descripcion: 'Monitorear presión de vía aérea'),
    const Actividad(
        idActividad: '3350-003',
        descripcion: 'Ajustar parámetros ventilatorios según respuesta'),
  ],
  "NIC-3250": [
    const Actividad(
        idActividad: '3250-001',
        descripcion: 'Realizar percusión y vibración torácica'),
    const Actividad(
        idActividad: '3250-002',
        descripcion: 'Enseñar técnicas de respiración profunda'),
    const Actividad(
        idActividad: '3250-003',
        descripcion: 'Posicionar para drenaje postural'),
  ],
  "NIC-1415": [
    const Actividad(
        idActividad: '1415-001',
        descripcion: 'Evaluar dolor usando escala visual analógica'),
    const Actividad(
        idActividad: '1415-002',
        descripcion: 'Administrar analgesia multimodal'),
    const Actividad(
        idActividad: '1415-003',
        descripcion: 'Enseñar técnicas de respiración para control del dolor'),
  ],
  "NIC-3355": [
    const Actividad(
        idActividad: '3355-001',
        descripcion: 'Elevar cabecera de la cama 30-45 grados'),
    const Actividad(
        idActividad: '3355-002',
        descripcion: 'Realizar higiene bucal estricta'),
    const Actividad(
        idActividad: '3355-003',
        descripcion: 'Cambiar circuito del ventilador según protocolo'),
  ],
  "NIC-2900": [
    const Actividad(
        idActividad: '2900-001',
        descripcion: 'Evaluar herida quirúrgica y drenajes'),
    const Actividad(
        idActividad: '2900-002',
        descripcion: 'Administrar analgesia según protocolo'),
    const Actividad(
        idActividad: '2900-003', descripcion: 'Fomentar movilización temprana'),
  ],
  "NIC-3322": [
    const Actividad(
        idActividad: '3322-001',
        descripcion: 'Monitorear gases arteriales regularmente'),
    const Actividad(
        idActividad: '3322-002',
        descripcion: 'Ajustar parámetros ventilatorios según gases'),
    const Actividad(
        idActividad: '3322-003',
        descripcion: 'Evaluar respuesta a maniobras de reclutamiento'),
  ],
  "NIC-4140": [
    const Actividad(
        idActividad: '4140-001',
        descripcion: 'Tomar presión arterial no invasiva regularmente'),
    const Actividad(
        idActividad: '4140-002',
        descripcion: 'Documentar variaciones de presión arterial'),
    const Actividad(
        idActividad: '4140-003',
        descripcion: 'Reportar valores anormales inmediatamente'),
  ],
  "NIC-3326": [
    const Actividad(
        idActividad: '3326-001',
        descripcion: 'Administrar diuréticos según prescripción'),
    const Actividad(
        idActividad: '3326-002',
        descripcion: 'Monitorear balance hídrico estrictamente'),
    const Actividad(
        idActividad: '3326-003',
        descripcion: 'Posicionar en semi-Fowler para mejorar ventilación'),
  ],
  "NIC-2920": [
    const Actividad(
        idActividad: '2920-001',
        descripcion: 'Administrar profilaxis antitrombótica'),
    const Actividad(
        idActividad: '2920-002', descripcion: 'Fomentar movilización temprana'),
    const Actividad(
        idActividad: '2920-003',
        descripcion: 'Monitorear signos de tromboembolismo pulmonar'),
  ],

  // REGIÓN ABDOMINAL
  "NIC-1050": [
    const Actividad(
        idActividad: '1050-001',
        descripcion: 'Verificar posición de sonda de alimentación'),
    const Actividad(
        idActividad: '1050-002',
        descripcion: 'Administrar nutrición enteral según protocolo'),
    const Actividad(
        idActividad: '1050-003',
        descripcion: 'Monitorear tolerancia a la alimentación'),
  ],
  "NIC-1052": [
    const Actividad(
        idActividad: '1052-001',
        descripcion: 'Preparar solución de nutrición parenteral'),
    const Actividad(
        idActividad: '1052-002',
        descripcion: 'Monitorear glucemia cada 4-6 horas'),
    const Actividad(
        idActividad: '1052-003',
        descripcion: 'Evaluar función hepática y renal periódicamente'),
  ],
  "NIC-2010": [
    const Actividad(
        idActividad: '2010-001',
        descripcion: 'Auscultar ruidos intestinales cada 8 horas'),
    const Actividad(
        idActividad: '2010-002', descripcion: 'Monitorear náuseas/vómitos'),
    const Actividad(
        idActividad: '2010-003', descripcion: 'Evaluar distensión abdominal'),
  ],
  // "NIC-2900": [
  //   const Actividad(
  //       idActividad: '2900-001',
  //       descripcion: 'Evaluar herida quirúrgica abdominal'),
  //   const Actividad(
  //       idActividad: '2900-002',
  //       descripcion: 'Monitorear función intestinal (ruidos, distensión)'),
  //   const Actividad(
  //       idActividad: '2900-003',
  //       descripcion: 'Iniciar alimentación oral según tolerancia'),
  // ],
  "NIC-1802": [
    const Actividad(
        idActividad: '1802-001',
        descripcion: 'Realizar cuidado de la ostomía según protocolo'),
    const Actividad(
        idActividad: '1802-002',
        descripcion: 'Evaluar piel periestomal en cada turno'),
    const Actividad(
        idActividad: '1802-003',
        descripcion: 'Enseñar autocuidado al paciente/familia'),
  ],
  // "NIC-1415": [
  //   const Actividad(
  //       idActividad: '1415-001',
  //       descripcion: 'Evaluar características del dolor abdominal'),
  //   const Actividad(
  //       idActividad: '1415-002',
  //       descripcion: 'Administrar analgesia según escala de dolor'),
  //   const Actividad(
  //       idActividad: '1415-003',
  //       descripcion: 'Monitorear respuesta a la analgesia'),
  // ],
  "NIC-4170": [
    const Actividad(
        idActividad: '4170-001',
        descripcion: 'Monitorear signos de sangrado digestivo'),
    const Actividad(
        idActividad: '4170-002',
        descripcion: 'Controlar signos vitales cada hora si hay sangrado'),
    const Actividad(
        idActividad: '4170-003',
        descripcion: 'Preparar para endoscopia terapéutica si es necesario'),
  ],
  "NIC-2080": [
    const Actividad(
        idActividad: '2080-001',
        descripcion:
            'Monitorear encefalopatía hepática (escala de West Haven)'),
    const Actividad(
        idActividad: '2080-002',
        descripcion: 'Controlar balance hídrico estrictamente'),
    const Actividad(
        idActividad: '2080-003',
        descripcion: 'Administrar lactulosa según prescripción'),
  ],
  "NIC-0460": [
    const Actividad(
        idActividad: '0460-001',
        descripcion: 'Monitorear frecuencia y características de deposiciones'),
    const Actividad(
        idActividad: '0460-002',
        descripcion: 'Administrar terapia de rehidratación'),
    const Actividad(
        idActividad: '0460-003',
        descripcion: 'Proteger piel perianal de irritación'),
  ],
  "NIC-0450": [
    const Actividad(
        idActividad: '0450-001',
        descripcion: 'Evaluar frecuencia y características de deposiciones'),
    const Actividad(
        idActividad: '0450-002',
        descripcion: 'Administrar laxantes según protocolo'),
    const Actividad(
        idActividad: '0450-003',
        descripcion: 'Fomentar ingesta de fibra y líquidos'),
  ],
  "NIC-4190": [
    const Actividad(
        idActividad: '4190-001',
        descripcion: 'Medir perímetro abdominal diariamente'),
    const Actividad(
        idActividad: '4190-002',
        descripcion: 'Administrar diuréticos según prescripción'),
    const Actividad(
        idActividad: '4190-003',
        descripcion: 'Preparar para paracentesis si es necesario'),
  ],
  "NIC-2030": [
    const Actividad(
        idActividad: '2030-001',
        descripcion: 'Mantener ayuno según indicación médica'),
    const Actividad(
        idActividad: '2030-002',
        descripcion: 'Administrar analgesia y monitorizar respuesta'),
    const Actividad(
        idActividad: '2030-003',
        descripcion: 'Monitorear enzimas pancreáticas'),
  ],
  "NIC-1850": [
    const Actividad(
        idActividad: '1850-001',
        descripcion: 'Elevar cabecera de la cama 30 grados'),
    const Actividad(
        idActividad: '1850-002',
        descripcion: 'Administrar antiácidos/protectores gástricos'),
    const Actividad(
        idActividad: '1850-003', descripcion: 'Evaluar síntomas de reflujo'),
  ],
  "NIC-2075": [
    const Actividad(
        idActividad: '2075-001',
        descripcion: 'Monitorear signos de sangrado digestivo alto'),
    const Actividad(
        idActividad: '2075-002',
        descripcion: 'Preparar para endoscopia terapéutica si es necesario'),
    const Actividad(
        idActividad: '2075-003',
        descripcion: 'Administrar vasoconstrictores según protocolo'),
  ],
  "NIC-2890": [
    const Actividad(
        idActividad: '2890-001',
        descripcion: 'Evaluar dolor abdominal postoperatorio'),
    const Actividad(
        idActividad: '2890-002', descripcion: 'Monitorear signos de infección'),
    const Actividad(
        idActividad: '2890-003', descripcion: 'Fomentar deambulación temprana'),
  ],
  "NIC-2905": [
    const Actividad(
        idActividad: '2905-001',
        descripcion: 'Evaluar integridad de la pared abdominal'),
    const Actividad(
        idActividad: '2905-002',
        descripcion: 'Administrar analgesia multimodal'),
    const Actividad(
        idActividad: '2905-003',
        descripcion: 'Prevenir aumento de presión intraabdominal'),
  ],
  "NIC-2050": [
    const Actividad(
        idActividad: '2050-001',
        descripcion: 'Monitorear signos de irritación peritoneal'),
    const Actividad(
        idActividad: '2050-002',
        descripcion: 'Administrar antibióticos según protocolo'),
    const Actividad(
        idActividad: '2050-003',
        descripcion: 'Controlar balance hídrico estrictamente'),
  ],
  "NIC-2008": [
    const Actividad(
        idActividad: '2008-001',
        descripcion: 'Monitorear estado nutricional del paciente'),
    const Actividad(
        idActividad: '2008-002',
        descripcion: 'Administrar nutrición parenteral/enteral'),
    const Actividad(
        idActividad: '2008-003',
        descripcion: 'Controlar electrolitos regularmente'),
  ],
  "NIC-2895": [
    const Actividad(
        idActividad: '2895-001',
        descripcion: 'Evaluar dolor en cuadrante superior derecho'),
    const Actividad(
        idActividad: '2895-002', descripcion: 'Monitorear signos de ictericia'),
    const Actividad(
        idActividad: '2895-003',
        descripcion: 'Preparar para colangiopancreatografía si es necesario'),
  ],
  "NIC-4175": [
    const Actividad(
        idActividad: '4175-001',
        descripcion: 'Medir presión intraabdominal regularmente'),
    const Actividad(
        idActividad: '4175-002',
        descripcion: 'Posicionar para optimizar ventilación'),
    const Actividad(
        idActividad: '4175-003',
        descripcion: 'Preparar para descompresión quirúrgica si es necesario'),
  ],

  // REGIÓN PÉLVICA Y PERIANAL
  "NIC-0590": [
    const Actividad(
        idActividad: '0590-001',
        descripcion: 'Evaluar patrón de eliminación urinaria'),
    const Actividad(
        idActividad: '0590-002',
        descripcion: 'Monitorear residuo postmiccional si es necesario'),
    const Actividad(
        idActividad: '0590-003',
        descripcion: 'Educar sobre hábitos miccionales saludables'),
  ],
  "NIC-1876": [
    const Actividad(
        idActividad: '1876-001',
        descripcion: 'Realizar cuidado de sonda vesical según protocolo'),
    const Actividad(
        idActividad: '1876-002',
        descripcion: 'Mantener sistema de drenaje cerrado'),
    const Actividad(
        idActividad: '1876-003',
        descripcion: 'Educar sobre cuidados con sonda vesical'),
  ],
  "NIC-0595": [
    const Actividad(
        idActividad: '0595-001',
        descripcion: 'Palpar vejiga en pacientes con retención'),
    const Actividad(
        idActividad: '0595-002',
        descripcion: 'Cateterizar intermitentemente si es necesario'),
    const Actividad(
        idActividad: '0595-003', descripcion: 'Monitorear balance hídrico'),
  ],
  "NIC-0591": [
    const Actividad(
        idActividad: '0591-001',
        descripcion: 'Evaluar patrón de incontinencia'),
    const Actividad(
        idActividad: '0591-002',
        descripcion: 'Implementar programa de entrenamiento vesical'),
    const Actividad(
        idActividad: '0591-003', descripcion: 'Proteger piel de la humedad'),
  ],
  "NIC-1845": [
    const Actividad(
        idActividad: '1845-001',
        descripcion: 'Realizar curación de fístula según protocolo'),
    const Actividad(
        idActividad: '1845-002', descripcion: 'Aplicar apósitos absorbentes'),
    const Actividad(
        idActividad: '1845-003', descripcion: 'Monitorear signos de infección'),
  ],
  "NIC-0610": [
    const Actividad(
        idActividad: '0610-001',
        descripcion: 'Enseñar técnicas de reducción manual del prolapso'),
    const Actividad(
        idActividad: '0610-002',
        descripcion: 'Administrar ablandadores de heces'),
    const Actividad(
        idActividad: '0610-003', descripcion: 'Educar sobre evitar pujos'),
  ],
  "NIC-1804": [
    const Actividad(
        idActividad: '1804-001',
        descripcion: 'Aplicar tratamiento tópico según prescripción'),
    const Actividad(
        idActividad: '1804-002', descripcion: 'Enseñar higiene anal adecuada'),
    const Actividad(
        idActividad: '1804-003',
        descripcion: 'Administrar analgesia para dolor anal'),
  ],
  "NIC-1416": [
    const Actividad(
        idActividad: '1416-001',
        descripcion: 'Evaluar características del dolor pélvico'),
    const Actividad(
        idActividad: '1416-002',
        descripcion: 'Administrar analgesia según escala de dolor'),
    const Actividad(
        idActividad: '1416-003', descripcion: 'Enseñar técnicas de relajación'),
  ],
  "NIC-1803": [
    const Actividad(
        idActividad: '1803-001',
        descripcion: 'Realizar cuidado de la colostomía según protocolo'),
    const Actividad(
        idActividad: '1803-002',
        descripcion: 'Educar sobre manejo de dispositivos'),
    const Actividad(
        idActividad: '1803-003',
        descripcion: 'Monitorear adaptación psicológica'),
  ],
  "NIC-0600": [
    const Actividad(
        idActividad: '0600-001',
        descripcion: 'Realizar curación del estoma vesical'),
    const Actividad(
        idActividad: '0600-002',
        descripcion: 'Cambiar bolsa colectora según necesidad'),
    const Actividad(
        idActividad: '0600-003', descripcion: 'Educar sobre autocuidado'),
  ],
  "NIC-1200": [
    const Actividad(
        idActividad: '1200-001',
        descripcion: 'Evaluar impacto del dolor pélvico en calidad de vida'),
    const Actividad(
        idActividad: '1200-002',
        descripcion: 'Administrar terapia hormonal si está indicada'),
    const Actividad(
        idActividad: '1200-003', descripcion: 'Proporcionar apoyo emocional'),
  ],
  "NIC-2085": [
    const Actividad(
        idActividad: '2085-001',
        descripcion: 'Administrar antibióticos según protocolo'),
    const Actividad(
        idActividad: '2085-002', descripcion: 'Monitorear signos de sepsis'),
    const Actividad(
        idActividad: '2085-003',
        descripcion: 'Preparar para drenaje si es necesario'),
  ],
  "NIC-1205": [
    const Actividad(
        idActividad: '1205-001',
        descripcion: 'Evaluar dolor durante relación sexual (escala análoga)'),
    const Actividad(
        idActividad: '1205-002',
        descripcion: 'Derivar a terapia sexual si es necesario'),
    const Actividad(
        idActividad: '1205-003', descripcion: 'Enseñar uso de lubricantes'),
  ],
  "NIC-2100": [
    const Actividad(
        idActividad: '2100-001',
        descripcion: 'Evaluar dolor y respuesta a analgesia'),
    const Actividad(
        idActividad: '2100-002',
        descripcion: 'Proporcionar apoyo emocional y psicológico'),
    const Actividad(
        idActividad: '2100-003',
        descripcion: 'Educar sobre efectos secundarios de tratamientos'),
  ],
  "NIC-0585": [
    const Actividad(
        idActividad: '0585-001',
        descripcion: 'Monitorear residuo postmiccional'),
    const Actividad(
        idActividad: '0585-002',
        descripcion: 'Administrar alfabloqueadores según prescripción'),
    const Actividad(
        idActividad: '0585-003',
        descripcion: 'Educar sobre síntomas de retención urinaria'),
  ],
  "NIC-0455": [
    const Actividad(
        idActividad: '0455-001', descripcion: 'Evaluar hábitos intestinales'),
    const Actividad(
        idActividad: '0455-002',
        descripcion: 'Implementar programa de entrenamiento intestinal'),
    const Actividad(
        idActividad: '0455-003',
        descripcion: 'Administrar laxantes según protocolo'),
  ],
  "NIC-1877": [
    const Actividad(
        idActividad: '1877-001',
        descripcion: 'Administrar antibióticos según urocultivo'),
    const Actividad(
        idActividad: '1877-002', descripcion: 'Fomentar ingesta hídrica'),
    const Actividad(
        idActividad: '1877-003',
        descripcion: 'Educar sobre medidas preventivas'),
  ],
  "NIC-0740": [
    const Actividad(
        idActividad: '0740-001',
        descripcion: 'Realizar curación de úlceras perineales'),
    const Actividad(
        idActividad: '0740-002',
        descripcion: 'Aplicar apósitos especializados'),
    const Actividad(
        idActividad: '0740-003',
        descripcion: 'Cambiar posicionamiento frecuentemente'),
  ],
  "NIC-1805": [
    const Actividad(
        idActividad: '1805-001',
        descripcion: 'Realizar curaciones con técnica aséptica'),
    const Actividad(
        idActividad: '1805-002',
        descripcion: 'Administrar analgesia para dolor perianal'),
    const Actividad(
        idActividad: '1805-003', descripcion: 'Educar sobre higiene perianal'),
  ],
};

final Map<String, List<Resultado>> resultadosDeIntervencion = {
  // REGIÓN CEFÁLICA (CABEZA Y CUELLO)
  "NIC-3160": [
    const Resultado(
        idResultado: 'NOC-0410',
        idNOC: '0410',
        nombre: 'Estado respiratorio: Permeabilidad de la vía aérea'),
    const Resultado(
        idResultado: 'NOC-0408',
        idNOC: '0408',
        nombre: 'Eliminación de secreciones respiratorias'),
    const Resultado(
        idResultado: 'NOC-0401',
        idNOC: '0401',
        nombre: 'Oxigenación tisular adecuada'),
  ],
  "NIC-2620": [
    const Resultado(
        idResultado: 'NOC-0900', idNOC: '0900', nombre: 'Estado neurológico'),
    const Resultado(
        idResultado: 'NOC-0902', idNOC: '0902', nombre: 'Nivel de conciencia'),
    const Resultado(
        idResultado: 'NOC-0204',
        idNOC: '0204',
        nombre: 'Respuesta motora adecuada'),
  ],
  "NIC-2940": [
    const Resultado(
        idResultado: 'NOC-0907',
        idNOC: '0907',
        nombre: 'Control de la presión intracraneana'),
    const Resultado(
        idResultado: 'NOC-0603',
        idNOC: '0603',
        nombre: 'Equilibrio de líquidos y electrolitos'),
    const Resultado(
        idResultado: 'NOC-1910',
        idNOC: '1910',
        nombre: 'Prevención del edema cerebral'),
  ],
  "NIC-3180": [
    const Resultado(
        idResultado: 'NOC-1102',
        idNOC: '1102',
        nombre: 'Integridad de la mucosa traqueal'),
    const Resultado(
        idResultado: 'NOC-1936',
        idNOC: '1936',
        nombre: 'Seguridad del paciente con dispositivos invasivos'),
    const Resultado(
        idResultado: 'NOC-1902',
        idNOC: '1902',
        nombre: 'Prevención de infecciones respiratorias'),
  ],
  "NIC-3320": [
    const Resultado(
        idResultado: 'NOC-0405',
        idNOC: '0405',
        nombre: 'Estado respiratorio: Intercambio gaseoso'),
    const Resultado(
        idResultado: 'NOC-0418',
        idNOC: '0418',
        nombre: 'Saturación de oxígeno adecuada'),
    const Resultado(
        idResultado: 'NOC-0414',
        idNOC: '0414',
        nombre: 'Prevención de hipoxia'),
  ],
  "NIC-2390": [
    const Resultado(
        idResultado: 'NOC-0905', idNOC: '0905', nombre: 'Nivel de sedación'),
    const Resultado(
        idResultado: 'NOC-2102', idNOC: '2102', nombre: 'Control del dolor'),
    const Resultado(
        idResultado: 'NOC-1605',
        idNOC: '1605',
        nombre: 'Respuesta a la analgesia'),
  ],
  "NIC-4040": [
    const Resultado(
        idResultado: 'NOC-0406',
        idNOC: '0406',
        nombre: 'Control de la presión arterial'),
    const Resultado(
        idResultado: 'NOC-0408',
        idNOC: '0408',
        nombre: 'Equilibrio hemodinámico'),
  ],
  "NIC-1660": [
    const Resultado(
        idResultado: 'NOC-1105', idNOC: '1105', nombre: 'Integridad ocular'),
    const Resultado(
        idResultado: 'NOC-1106',
        idNOC: '1106',
        nombre: 'Prevención de úlceras corneales'),
    const Resultado(
        idResultado: 'NOC-1107',
        idNOC: '1107',
        nombre: 'Lubricación ocular adecuada'),
  ],
  "NIC-1400": [
    const Resultado(
        idResultado: 'NOC-2102', idNOC: '2102', nombre: 'Control del dolor'),
    const Resultado(
        idResultado: 'NOC-2008',
        idNOC: '2008',
        nombre: 'Nivel de comodidad del paciente'),
    const Resultado(
        idResultado: 'NOC-1605',
        idNOC: '1605',
        nombre: 'Respuesta adecuada a la analgesia'),
  ],
  "NIC-2445": [
    const Resultado(
        idResultado: 'NOC-1902',
        idNOC: '1902',
        nombre: 'Prevención de infecciones asociadas a CVC'),
    const Resultado(
        idResultado: 'NOC-1936',
        idNOC: '1936',
        nombre: 'Seguridad del paciente con dispositivos invasivos'),
    const Resultado(
        idResultado: 'NOC-1922',
        idNOC: '1922',
        nombre: 'Control del acceso venoso central'),
  ],
  "NIC-4120": [
    const Resultado(
        idResultado: 'NOC-0909',
        idNOC: '0909',
        nombre: 'Perfusión cerebral adecuada'),
    const Resultado(
        idResultado: 'NOC-0408',
        idNOC: '0408',
        nombre: 'Equilibrio hemodinámico'),
  ],
  "NIC-3900": [
    const Resultado(
        idResultado: 'NOC-0800',
        idNOC: '0800',
        nombre: 'Termorregulación efectiva'),
    const Resultado(
        idResultado: 'NOC-0801', idNOC: '0801', nombre: 'Prevención de fiebre'),
  ],
  "NIC-3540": [
    const Resultado(
        idResultado: 'NOC-1101',
        idNOC: '1101',
        nombre: 'Integridad tisular: Piel y mucosas'),
    const Resultado(
        idResultado: 'NOC-1102',
        idNOC: '1102',
        nombre: 'Prevención de úlceras por presión'),
  ],
  "NIC-3165": [
    const Resultado(
        idResultado: 'NOC-0408',
        idNOC: '0408',
        nombre: 'Eliminación de secreciones respiratorias'),
    const Resultado(
        idResultado: 'NOC-0410',
        idNOC: '0410',
        nombre: 'Permeabilidad de la vía aérea'),
  ],
  "NIC-3200": [
    const Resultado(
        idResultado: 'NOC-1902',
        idNOC: '1902',
        nombre: 'Prevención de infecciones respiratorias'),
    const Resultado(
        idResultado: 'NOC-0415',
        idNOC: '0415',
        nombre: 'Control del reflejo de la tos'),
  ],
  "NIC-2625": [
    const Resultado(
        idResultado: 'NOC-0913',
        idNOC: '0913',
        nombre: 'Respuesta pupilar adecuada'),
    const Resultado(
        idResultado: 'NOC-0900',
        idNOC: '0900',
        nombre: 'Estado neurológico estable'),
  ],
  "NIC-1710": [
    const Resultado(
        idResultado: 'NOC-1100',
        idNOC: '1100',
        nombre: 'Integridad de la mucosa oral'),
    const Resultado(
        idResultado: 'NOC-1910',
        idNOC: '1910',
        nombre: 'Prevención de infecciones bucales'),
  ],
  "NIC-6400": [
    const Resultado(
        idResultado: 'NOC-0908',
        idNOC: '0908',
        nombre: 'Control de convulsiones'),
    const Resultado(
        idResultado: 'NOC-1932',
        idNOC: '1932',
        nombre: 'Seguridad del paciente neurológico'),
  ],
  "NIC-6440": [
    const Resultado(
        idResultado: 'NOC-0906',
        idNOC: '0906',
        nombre: 'Estado cognitivo adecuado'),
    const Resultado(
        idResultado: 'NOC-0912',
        idNOC: '0912',
        nombre: 'Prevención de delirium'),
  ],
  "NIC-4820": [
    const Resultado(
        idResultado: 'NOC-1212',
        idNOC: '1212',
        nombre: 'Control de síntomas de abstinencia'),
    const Resultado(
        idResultado: 'NOC-1213',
        idNOC: '1213',
        nombre: 'Estabilidad emocional del paciente crítico'),
  ],

  // REGIÓN TORÁCICA
  "NIC-4220": [
    const Resultado(
        idResultado: 'NOC-0409',
        idNOC: '0409',
        nombre: 'Perfusión tisular cardiopulmonar'),
    const Resultado(
        idResultado: 'NOC-0407',
        idNOC: '0407',
        nombre: 'Frecuencia y ritmo cardíaco normal'),
    const Resultado(
        idResultado: 'NOC-0408',
        idNOC: '0408',
        nombre: 'Equilibrio hemodinámico'),
  ],
  "NIC-4250": [
    const Resultado(
        idResultado: 'NOC-0408',
        idNOC: '0408',
        nombre: 'Estabilidad hemodinámica'),
    const Resultado(
        idResultado: 'NOC-0402',
        idNOC: '0402',
        nombre: 'Control de la presión venosa central'),
    const Resultado(
        idResultado: 'NOC-0603',
        idNOC: '0603',
        nombre: 'Equilibrio de líquidos y electrolitos'),
  ],
  "NIC-4210": [
    const Resultado(
        idResultado: 'NOC-0406',
        idNOC: '0406',
        nombre: 'Control de la presión arterial'),
    const Resultado(
        idResultado: 'NOC-0412',
        idNOC: '0412',
        nombre: 'Función cardíaca efectiva'),
    const Resultado(
        idResultado: 'NOC-0415',
        idNOC: '0415',
        nombre: 'Respuesta adecuada a fármacos cardiovasculares'),
  ],
  "NIC-1410": [
    const Resultado(
        idResultado: 'NOC-2102', idNOC: '2102', nombre: 'Control del dolor'),
    const Resultado(
        idResultado: 'NOC-2008',
        idNOC: '2008',
        nombre: 'Nivel de comodidad del paciente'),
    const Resultado(
        idResultado: 'NOC-1605',
        idNOC: '1605',
        nombre: 'Respuesta a la analgesia'),
  ],
  "NIC-3430": [
    const Resultado(
        idResultado: 'NOC-0408',
        idNOC: '0408',
        nombre: 'Eliminación de secreciones torácicas'),
    const Resultado(
        idResultado: 'NOC-0411',
        idNOC: '0411',
        nombre: 'Integridad del sistema de drenaje'),
    const Resultado(
        idResultado: 'NOC-0402',
        idNOC: '0402',
        nombre: 'Prevención de complicaciones pulmonares'),
  ],
  // "NIC-3165": [
  //   const Resultado(
  //       idResultado: 'NOC-0410',
  //       idNOC: '0410',
  //       nombre: 'Permeabilidad de la vía aérea'),
  //   const Resultado(
  //       idResultado: 'NOC-0408',
  //       idNOC: '0408',
  //       nombre: 'Eliminación de secreciones respiratorias'),
  //   const Resultado(
  //       idResultado: 'NOC-0413',
  //       idNOC: '0413',
  //       nombre: 'Prevención de atelectasias'),
  // ],
  "NIC-3300": [
    const Resultado(
        idResultado: 'NOC-0405',
        idNOC: '0405',
        nombre: 'Estado respiratorio: Intercambio gaseoso'),
    const Resultado(
        idResultado: 'NOC-1902',
        idNOC: '1902',
        nombre: 'Prevención de infecciones respiratorias'),
    const Resultado(
        idResultado: 'NOC-0414',
        idNOC: '0414',
        nombre: 'Adaptación a la ventilación mecánica'),
  ],
  "NIC-3325": [
    const Resultado(
        idResultado: 'NOC-0418',
        idNOC: '0418',
        nombre: 'Saturación de oxígeno adecuada'),
    const Resultado(
        idResultado: 'NOC-0401',
        idNOC: '0401',
        nombre: 'Oxigenación tisular efectiva'),
  ],
  // "NIC-3320": [
  //   const Resultado(
  //       idResultado: 'NOC-0419',
  //       idNOC: '0419',
  //       nombre: 'Capacidad de respiración espontánea'),
  //   const Resultado(
  //       idResultado: 'NOC-0417',
  //       idNOC: '0417',
  //       nombre: 'Tolerancia al destete de la ventilación'),
  // ],
  // "NIC-3200": [
  //   const Resultado(
  //       idResultado: 'NOC-0410',
  //       idNOC: '0410',
  //       nombre: 'Integridad de la vía aérea'),
  //   const Resultado(
  //       idResultado: 'NOC-0412',
  //       idNOC: '0412',
  //       nombre: 'Adaptación a la intubación/extubación'),
  //   const Resultado(
  //       idResultado: 'NOC-0416',
  //       idNOC: '0416',
  //       nombre: 'Prevención de complicaciones asociadas'),
  // ],
  "NIC-3350": [
    const Resultado(
        idResultado: 'NOC-0414',
        idNOC: '0414',
        nombre: 'Adaptación a la ventilación mecánica'),
    const Resultado(
        idResultado: 'NOC-0417',
        idNOC: '0417',
        nombre: 'Prevención de barotrauma pulmonar'),
    const Resultado(
        idResultado: 'NOC-0405',
        idNOC: '0405',
        nombre: 'Intercambio gaseoso adecuado'),
  ],
  "NIC-3250": [
    const Resultado(
        idResultado: 'NOC-0415',
        idNOC: '0415',
        nombre: 'Expansión pulmonar efectiva'),
    const Resultado(
        idResultado: 'NOC-0408',
        idNOC: '0408',
        nombre: 'Eliminación de secreciones pulmonares'),
    const Resultado(
        idResultado: 'NOC-0411',
        idNOC: '0411',
        nombre: 'Mejora de la ventilación alveolar'),
  ],
  "NIC-1415": [
    const Resultado(
        idResultado: 'NOC-2102', idNOC: '2102', nombre: 'Control del dolor'),
    const Resultado(
        idResultado: 'NOC-0410',
        idNOC: '0410',
        nombre: 'Nivel de confort respiratorio'),
    const Resultado(
        idResultado: 'NOC-1605',
        idNOC: '1605',
        nombre: 'Movilización efectiva sin dolor'),
  ],
  "NIC-3355": [
    const Resultado(
        idResultado: 'NOC-1902',
        idNOC: '1902',
        nombre: 'Disminución del riesgo de infección pulmonar'),
    const Resultado(
        idResultado: 'NOC-0405',
        idNOC: '0405',
        nombre: 'Estado respiratorio: Función pulmonar adecuada'),
    const Resultado(
        idResultado: 'NOC-0408',
        idNOC: '0408',
        nombre: 'Eliminación de secreciones efectiva'),
  ],
  "NIC-2900": [
    const Resultado(
        idResultado: 'NOC-1101',
        idNOC: '1101',
        nombre: 'Integridad de la herida quirúrgica'),
    const Resultado(
        idResultado: 'NOC-2102',
        idNOC: '2102',
        nombre: 'Control del dolor postoperatorio'),
    const Resultado(
        idResultado: 'NOC-0413',
        idNOC: '0413',
        nombre: 'Prevención de complicaciones respiratorias'),
  ],
  "NIC-3322": [
    const Resultado(
        idResultado: 'NOC-0405',
        idNOC: '0405',
        nombre: 'Estado respiratorio: Intercambio gaseoso'),
    const Resultado(
        idResultado: 'NOC-0418',
        idNOC: '0418',
        nombre: 'Respuesta a la terapia de oxígeno'),
    const Resultado(
        idResultado: 'NOC-0410',
        idNOC: '0410',
        nombre: 'Reducción de la disnea'),
  ],
  "NIC-4140": [
    const Resultado(
        idResultado: 'NOC-0406',
        idNOC: '0406',
        nombre: 'Control de la presión arterial'),
    const Resultado(
        idResultado: 'NOC-0408',
        idNOC: '0408',
        nombre: 'Estabilidad hemodinámica'),
    const Resultado(
        idResultado: 'NOC-0412',
        idNOC: '0412',
        nombre: 'Reducción del riesgo de hipertensión o hipotensión'),
  ],
  "NIC-3326": [
    const Resultado(
        idResultado: 'NOC-0415',
        idNOC: '0415',
        nombre: 'Reducción del edema pulmonar'),
    const Resultado(
        idResultado: 'NOC-0410',
        idNOC: '0410',
        nombre: 'Estado respiratorio: Disnea disminuida'),
    const Resultado(
        idResultado: 'NOC-0405',
        idNOC: '0405',
        nombre: 'Mejora del intercambio gaseoso'),
  ],
  "NIC-2920": [
    const Resultado(
        idResultado: 'NOC-0418',
        idNOC: '0418',
        nombre: 'Disminución del riesgo de TEP'),
    const Resultado(
        idResultado: 'NOC-0408',
        idNOC: '0408',
        nombre: 'Estado hemodinámico estable'),
    const Resultado(
        idResultado: 'NOC-0401',
        idNOC: '0401',
        nombre: 'Circulación pulmonar adecuada'),
  ],

  // REGIÓN ABDOMINAL
  "NIC-1050": [
    const Resultado(
        idResultado: 'NOC-1008',
        idNOC: '1008',
        nombre: 'Estado nutricional: ingestión de alimentos y líquidos'),
    const Resultado(
        idResultado: 'NOC-1101',
        idNOC: '1101',
        nombre: 'Integridad de la mucosa gastrointestinal'),
    const Resultado(
        idResultado: 'NOC-1010',
        idNOC: '1010',
        nombre: 'Respuesta a la alimentación enteral'),
  ],
  "NIC-1052": [
    const Resultado(
        idResultado: 'NOC-1007',
        idNOC: '1007',
        nombre: 'Estado nutricional: metabolismo de macronutrientes'),
    const Resultado(
        idResultado: 'NOC-0603',
        idNOC: '0603',
        nombre: 'Equilibrio de líquidos y electrolitos'),
    const Resultado(
        idResultado: 'NOC-1005',
        idNOC: '1005',
        nombre: 'Prevención de complicaciones metabólicas'),
  ],
  "NIC-2010": [
    const Resultado(
        idResultado: 'NOC-0416',
        idNOC: '0416',
        nombre: 'Motilidad gastrointestinal adecuada'),
    const Resultado(
        idResultado: 'NOC-0501',
        idNOC: '0501',
        nombre: 'Eliminación intestinal normal'),
    const Resultado(
        idResultado: 'NOC-0419',
        idNOC: '0419',
        nombre: 'Prevención de íleo paralítico'),
  ],
  // "NIC-2900": [
  //   const Resultado(
  //       idResultado: 'NOC-1101',
  //       idNOC: '1101',
  //       nombre: 'Integridad de la herida quirúrgica'),
  //   const Resultado(
  //       idResultado: 'NOC-2102',
  //       idNOC: '2102',
  //       nombre: 'Control del dolor postoperatorio'),
  //   const Resultado(
  //       idResultado: 'NOC-0208',
  //       idNOC: '0208',
  //       nombre: 'Movilización precoz sin complicaciones'),
  // ],
  "NIC-1802": [
    const Resultado(
        idResultado: 'NOC-1102',
        idNOC: '1102',
        nombre: 'Integridad de la piel periestomal'),
    const Resultado(
        idResultado: 'NOC-1301',
        idNOC: '1301',
        nombre: 'Adaptación a la ostomía'),
    const Resultado(
        idResultado: 'NOC-1613',
        idNOC: '1613',
        nombre: 'Manejo efectivo del dispositivo de ostomía'),
  ],
  // "NIC-1415": [
  //   const Resultado(
  //       idResultado: 'NOC-2102', idNOC: '2102', nombre: 'Control del dolor'),
  //   const Resultado(
  //       idResultado: 'NOC-2008',
  //       idNOC: '2008',
  //       nombre: 'Nivel de comodidad del paciente'),
  //   const Resultado(
  //       idResultado: 'NOC-1605',
  //       idNOC: '1605',
  //       nombre: 'Respuesta a la analgesia'),
  // ],
  "NIC-4170": [
    const Resultado(
        idResultado: 'NOC-0410',
        idNOC: '0410',
        nombre: 'Integridad del tracto gastrointestinal'),
    const Resultado(
        idResultado: 'NOC-0412',
        idNOC: '0412',
        nombre: 'Control de signos de sangrado digestivo'),
    const Resultado(
        idResultado: 'NOC-0408',
        idNOC: '0408',
        nombre: 'Estabilidad hemodinámica'),
  ],
  "NIC-2080": [
    const Resultado(
        idResultado: 'NOC-0414',
        idNOC: '0414',
        nombre: 'Función hepática preservada'),
    const Resultado(
        idResultado: 'NOC-0415',
        idNOC: '0415',
        nombre: 'Prevención de encefalopatía hepática'),
    const Resultado(
        idResultado: 'NOC-0603',
        idNOC: '0603',
        nombre: 'Control del equilibrio de líquidos y electrolitos'),
  ],
  "NIC-0460": [
    const Resultado(
        idResultado: 'NOC-0501',
        idNOC: '0501',
        nombre: 'Patrón de eliminación intestinal normal'),
    const Resultado(
        idResultado: 'NOC-0602',
        idNOC: '0602',
        nombre: 'Prevención de deshidratación'),
    const Resultado(
        idResultado: 'NOC-0410',
        idNOC: '0410',
        nombre: 'Integridad de la mucosa gastrointestinal'),
  ],
  "NIC-0450": [
    const Resultado(
        idResultado: 'NOC-0501',
        idNOC: '0501',
        nombre: 'Patrón de eliminación intestinal normal'),
    const Resultado(
        idResultado: 'NOC-0416',
        idNOC: '0416',
        nombre: 'Motilidad intestinal efectiva'),
    const Resultado(
        idResultado: 'NOC-0417',
        idNOC: '0417',
        nombre: 'Prevención de impactación fecal'),
  ],
  "NIC-4190": [
    const Resultado(
        idResultado: 'NOC-0601',
        idNOC: '0601',
        nombre: 'Control del volumen de líquidos'),
    const Resultado(
        idResultado: 'NOC-0415',
        idNOC: '0415',
        nombre: 'Reducción de la distensión abdominal'),
    const Resultado(
        idResultado: 'NOC-0405',
        idNOC: '0405',
        nombre: 'Estado respiratorio mejorado'),
  ],
  "NIC-2030": [
    const Resultado(
        idResultado: 'NOC-2102',
        idNOC: '2102',
        nombre: 'Control del dolor abdominal'),
    const Resultado(
        idResultado: 'NOC-0418',
        idNOC: '0418',
        nombre: 'Reducción de la inflamación pancreática'),
    const Resultado(
        idResultado: 'NOC-1007',
        idNOC: '1007',
        nombre: 'Estado metabólico estabilizado'),
  ],
  "NIC-1850": [
    const Resultado(
        idResultado: 'NOC-0410',
        idNOC: '0410',
        nombre: 'Reducción de los síntomas de reflujo'),
    const Resultado(
        idResultado: 'NOC-0411',
        idNOC: '0411',
        nombre: 'Integridad de la mucosa esofágica'),
    const Resultado(
        idResultado: 'NOC-1008',
        idNOC: '1008',
        nombre: 'Tolerancia a la alimentación oral'),
  ],
  "NIC-2075": [
    const Resultado(
        idResultado: 'NOC-0418',
        idNOC: '0418',
        nombre: 'Control de la presión venosa hepática'),
    const Resultado(
        idResultado: 'NOC-0412',
        idNOC: '0412',
        nombre: 'Prevención de varices esofágicas sangrantes'),
    const Resultado(
        idResultado: 'NOC-0408',
        idNOC: '0408',
        nombre: 'Estabilidad hemodinámica'),
  ],
  "NIC-2890": [
    const Resultado(
        idResultado: 'NOC-0410',
        idNOC: '0410',
        nombre: 'Integridad del tracto gastrointestinal'),
    const Resultado(
        idResultado: 'NOC-2102',
        idNOC: '2102',
        nombre: 'Control del dolor postoperatorio'),
    const Resultado(
        idResultado: 'NOC-0413',
        idNOC: '0413',
        nombre: 'Prevención de infecciones intraabdominales'),
  ],
  "NIC-2905": [
    const Resultado(
        idResultado: 'NOC-0410',
        idNOC: '0410',
        nombre: 'Integridad de la pared abdominal'),
    const Resultado(
        idResultado: 'NOC-2102',
        idNOC: '2102',
        nombre: 'Control del dolor postquirúrgico'),
    const Resultado(
        idResultado: 'NOC-0208',
        idNOC: '0208',
        nombre: 'Movilización sin complicaciones'),
  ],
  "NIC-2050": [
    const Resultado(
        idResultado: 'NOC-0415',
        idNOC: '0415',
        nombre: 'Reducción del proceso inflamatorio peritoneal'),
    const Resultado(
        idResultado: 'NOC-0603',
        idNOC: '0603',
        nombre: 'Equilibrio de líquidos y electrolitos'),
    const Resultado(
        idResultado: 'NOC-2102',
        idNOC: '2102',
        nombre: 'Control del dolor abdominal'),
  ],
  "NIC-2008": [
    const Resultado(
        idResultado: 'NOC-1008',
        idNOC: '1008',
        nombre: 'Estado nutricional adecuado'),
    const Resultado(
        idResultado: 'NOC-0603',
        idNOC: '0603',
        nombre: 'Equilibrio hidroelectrolítico'),
    const Resultado(
        idResultado: 'NOC-1010',
        idNOC: '1010',
        nombre: 'Adaptación a la dieta enteral/parenteral'),
  ],
  "NIC-2895": [
    const Resultado(
        idResultado: 'NOC-2102',
        idNOC: '2102',
        nombre: 'Control del dolor abdominal'),
    const Resultado(
        idResultado: 'NOC-0418',
        idNOC: '0418',
        nombre: 'Reducción de la inflamación vesicular'),
    const Resultado(
        idResultado: 'NOC-0501',
        idNOC: '0501',
        nombre: 'Eliminación intestinal adecuada'),
  ],
  "NIC-4175": [
    const Resultado(
        idResultado: 'NOC-0417',
        idNOC: '0417',
        nombre: 'Reducción de la presión intraabdominal'),
    const Resultado(
        idResultado: 'NOC-0405',
        idNOC: '0405',
        nombre: 'Estado respiratorio optimizado'),
    const Resultado(
        idResultado: 'NOC-0416',
        idNOC: '0416',
        nombre: 'Prevención de insuficiencia multiorgánica'),
  ],

  // REGIÓN PÉLVICA Y PERIANAL
  "NIC-0590": [
    const Resultado(
        idResultado: 'NOC-0502',
        idNOC: '0502',
        nombre: 'Control de la continencia urinaria'),
    const Resultado(
        idResultado: 'NOC-0410',
        idNOC: '0410',
        nombre: 'Integridad del tracto urinario'),
    const Resultado(
        idResultado: 'NOC-0413',
        idNOC: '0413',
        nombre: 'Prevención de infecciones del tracto urinario'),
  ],
  "NIC-1876": [
    const Resultado(
        idResultado: 'NOC-0502',
        idNOC: '0502',
        nombre: 'Función urinaria normal'),
    const Resultado(
        idResultado: 'NOC-0413',
        idNOC: '0413',
        nombre: 'Prevención de infecciones urinarias'),
    const Resultado(
        idResultado: 'NOC-1101',
        idNOC: '1101',
        nombre: 'Integridad de la piel perineal'),
  ],
  "NIC-0595": [
    const Resultado(
        idResultado: 'NOC-0502',
        idNOC: '0502',
        nombre: 'Patrón de eliminación urinaria normal'),
    const Resultado(
        idResultado: 'NOC-0414',
        idNOC: '0414',
        nombre: 'Control de síntomas de disuria'),
    const Resultado(
        idResultado: 'NOC-0418',
        idNOC: '0418',
        nombre: 'Reducción del riesgo de insuficiencia renal aguda'),
  ],
  "NIC-0591": [
    const Resultado(
        idResultado: 'NOC-0502',
        idNOC: '0502',
        nombre: 'Continencia urinaria mejorada'),
    const Resultado(
        idResultado: 'NOC-1101',
        idNOC: '1101',
        nombre: 'Prevención de lesiones cutáneas perineales'),
    const Resultado(
        idResultado: 'NOC-1601',
        idNOC: '1601',
        nombre: 'Calidad de vida relacionada con la continencia'),
  ],
  "NIC-1845": [
    const Resultado(
        idResultado: 'NOC-1101',
        idNOC: '1101',
        nombre: 'Integridad de la piel perianal'),
    const Resultado(
        idResultado: 'NOC-2102',
        idNOC: '2102',
        nombre: 'Control del dolor perianal'),
    const Resultado(
        idResultado: 'NOC-0413',
        idNOC: '0413',
        nombre: 'Prevención de infecciones locales'),
  ],
  "NIC-0610": [
    const Resultado(
        idResultado: 'NOC-0501',
        idNOC: '0501',
        nombre: 'Control de la eliminación intestinal'),
    const Resultado(
        idResultado: 'NOC-0410',
        idNOC: '0410',
        nombre: 'Integridad del recto preservada'),
    const Resultado(
        idResultado: 'NOC-0415',
        idNOC: '0415',
        nombre: 'Reducción de molestias perianales'),
  ],
  "NIC-1804": [
    const Resultado(
        idResultado: 'NOC-0410',
        idNOC: '0410',
        nombre: 'Reducción de síntomas de hemorroides'),
    const Resultado(
        idResultado: 'NOC-1101',
        idNOC: '1101',
        nombre: 'Integridad de la mucosa anal'),
    const Resultado(
        idResultado: 'NOC-2102',
        idNOC: '2102',
        nombre: 'Control del dolor anal'),
  ],
  "NIC-1416": [
    const Resultado(
        idResultado: 'NOC-2102', idNOC: '2102', nombre: 'Control del dolor'),
    const Resultado(
        idResultado: 'NOC-2008',
        idNOC: '2008',
        nombre: 'Nivel de comodidad mejorado'),
    const Resultado(
        idResultado: 'NOC-1605',
        idNOC: '1605',
        nombre: 'Respuesta efectiva a la analgesia'),
  ],
  "NIC-1803": [
    const Resultado(
        idResultado: 'NOC-1102',
        idNOC: '1102',
        nombre: 'Integridad de la piel periestomal'),
    const Resultado(
        idResultado: 'NOC-1301',
        idNOC: '1301',
        nombre: 'Adaptación a la ostomía'),
    const Resultado(
        idResultado: 'NOC-1613',
        idNOC: '1613',
        nombre: 'Manejo del dispositivo de ostomía'),
  ],
  "NIC-0600": [
    const Resultado(
        idResultado: 'NOC-0413',
        idNOC: '0413',
        nombre: 'Prevención de infecciones urinarias'),
    const Resultado(
        idResultado: 'NOC-0410',
        idNOC: '0410',
        nombre: 'Integridad del tracto urinario preservada'),
    const Resultado(
        idResultado: 'NOC-0502',
        idNOC: '0502',
        nombre: 'Control adecuado de la eliminación urinaria'),
  ],
  "NIC-1200": [
    const Resultado(
        idResultado: 'NOC-2102',
        idNOC: '2102',
        nombre: 'Control del dolor pélvico'),
    const Resultado(
        idResultado: 'NOC-1601',
        idNOC: '1601',
        nombre: 'Calidad de vida mejorada'),
    const Resultado(
        idResultado: 'NOC-0415',
        idNOC: '0415',
        nombre: 'Disminución de los síntomas menstruales'),
  ],
  "NIC-2085": [
    const Resultado(
        idResultado: 'NOC-0703',
        idNOC: '0703',
        nombre: 'Control del proceso infeccioso'),
    const Resultado(
        idResultado: 'NOC-0413',
        idNOC: '0413',
        nombre: 'Prevención de complicaciones sistémicas'),
    const Resultado(
        idResultado: 'NOC-0410',
        idNOC: '0410',
        nombre: 'Integridad del tejido pélvico preservada'),
  ],
  "NIC-1205": [
    const Resultado(
        idResultado: 'NOC-2102',
        idNOC: '2102',
        nombre: 'Control del dolor durante la relación sexual'),
    const Resultado(
        idResultado: 'NOC-1601',
        idNOC: '1601',
        nombre: 'Bienestar sexual mejorado'),
    const Resultado(
        idResultado: 'NOC-1211',
        idNOC: '1211',
        nombre: 'Reducción de la ansiedad relacionada con el dolor'),
  ],
  "NIC-2100": [
    const Resultado(
        idResultado: 'NOC-2102',
        idNOC: '2102',
        nombre: 'Control del dolor pélvico y abdominal'),
    const Resultado(
        idResultado: 'NOC-1301',
        idNOC: '1301',
        nombre: 'Adaptación a la enfermedad'),
    const Resultado(
        idResultado: 'NOC-0413',
        idNOC: '0413',
        nombre: 'Prevención de complicaciones asociadas a la neoplasia'),
  ],
  "NIC-0585": [
    const Resultado(
        idResultado: 'NOC-0502',
        idNOC: '0502',
        nombre: 'Control de la eliminación urinaria'),
    const Resultado(
        idResultado: 'NOC-0415',
        idNOC: '0415',
        nombre: 'Reducción de síntomas obstructivos urinarios'),
    const Resultado(
        idResultado: 'NOC-1301',
        idNOC: '1301',
        nombre: 'Adaptación a cambios en la función urinaria'),
  ],
  "NIC-0455": [
    const Resultado(
        idResultado: 'NOC-0501',
        idNOC: '0501',
        nombre: 'Patrón de eliminación intestinal normal'),
    const Resultado(
        idResultado: 'NOC-0410',
        idNOC: '0410',
        nombre: 'Integridad de la mucosa intestinal'),
    const Resultado(
        idResultado: 'NOC-0417',
        idNOC: '0417',
        nombre: 'Prevención de impactación fecal'),
  ],
  "NIC-1877": [
    const Resultado(
        idResultado: 'NOC-0703',
        idNOC: '0703',
        nombre: 'Resolución de la infección urinaria'),
    const Resultado(
        idResultado: 'NOC-0410',
        idNOC: '0410',
        nombre: 'Integridad de la mucosa urinaria preservada'),
    const Resultado(
        idResultado: 'NOC-0603',
        idNOC: '0603',
        nombre: 'Equilibrio hidroelectrolítico estabilizado'),
  ],
  "NIC-0740": [
    const Resultado(
        idResultado: 'NOC-1101',
        idNOC: '1101',
        nombre: 'Integridad de la piel y mucosas'),
    const Resultado(
        idResultado: 'NOC-0413',
        idNOC: '0413',
        nombre: 'Prevención de complicaciones infecciosas'),
    const Resultado(
        idResultado: 'NOC-1102',
        idNOC: '1102',
        nombre: 'Cicatrización de la herida favorecida'),
  ],
  "NIC-1805": [
    const Resultado(
        idResultado: 'NOC-1101',
        idNOC: '1101',
        nombre: 'Integridad de la piel perianal'),
    const Resultado(
        idResultado: 'NOC-2102',
        idNOC: '2102',
        nombre: 'Control del dolor perianal'),
    const Resultado(
        idResultado: 'NOC-0413',
        idNOC: '0413',
        nombre: 'Prevención de complicaciones sépticas'),
  ],
};

final Map<String, List<Indicador>> indicadoresDeResultados = {
  // REGIÓN CEFÁLICA (CABEZA Y CUELLO)
  'NOC-0410': [
    const Indicador(
        idIndicador: '0410-001', descripcion: 'Permeabilidad de la vía aérea'),
    const Indicador(
        idIndicador: '0410-002',
        descripcion: 'Integridad de la mucosa gastrointestinal'),
    const Indicador(
        idIndicador: '0410-003', descripcion: 'Integridad del tracto urinario'),
    const Indicador(
        idIndicador: '0410-004',
        descripcion: 'Integridad de la mucosa urinaria preservada'),
  ],

  'NOC-0408': [
    const Indicador(
        idIndicador: '0408-001',
        descripcion: 'Eliminación de secreciones respiratorias'),
    const Indicador(
        idIndicador: '0408-002', descripcion: 'Equilibrio hemodinámico'),
    const Indicador(
        idIndicador: '0408-003',
        descripcion: 'Prevención de complicaciones respiratorias'),
  ],

  'NOC-0401': [
    const Indicador(
        idIndicador: '0401-001', descripcion: 'Oxigenación tisular adecuada'),
    const Indicador(
        idIndicador: '0401-002',
        descripcion: 'Estado respiratorio: Intercambio gaseoso'),
  ],

  'NOC-0900': [
    const Indicador(
        idIndicador: '0900-001', descripcion: 'Estado neurológico estable'),
    const Indicador(
        idIndicador: '0900-002', descripcion: 'Respuesta neurológica adecuada'),
  ],

  'NOC-0902': [
    const Indicador(
        idIndicador: '0902-001', descripcion: 'Nivel de conciencia adecuado'),
  ],

  'NOC-0907': [
    const Indicador(
        idIndicador: '0907-001',
        descripcion: 'Control de la presión intracraneana'),
  ],

  'NOC-0603': [
    const Indicador(
        idIndicador: '0603-001',
        descripcion: 'Equilibrio de líquidos y electrolitos'),
  ],

  'NOC-1301': [
    const Indicador(
        idIndicador: '1301-001', descripcion: 'Adaptación a la enfermedad'),
    const Indicador(
        idIndicador: '1301-002',
        descripcion: 'Adaptación a cambios en la función urinaria'),
  ],

  'NOC-1102': [
    const Indicador(
        idIndicador: '1102-001',
        descripcion: 'Integridad de la mucosa traqueal'),
    const Indicador(
        idIndicador: '1102-002',
        descripcion: 'Integridad de la piel y mucosas'),
  ],

  'NOC-1902': [
    const Indicador(
        idIndicador: '1902-001',
        descripcion: 'Prevención de infecciones respiratorias'),
  ],

  'NOC-0703': [
    const Indicador(
        idIndicador: '0703-001',
        descripcion: 'Resolución de la infección urinaria'),
  ],

  'NOC-0415': [
    const Indicador(
        idIndicador: '0415-001',
        descripcion: 'Reducción de síntomas obstructivos urinarios'),
  ],

  'NOC-0412': [
    const Indicador(
        idIndicador: '0412-001',
        descripcion: 'Control de signos de sangrado digestivo'),
  ],

  'NOC-0416': [
    const Indicador(
        idIndicador: '0416-001',
        descripcion: 'Prevención de complicaciones asociadas'),
  ],

  'NOC-0418': [
    const Indicador(
        idIndicador: '0418-001', descripcion: 'Saturación de oxígeno adecuada'),
  ],

  'NOC-1101': [
    const Indicador(
        idIndicador: '1101-001',
        descripcion: 'Integridad de la piel y mucosas'),
    const Indicador(
        idIndicador: '1101-002', descripcion: 'Integridad de la piel perianal'),
  ],

  'NOC-0414': [
    const Indicador(
        idIndicador: '0414-001', descripcion: 'Prevención de hipoxia'),
  ],

  'NOC-0409': [
    const Indicador(
        idIndicador: '0409-001',
        descripcion: 'Perfusión tisular cardiopulmonar'),
  ],

  'NOC-0407': [
    const Indicador(
        idIndicador: '0407-001',
        descripcion: 'Frecuencia y ritmo cardíaco normal'),
  ],

  'NOC-0402': [
    const Indicador(
        idIndicador: '0402-001',
        descripcion: 'Control de la presión venosa central'),
  ],

  'NOC-0800': [
    const Indicador(
        idIndicador: '0800-001', descripcion: 'Termorregulación efectiva'),
  ],

  'NOC-0801': [
    const Indicador(
        idIndicador: '0801-001', descripcion: 'Prevención de fiebre'),
  ],

  'NOC-0413': [
    const Indicador(
        idIndicador: '0413-001',
        descripcion: 'Prevención de complicaciones respiratorias'),
  ],

  'NOC-1922': [
    const Indicador(
        idIndicador: '1922-001',
        descripcion: 'Control del acceso venoso central'),
  ],

  'NOC-0913': [
    const Indicador(
        idIndicador: '0913-001', descripcion: 'Respuesta pupilar adecuada'),
  ],

  'NOC-0912': [
    const Indicador(
        idIndicador: '0912-001', descripcion: 'Prevención de delirium'),
  ],

  'NOC-1212': [
    const Indicador(
        idIndicador: '1212-001',
        descripcion: 'Control de síntomas de abstinencia'),
  ],

  'NOC-1213': [
    const Indicador(
        idIndicador: '1213-001',
        descripcion: 'Estabilidad emocional del paciente crítico'),
  ],

  'NOC-0502': [
    const Indicador(
        idIndicador: '0502-001',
        descripcion: 'Control de la continencia urinaria'),
    const Indicador(
        idIndicador: '0502-002', descripcion: 'Función urinaria normal'),
  ],

  'NOC-0501': [
    const Indicador(
        idIndicador: '0501-001',
        descripcion: 'Patrón de eliminación intestinal normal'),
  ],

  'NOC-1601': [
    const Indicador(
        idIndicador: '1601-001', descripcion: 'Calidad de vida mejorada'),
    const Indicador(
        idIndicador: '1601-002', descripcion: 'Bienestar sexual mejorado'),
  ],

  'NOC-1211': [
    const Indicador(
        idIndicador: '1211-001',
        descripcion: 'Reducción de la ansiedad relacionada con el dolor'),
  ],

  'NOC-1008': [
    const Indicador(
        idIndicador: '1008-001',
        descripcion: 'Estado nutricional: ingestión de alimentos y líquidos'),
  ],

  'NOC-1010': [
    const Indicador(
        idIndicador: '1010-001',
        descripcion: 'Respuesta a la alimentación enteral'),
  ],

  'NOC-1007': [
    const Indicador(
        idIndicador: '1007-001',
        descripcion: 'Estado nutricional: metabolismo de macronutrientes'),
  ],

  'NOC-1005': [
    const Indicador(
        idIndicador: '1005-001',
        descripcion: 'Prevención de complicaciones metabólicas'),
  ],

  'NOC-0204': [
    const Indicador(
        idIndicador: '0204-001', descripcion: 'Respuesta motora adecuada'),
  ],

  'NOC-1910': [
    const Indicador(
        idIndicador: '1910-001', descripcion: 'Prevención del edema cerebral'),
  ],

  'NOC-1936': [
    const Indicador(
        idIndicador: '1936-001',
        descripcion: 'Seguridad del paciente con dispositivos invasivos'),
  ],

  'NOC-1105': [
    const Indicador(idIndicador: '1105-001', descripcion: 'Integridad ocular'),
  ],

  'NOC-1106': [
    const Indicador(
        idIndicador: '1106-001',
        descripcion: 'Prevención de úlceras corneales'),
  ],

  'NOC-1107': [
    const Indicador(
        idIndicador: '1107-001', descripcion: 'Lubricación ocular adecuada'),
  ],

  'NOC-2102': [
    const Indicador(idIndicador: '2102-001', descripcion: 'Control del dolor'),
    const Indicador(
        idIndicador: '2102-002',
        descripcion: 'Control del dolor postoperatorio'),
  ],

  'NOC-2008': [
    const Indicador(
        idIndicador: '2008-001',
        descripcion: 'Nivel de comodidad del paciente'),
  ],

  'NOC-1605': [
    const Indicador(
        idIndicador: '1605-001',
        descripcion: 'Respuesta adecuada a la analgesia'),
  ],

  'NOC-0905': [
    const Indicador(
        idIndicador: '0905-001', descripcion: 'Nivel de sedación adecuado'),
  ],

  'NOC-0909': [
    const Indicador(
        idIndicador: '0909-001', descripcion: 'Perfusión cerebral adecuada'),
  ],

  'NOC-1100': [
    const Indicador(
        idIndicador: '1100-001', descripcion: 'Integridad de la mucosa oral'),
  ],

  'NOC-0906': [
    const Indicador(
        idIndicador: '0906-001', descripcion: 'Estado cognitivo adecuado'),
  ],

  'NOC-1932': [
    const Indicador(
        idIndicador: '1932-001',
        descripcion: 'Seguridad del paciente neurológico'),
  ],

  'NOC-1613': [
    const Indicador(
        idIndicador: '1613-001',
        descripcion: 'Manejo efectivo del dispositivo de ostomía'),
  ],

  'NOC-0208': [
    const Indicador(
        idIndicador: '0208-001',
        descripcion: 'Movilización precoz sin complicaciones'),
  ],

  'NOC-0601': [
    const Indicador(
        idIndicador: '0601-001',
        descripcion: 'Control del volumen de líquidos'),
  ],

  'NOC-0602': [
    const Indicador(
        idIndicador: '0602-001', descripcion: 'Prevención de deshidratación'),
  ],

  'NOC-0417': [
    const Indicador(
        idIndicador: '0417-001',
        descripcion: 'Prevención de impactación fecal'),
  ],

  'NOC-0419': [
    const Indicador(
        idIndicador: '0419-001', descripcion: 'Prevención de íleo paralítico'),
  ],

  'NOC-0411': [
    const Indicador(
        idIndicador: '0411-001',
        descripcion: 'Integridad del sistema de drenaje'),
  ],

  'NOC-0403': [
    const Indicador(
        idIndicador: '0403-001',
        descripcion: 'Estado respiratorio: Ventilación'),
  ],

  'NOC-0405': [
    const Indicador(
        idIndicador: '0405-001',
        descripcion: 'Estado respiratorio: Intercambio gaseoso'),
  ],

  'NOC-0406': [
    const Indicador(
        idIndicador: '0406-001', descripcion: 'Control de la presión arterial'),
  ],

  'NOC-0908': [
    const Indicador(
        idIndicador: '0908-001', descripcion: 'Control de convulsiones'),
  ],
};
