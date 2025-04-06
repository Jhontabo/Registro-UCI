import 'package:registro_uci/features/intervenciones/domain/models/actividad.dart';
import 'package:registro_uci/features/intervenciones/domain/models/intervencion.dart';
import 'package:registro_uci/features/resultados/domain/models/indicador.dart';
import 'package:registro_uci/features/resultados/domain/models/resultado.dart';

final Map<String, Intervencion> mapaIntervenciones = {
  // REGIÓN CEFÁLICA (CABEZA Y CUELLO)
  "3160": const Intervencion(
    idIntervencion: "3160",
    idNIC: "3160",
    nombre: "Manejo de la Vía Aérea Artificial",
  ),
  "2620": const Intervencion(
    idIntervencion: "2620",
    idNIC: "2620",
    nombre: "Monitorización Neurológica",
  ),
  "2940": const Intervencion(
    idIntervencion: "2940",
    idNIC: "2940",
    nombre: "Control de la Presión Intracraneana",
  ),
  "3180": const Intervencion(
    idIntervencion: "3180",
    idNIC: "3180",
    nombre: "Cuidados de la Cánula de Traqueostomía",
  ),
  "3320": const Intervencion(
    idIntervencion: "3320",
    idNIC: "3320",
    nombre: "Administración de Oxígeno",
  ),
  "2390": const Intervencion(
    idIntervencion: "2390",
    idNIC: "2390",
    nombre: "Control de la Sedación y Analgesia",
  ),
  "4040": const Intervencion(
    idIntervencion: "4040",
    idNIC: "4040",
    nombre: "Monitorización de la Presión Arterial No Invasiva e Invasiva",
  ),
  "1660": const Intervencion(
    idIntervencion: "1660",
    idNIC: "1660",
    nombre: "Cuidados de los Ojos en Pacientes Críticos",
  ),
  "1400": const Intervencion(
    idIntervencion: "1400",
    idNIC: "1400",
    nombre: "Manejo del Dolor Neurológico y Cefalea",
  ),
  "2445": const Intervencion(
    idIntervencion: "2445",
    idNIC: "2445",
    nombre: "Mantenimiento del Acceso Venoso Central",
  ),
  "4120": const Intervencion(
    idIntervencion: "4120",
    idNIC: "4120",
    nombre: "Monitorización de la Perfusión Cerebral",
  ),
  "3900": const Intervencion(
    idIntervencion: "3900",
    idNIC: "3900",
    nombre: "Control de la Hipotermia/Hipertermia",
  ),
  "3540": const Intervencion(
    idIntervencion: "3540",
    idNIC: "3540",
    nombre: "Protección de la Piel en Pacientes con Ventilación Mecánica",
  ),
  "3165": const Intervencion(
    idIntervencion: "3165",
    idNIC: "3165",
    nombre: "Aspiración de Secreciones",
  ),
  "3200": const Intervencion(
    idIntervencion: "3200",
    idNIC: "3200",
    nombre: "Prevención del Broncoaspirado",
  ),
  "2625": const Intervencion(
    idIntervencion: "2625",
    idNIC: "2625",
    nombre: "Evaluación del Reflejo Pupilar y Signos Neurológicos",
  ),
  "1710": const Intervencion(
    idIntervencion: "1710",
    idNIC: "1710",
    nombre: "Higiene Bucal en Pacientes Intubados",
  ),
  "6400": const Intervencion(
    idIntervencion: "6400",
    idNIC: "6400",
    nombre: "Manejo de Crisis Convulsivas",
  ),
  "6440": const Intervencion(
    idIntervencion: "6440",
    idNIC: "6440",
    nombre: "Detección y Control de Delirium en UCI",
  ),
  "4820": const Intervencion(
    idIntervencion: "4820",
    idNIC: "4820",
    nombre: "Prevención del Síndrome de Abstinencia en Pacientes Sedados",
  ),

  // REGIÓN TORÁCICA
  "4220": const Intervencion(
    idIntervencion: "4220",
    idNIC: "4220",
    nombre: "Monitorización Cardiovascular",
  ),
  "4250": const Intervencion(
    idIntervencion: "4250",
    idNIC: "4250",
    nombre: "Monitorización de la Hemodinámica Invasiva",
  ),
  "4210": const Intervencion(
    idIntervencion: "4210",
    idNIC: "4210",
    nombre: "Administración de Medicación Cardiovascular",
  ),
  "1410": const Intervencion(
    idIntervencion: "1410",
    idNIC: "1410",
    nombre: "Control del Dolor Torácico",
  ),
  "3430": const Intervencion(
    idIntervencion: "3430",
    idNIC: "3430",
    nombre: "Manejo del Drenaje Torácico",
  ),
  "3350": const Intervencion(
    idIntervencion: "3350",
    idNIC: "3350",
    nombre: "Monitorización de la Respuesta Pulmonar a la Ventilación",
  ),
  "3325": const Intervencion(
    idIntervencion: "3325",
    idNIC: "3325",
    nombre: "Monitorización de la Saturación de Oxígeno",
  ),
  "3250": const Intervencion(
    idIntervencion: "3250",
    idNIC: "3250",
    nombre: "Fisioterapia Torácica",
  ),
  "1415": const Intervencion(
    idIntervencion: "1415",
    idNIC: "1415",
    nombre: "Manejo del Dolor Postoperatorio Torácico",
  ),
  "3355": const Intervencion(
    idIntervencion: "3355",
    idNIC: "3355",
    nombre: "Prevención de la Neumonía Asociada a Ventilador",
  ),
  "2900": const Intervencion(
    idIntervencion: "2900",
    idNIC: "2900",
    nombre: "Cuidado del Paciente con Cirugía Torácica",
  ),
  "3322": const Intervencion(
    idIntervencion: "3322",
    idNIC: "3322",
    nombre: "Manejo del Paciente con Insuficiencia Respiratoria Aguda",
  ),
  "4140": const Intervencion(
    idIntervencion: "4140",
    idNIC: "4140",
    nombre: "Monitorización de la Presión Arterial No Invasiva",
  ),
  "3326": const Intervencion(
    idIntervencion: "3326",
    idNIC: "3326",
    nombre: "Cuidado del Paciente con Edema Pulmonar",
  ),
  "2920": const Intervencion(
    idIntervencion: "2920",
    idNIC: "2920",
    nombre: "Prevención de Tromboembolismo Pulmonar",
  ),

  // REGIÓN ABDOMINAL
  "1050": const Intervencion(
    idIntervencion: "1050",
    idNIC: "1050",
    nombre: "Manejo de la Nutrición Enteral",
  ),
  "1052": const Intervencion(
    idIntervencion: "1052",
    idNIC: "1052",
    nombre: "Manejo de la Nutrición Parenteral",
  ),
  "2010": const Intervencion(
    idIntervencion: "2010",
    idNIC: "2010",
    nombre: "Monitoreo de la Función Gastrointestinal",
  ),
  "2900-A": const Intervencion(
    idIntervencion: "2900-A",
    idNIC: "2900-A",
    nombre: "Manejo del Paciente con Cirugía Abdominal",
  ),
  "1802": const Intervencion(
    idIntervencion: "1802",
    idNIC: "1802",
    nombre: "Cuidados del Paciente con Ostomía",
  ),
  "1415-A": const Intervencion(
    idIntervencion: "1415-A",
    idNIC: "1415-A",
    nombre: "Manejo del Dolor Abdominal",
  ),
  "4170": const Intervencion(
    idIntervencion: "4170",
    idNIC: "4170",
    nombre: "Prevención de la Hemorragia Digestiva",
  ),
  "2080": const Intervencion(
    idIntervencion: "2080",
    idNIC: "2080",
    nombre: "Manejo del Paciente con Insuficiencia Hepática",
  ),
  "0460": const Intervencion(
    idIntervencion: "0460",
    idNIC: "0460",
    nombre: "Control de la Diarrea",
  ),
  "0450": const Intervencion(
    idIntervencion: "0450",
    idNIC: "0450",
    nombre: "Control del Estreñimiento",
  ),
  "4190": const Intervencion(
    idIntervencion: "4190",
    idNIC: "4190",
    nombre: "Manejo del Paciente con Ascitis",
  ),
  "2030": const Intervencion(
    idIntervencion: "2030",
    idNIC: "2030",
    nombre: "Manejo del Paciente con Pancreatitis Aguda",
  ),
  "1850": const Intervencion(
    idIntervencion: "1850",
    idNIC: "1850",
    nombre: "Monitorización del Reflujo Gastroesofágico",
  ),
  "2075": const Intervencion(
    idIntervencion: "2075",
    idNIC: "2075",
    nombre: "Manejo de la Hipertensión Portal",
  ),
  "2890": const Intervencion(
    idIntervencion: "2890",
    idNIC: "2890",
    nombre: "Manejo del Paciente con Apendicitis",
  ),
  "2905": const Intervencion(
    idIntervencion: "2905",
    idNIC: "2905",
    nombre: "Cuidado del Paciente con Hernia Abdominal",
  ),
  "2050": const Intervencion(
    idIntervencion: "2050",
    idNIC: "2050",
    nombre: "Monitorización de la Peritonitis",
  ),
  "2008": const Intervencion(
    idIntervencion: "2008",
    idNIC: "2008",
    nombre: "Manejo del Paciente con Síndrome de Intestino Corto",
  ),
  "2895": const Intervencion(
    idIntervencion: "2895",
    idNIC: "2895",
    nombre: "Cuidados del Paciente con Colecistitis",
  ),
  "4175": const Intervencion(
    idIntervencion: "4175",
    idNIC: "4175",
    nombre: "Manejo del Paciente con Síndrome Compartimental Abdominal",
  ),

  // REGIÓN PÉLVICA Y PERIANAL
  "0590": const Intervencion(
    idIntervencion: "0590",
    idNIC: "0590",
    nombre: "Manejo de la Eliminación Urinaria",
  ),
  "1876": const Intervencion(
    idIntervencion: "1876",
    idNIC: "1876",
    nombre: "Cuidados del Paciente con Sonda Vesical",
  ),
  "0595": const Intervencion(
    idIntervencion: "0595",
    idNIC: "0595",
    nombre: "Monitorización de la Retención Urinaria",
  ),
  "0591": const Intervencion(
    idIntervencion: "0591",
    idNIC: "0591",
    nombre: "Manejo del Paciente con Incontinencia Urinaria",
  ),
  "1845": const Intervencion(
    idIntervencion: "1845",
    idNIC: "1845",
    nombre: "Cuidados del Paciente con Fístula Perianal",
  ),
  "0610": const Intervencion(
    idIntervencion: "0610",
    idNIC: "0610",
    nombre: "Manejo del Paciente con Prolapso Rectal",
  ),
  "1804": const Intervencion(
    idIntervencion: "1804",
    idNIC: "1804",
    nombre: "Cuidados del Paciente con Hemorroides",
  ),
  "1416": const Intervencion(
    idIntervencion: "1416",
    idNIC: "1416",
    nombre: "Manejo del Dolor Pélvico",
  ),
  "1803": const Intervencion(
    idIntervencion: "1803",
    idNIC: "1803",
    nombre: "Cuidados del Paciente con Colostomía",
  ),
  "0600": const Intervencion(
    idIntervencion: "0600",
    idNIC: "0600",
    nombre: "Manejo del Paciente con Cistostomía",
  ),
  "1200": const Intervencion(
    idIntervencion: "1200",
    idNIC: "1200",
    nombre: "Manejo del Paciente con Endometriosis",
  ),
  "2085": const Intervencion(
    idIntervencion: "2085",
    idNIC: "2085",
    nombre: "Cuidados del Paciente con Infección Pélvica",
  ),
  "1205": const Intervencion(
    idIntervencion: "1205",
    idNIC: "1205",
    nombre: "Manejo del Paciente con Dispareunia",
  ),
  "2100": const Intervencion(
    idIntervencion: "2100",
    idNIC: "2100",
    nombre: "Monitorización del Paciente con Cáncer Ginecológico",
  ),
  "0585": const Intervencion(
    idIntervencion: "0585",
    idNIC: "0585",
    nombre: "Manejo del Paciente con Hipertrofia Prostática",
  ),
  "0455": const Intervencion(
    idIntervencion: "0455",
    idNIC: "0455",
    nombre: "Manejo del Paciente con Estreñimiento Crónico",
  ),
  "1877": const Intervencion(
    idIntervencion: "1877",
    idNIC: "1877",
    nombre: "Cuidados del Paciente con Infección Urinaria",
  ),
  "0740": const Intervencion(
    idIntervencion: "0740",
    idNIC: "0740",
    nombre: "Manejo del Paciente con Úlceras por Presión Perineales",
  ),
  "1805": const Intervencion(
    idIntervencion: "1805",
    idNIC: "1805",
    nombre: "Cuidados del Paciente con Absceso Perianal",
  ),
};

final Map<String, List<Actividad>> actividadesDeIntervencion = {
  // REGIÓN CEFÁLICA (CABEZA Y CUELLO)
  "3160": [
    const Actividad(
        idActividad: '3160-001',
        descripcion:
            'Verificar posición del tubo endotraqueal mediante auscultación y medición de la profundidad'),
    const Actividad(
        idActividad: '3160-002',
        descripcion:
            'Asegurar fijación del tubo con dispositivo apropiado para prevenir desplazamiento'),
    const Actividad(
        idActividad: '3160-003',
        descripcion:
            'Mantener presión del neumotaponamiento entre 20-30 cmH2O'),
    const Actividad(
        idActividad: '3160-004',
        descripcion:
            'Realizar cambios posturales cada 2 horas para prevenir úlceras por presión'),
    const Actividad(
        idActividad: '3160-005',
        descripcion:
            'Evaluar necesidad de aspiración de secreciones según ruidos respiratorios y saturación'),
  ],

  "2620": [
    const Actividad(
        idActividad: '2620-001',
        descripcion:
            'Evaluar Escala de Coma de Glasgow (apertura ocular, respuesta verbal y motora)'),
    const Actividad(
        idActividad: '2620-002',
        descripcion:
            'Monitorizar tamaño, simetría y reactividad pupilar con luz focal'),
    const Actividad(
        idActividad: '2620-003',
        descripcion:
            'Documentar presencia de movimientos anormales o crisis convulsivas'),
    const Actividad(
        idActividad: '2620-004',
        descripcion:
            'Evaluar respuesta a estímulos dolorosos (supraorbitario o esternal)'),
  ],

  "2940": [
    const Actividad(
        idActividad: '2940-001',
        descripcion:
            'Monitorizar valores de presión intracraneana continuamente'),
    const Actividad(
        idActividad: '2940-002',
        descripcion:
            'Mantener cabecera elevada a 30-45 grados (salvo contraindicación)'),
    const Actividad(
        idActividad: '2940-003',
        descripcion:
            'Administrar manitol al 20% o solución salina hipertónica según protocolo'),
    const Actividad(
        idActividad: '2940-004',
        descripcion:
            'Evitar maniobras que aumenten PIC (tos, esfuerzo, flexión cervical)'),
  ],

  "3180": [
    const Actividad(
        idActividad: '3180-001',
        descripcion:
            'Realizar curación del estoma con solución estéril cada 24 horas'),
    const Actividad(
        idActividad: '3180-002',
        descripcion:
            'Cambiar cánula interna según protocolo (generalmente cada 8-12 horas)'),
    const Actividad(
        idActividad: '3180-003',
        descripcion:
            'Verificar permeabilidad mediante observación de flujo aéreo'),
    const Actividad(
        idActividad: '3180-004',
        descripcion: 'Aspirar secreciones con técnica estéril según necesidad'),
  ],

  "3320": [
    const Actividad(
        idActividad: '3320-001',
        descripcion:
            'Ajustar flujo de oxígeno según prescripción y saturación objetivo'),
    const Actividad(
        idActividad: '3320-002',
        descripcion: 'Monitorizar SpO2 continuamente con pulsioxímetro'),
    const Actividad(
        idActividad: '3320-003',
        descripcion:
            'Evaluar necesidad de ajuste de FiO2 según gases arteriales'),
    const Actividad(
        idActividad: '3320-004',
        descripcion:
            'Mantener humidificación adecuada del oxígeno administrado'),
  ],

  "2390": [
    const Actividad(
        idActividad: '2390-001',
        descripcion:
            'Evaluar intensidad del dolor usando escala EVA o conductual'),
    const Actividad(
        idActividad: '2390-002',
        descripcion: 'Administrar analgesia según escala analgésica de la OMS'),
    const Actividad(
        idActividad: '2390-003',
        descripcion: 'Monitorizar nivel de sedación con escala RASS'),
    const Actividad(
        idActividad: '2390-004',
        descripcion:
            'Evaluar depresión respiratoria (frecuencia y profundidad)'),
  ],

  "4040": [
    const Actividad(
        idActividad: '4040-001',
        descripcion: 'Calibrar transductor de presión arterial cada 8 horas'),
    const Actividad(
        idActividad: '4040-002',
        descripcion: 'Posicionar transductor a nivel de la aurícula derecha'),
    const Actividad(
        idActividad: '4040-003',
        descripcion: 'Monitorizar presión arterial media (PAM) continuamente'),
    const Actividad(
        idActividad: '4040-004',
        descripcion: 'Cambiar sistema de presión arterial cada 96 horas'),
  ],

  "1660": [
    const Actividad(
        idActividad: '1660-001',
        descripcion: 'Realizar higiene ocular con solución salina estéril'),
    const Actividad(
        idActividad: '1660-002',
        descripcion: 'Aplicar lubricante ocular cada 4-6 horas'),
    const Actividad(
        idActividad: '1660-003',
        descripcion: 'Mantener párpados cerrados en pacientes inconscientes'),
    const Actividad(
        idActividad: '1660-004',
        descripcion: 'Evaluar córnea con luz azul y fluoresceína'),
  ],

  "1400": [
    const Actividad(
        idActividad: '1400-001',
        descripcion:
            'Evaluar características del dolor (localización, intensidad, calidad)'),
    const Actividad(
        idActividad: '1400-002',
        descripcion: 'Administrar gabapentinoides para dolor neuropático'),
    const Actividad(
        idActividad: '1400-003',
        descripcion: 'Controlar factores ambientales (luz, ruido)'),
    const Actividad(
        idActividad: '1400-004',
        descripcion: 'Aplicar compresas frías/calientes según indicación'),
  ],

  "2445": [
    const Actividad(
        idActividad: '2445-001',
        descripcion: 'Realizar curación con clorhexidina al 2% cada 7 días'),
    const Actividad(
        idActividad: '2445-002',
        descripcion: 'Cambiar conexiones cada 96 horas'),
    const Actividad(
        idActividad: '2445-003',
        descripcion: 'Verificar permeabilidad con lavado suave con suero'),
    const Actividad(
        idActividad: '2445-004',
        descripcion: 'Sellar con heparina 10 UI/ml en adultos'),
  ],

  "4120": [
    const Actividad(
        idActividad: '4120-001',
        descripcion: 'Monitorizar saturación yugular (SjO2) continuamente'),
    const Actividad(
        idActividad: '4120-002',
        descripcion: 'Calcular diferencia arterio-yugular de oxígeno (AVDO2)'),
    const Actividad(
        idActividad: '4120-003',
        descripcion: 'Evaluar reactividad cerebrovascular'),
    const Actividad(
        idActividad: '4120-004',
        descripcion: 'Monitorizar presión tisular cerebral (PtiO2)'),
  ],

  "3900": [
    const Actividad(
        idActividad: '3900-001',
        descripcion: 'Monitorizar temperatura central cada 1-2 horas'),
    const Actividad(
        idActividad: '3900-002',
        descripcion: 'Aplicar medidas de enfriamiento en hipertermia'),
    const Actividad(
        idActividad: '3900-003',
        descripcion: 'Usar mantas térmicas en hipotermia'),
    const Actividad(
        idActividad: '3900-004',
        descripcion: 'Prevenir escalofríos con meperidina si es necesario'),
  ],

  "3540": [
    const Actividad(
        idActividad: '3540-001',
        descripcion: 'Aplicar apósitos protectores en zonas de presión'),
    const Actividad(
        idActividad: '3540-002',
        descripcion: 'Cambiar posición del tubo endotraqueal cada 24h'),
    const Actividad(
        idActividad: '3540-003',
        descripcion: 'Usar almohadillas de protección en puntos de fricción'),
    const Actividad(
        idActividad: '3540-004', descripcion: 'Evaluar piel facial cada turno'),
  ],

  "3165": [
    const Actividad(
        idActividad: '3165-001',
        descripcion: 'Realizar aspiración con técnica estéril'),
    const Actividad(
        idActividad: '3165-002',
        descripcion: 'Preoxigenar al 100% antes de aspirar'),
    const Actividad(
        idActividad: '3165-003',
        descripcion: 'Limitar tiempo de aspiración a <15 segundos'),
    const Actividad(
        idActividad: '3165-004',
        descripcion: 'Evaluar necesidad según ruidos respiratorios'),
  ],

  "3200": [
    const Actividad(
        idActividad: '3200-001',
        descripcion:
            'Mantener cabecera elevada 30-45° (salvo contraindicación)'),
    const Actividad(
        idActividad: '3200-002',
        descripcion: 'Verificar presión del neumotaponamiento'),
    const Actividad(
        idActividad: '3200-003',
        descripcion: 'Evaluar reflejo de deglución antes de alimentar'),
    const Actividad(
        idActividad: '3200-004',
        descripcion: 'Realizar higiene bucal frecuente'),
  ],

  "2625": [
    const Actividad(
        idActividad: '2625-001',
        descripcion: 'Evaluar reflejo fotomotor directo y consensual'),
    const Actividad(
        idActividad: '2625-002',
        descripcion: 'Valorar reflejo corneal con toque suave'),
    const Actividad(
        idActividad: '2625-003', descripcion: 'Evaluar reflejo tusígeno'),
    const Actividad(
        idActividad: '2625-004',
        descripcion: 'Documentar presencia/ausencia de reflejos protectores'),
  ],

  "1710": [
    const Actividad(
        idActividad: '1710-001',
        descripcion: 'Realizar higiene bucal cada 4-6 horas'),
    const Actividad(
        idActividad: '1710-002',
        descripcion: 'Usar cepillo de dientes suave y clorhexidina'),
    const Actividad(
        idActividad: '1710-003',
        descripcion: 'Aplicar lubricante labial frecuentemente'),
    const Actividad(
        idActividad: '1710-004', descripcion: 'Evaluar mucosa oral cada turno'),
  ],

  "6400": [
    const Actividad(
        idActividad: '6400-001',
        descripcion: 'Proteger vía aérea durante la crisis'),
    const Actividad(
        idActividad: '6400-002',
        descripcion: 'Administrar benzodiazepinas según protocolo'),
    const Actividad(
        idActividad: '6400-003',
        descripcion: 'Monitorizar función respiratoria post-crisis'),
    const Actividad(
        idActividad: '6400-004',
        descripcion: 'Documentar características de la crisis'),
  ],

  "6440": [
    const Actividad(
        idActividad: '6440-001',
        descripcion: 'Aplicar escala CAM-ICU cada turno'),
    const Actividad(
        idActividad: '6440-002',
        descripcion: 'Orientar al paciente frecuentemente'),
    const Actividad(
        idActividad: '6440-003',
        descripcion: 'Mantener ciclo sueño-vigilia adecuado'),
    const Actividad(
        idActividad: '6440-004',
        descripcion: 'Evitar restricciones físicas innecesarias'),
  ],

  "4820": [
    const Actividad(
        idActividad: '4820-001',
        descripcion: 'Realizar escala de sedación cada 4 horas'),
    const Actividad(
        idActividad: '4820-002',
        descripcion: 'Titular sedación de forma gradual'),
    const Actividad(
        idActividad: '4820-003',
        descripcion: 'Monitorizar signos de abstinencia'),
    const Actividad(
        idActividad: '4820-004',
        descripcion: 'Administrar terapia sustitutiva si es necesario'),
  ],

  // REGIÓN TORÁCICA
  "4220": [
    const Actividad(
        idActividad: '4220-001', descripcion: 'Monitorizar ECG continuamente'),
    const Actividad(
        idActividad: '4220-002',
        descripcion: 'Registrar balance hídrico estricto'),
    const Actividad(
        idActividad: '4220-003', descripcion: 'Evaluar pulsos periféricos'),
    const Actividad(
        idActividad: '4220-004',
        descripcion: 'Controlar presión venosa central'),
  ],

  "4250": [
    const Actividad(
        idActividad: '4250-001',
        descripcion: 'Calibrar sistema de presión arterial'),
    const Actividad(
        idActividad: '4250-002', descripcion: 'Monitorizar PVC, PAM, PCP'),
    const Actividad(
        idActividad: '4250-003', descripcion: 'Mantener líneas libres de aire'),
    const Actividad(
        idActividad: '4250-004',
        descripcion: 'Cambiar apósitos de acceso cada 72h'),
  ],

  "4210": [
    const Actividad(
        idActividad: '4210-001', descripcion: 'Preparar medicación vasoactiva'),
    const Actividad(
        idActividad: '4210-002',
        descripcion: 'Utilizar bombas de infusión controlada'),
    const Actividad(
        idActividad: '4210-003',
        descripcion: 'Titular según parámetros hemodinámicos'),
    const Actividad(
        idActividad: '4210-004',
        descripcion: 'Monitorizar efectos secundarios'),
  ],

  "1410": [
    const Actividad(
        idActividad: '1410-001',
        descripcion: 'Evaluar características del dolor torácico'),
    const Actividad(
        idActividad: '1410-002',
        descripcion: 'Administrar nitroglicerina sublingual si está indicado'),
    const Actividad(
        idActividad: '1410-003',
        descripcion: 'Monitorizar ECG durante el episodio doloroso'),
    const Actividad(
        idActividad: '1410-004',
        descripcion: 'Evaluar respuesta al tratamiento analgésico'),
  ],

  "3430": [
    const Actividad(
        idActividad: '3430-001',
        descripcion: 'Verificar funcionamiento del sistema de drenaje'),
    const Actividad(
        idActividad: '3430-002',
        descripcion: 'Medir y registrar volumen drenado'),
    const Actividad(
        idActividad: '3430-003',
        descripcion: 'Evaluar características del líquido drenado'),
    const Actividad(
        idActividad: '3430-004',
        descripcion: 'Mantener sistema cerrado y estanco'),
  ],

  "3350": [
    const Actividad(
        idActividad: '3350-001',
        descripcion: 'Monitorizar presión de vía aérea'),
    const Actividad(
        idActividad: '3350-002',
        descripcion: 'Evaluar volúmenes corrientes espirados'),
    const Actividad(
        idActividad: '3350-003', descripcion: 'Observar curva presión-volumen'),
    const Actividad(
        idActividad: '3350-004',
        descripcion: 'Ajustar parámetros ventilatorios según respuesta'),
  ],

  "3325": [
    const Actividad(
        idActividad: '3325-001', descripcion: 'Monitorizar SpO2 continuamente'),
    const Actividad(
        idActividad: '3325-002',
        descripcion: 'Verificar calidad de la onda de pulso'),
    const Actividad(
        idActividad: '3325-003',
        descripcion: 'Comparar con gases arteriales periódicamente'),
    const Actividad(
        idActividad: '3325-004', descripcion: 'Limpiar sensor cada 8 horas'),
  ],

  "3250": [
    const Actividad(
        idActividad: '3250-001',
        descripcion: 'Realizar percusión y vibración torácica'),
    const Actividad(
        idActividad: '3250-002',
        descripcion: 'Enseñar tos dirigida y espirometría incentivada'),
    const Actividad(
        idActividad: '3250-003',
        descripcion: 'Posicionar para drenaje postural'),
    const Actividad(
        idActividad: '3250-004', descripcion: 'Evaluar respuesta a la terapia'),
  ],

  "1415": [
    const Actividad(
        idActividad: '1415-001',
        descripcion: 'Evaluar dolor con escalas validadas'),
    const Actividad(
        idActividad: '1415-002',
        descripcion: 'Administrar analgesia multimodal'),
    const Actividad(
        idActividad: '1415-003',
        descripcion: 'Enseñar respiración diafragmática'),
    const Actividad(
        idActividad: '1415-004',
        descripcion: 'Aplicar compresas tibias en zona operatoria'),
  ],

  "3355": [
    const Actividad(
        idActividad: '3355-001',
        descripcion: 'Mantener cabecera elevada 30-45°'),
    const Actividad(
        idActividad: '3355-002',
        descripcion: 'Realizar higiene bucal con clorhexidina'),
    const Actividad(
        idActividad: '3355-003', descripcion: 'Drenar secreciones subglóticas'),
    const Actividad(
        idActividad: '3355-004',
        descripcion: 'Evitar desconexiones innecesarias del ventilador'),
  ],

  "2900": [
    const Actividad(
        idActividad: '2900-001', descripcion: 'Monitorizar drenajes torácicos'),
    const Actividad(
        idActividad: '2900-002',
        descripcion: 'Evaluar función respiratoria postoperatoria'),
    const Actividad(
        idActividad: '2900-003', descripcion: 'Controlar dolor torácico'),
    const Actividad(
        idActividad: '2900-004', descripcion: 'Fomentar movilización temprana'),
  ],

  "3322": [
    const Actividad(
        idActividad: '3322-001', descripcion: 'Monitorizar gases arteriales'),
    const Actividad(
        idActividad: '3322-002',
        descripcion: 'Ajustar parámetros ventilatorios'),
    const Actividad(
        idActividad: '3322-003', descripcion: 'Evaluar trabajo respiratorio'),
    const Actividad(
        idActividad: '3322-004',
        descripcion: 'Posicionar en decúbito prono si está indicado'),
  ],

  "4140": [
    const Actividad(
        idActividad: '4140-001',
        descripcion: 'Seleccionar manguito de tamaño adecuado'),
    const Actividad(
        idActividad: '4140-002',
        descripcion: 'Posicionar brazo a nivel del corazón'),
    const Actividad(
        idActividad: '4140-003',
        descripcion: 'Programar frecuencia de mediciones'),
    const Actividad(
        idActividad: '4140-004',
        descripcion: 'Comparar con mediciones invasivas si existen'),
  ],

  "3326": [
    const Actividad(
        idActividad: '3326-001',
        descripcion: 'Administrar diuréticos según prescripción'),
    const Actividad(
        idActividad: '3326-002',
        descripcion: 'Monitorizar presión venosa central'),
    const Actividad(
        idActividad: '3326-003',
        descripcion: 'Restringir líquidos si está indicado'),
    const Actividad(
        idActividad: '3326-004', descripcion: 'Posicionar en Fowler alto'),
  ],

  "2920": [
    const Actividad(
        idActividad: '2920-001',
        descripcion: 'Aplicar heparina subcutánea según protocolo'),
    const Actividad(
        idActividad: '2920-002', descripcion: 'Fomentar movilización temprana'),
    const Actividad(
        idActividad: '2920-003',
        descripcion: 'Usar medias de compresión graduada'),
    const Actividad(
        idActividad: '2920-004', descripcion: 'Evaluar signos de TVP'),
  ],

  // REGIÓN ABDOMINAL
  "1050": [
    const Actividad(
        idActividad: '1050-001',
        descripcion: 'Verificar posición de sonda con pH o radiografía'),
    const Actividad(
        idActividad: '1050-002',
        descripcion: 'Administrar nutrición a temperatura ambiente'),
    const Actividad(
        idActividad: '1050-003',
        descripcion: 'Lavar sonda con 30ml agua cada 4-6h'),
    const Actividad(
        idActividad: '1050-004',
        descripcion: 'Controlar residuo gástrico cada 4h'),
  ],

  "1052": [
    const Actividad(
        idActividad: '1052-001',
        descripcion: 'Verificar permeabilidad de acceso central'),
    const Actividad(
        idActividad: '1052-002',
        descripcion: 'Administrar solución según velocidad prescrita'),
    const Actividad(
        idActividad: '1052-003',
        descripcion: 'Monitorizar glucemia cada 4-6 horas'),
    const Actividad(
        idActividad: '1052-004',
        descripcion: 'Evaluar función hepática periódicamente'),
  ],

  "2010": [
    const Actividad(
        idActividad: '2010-001',
        descripcion: 'Auscultar ruidos intestinales cada 4-8h'),
    const Actividad(
        idActividad: '2010-002', descripcion: 'Evaluar distensión abdominal'),
    const Actividad(
        idActividad: '2010-003',
        descripcion: 'Monitorizar emisión de gases y deposiciones'),
    const Actividad(
        idActividad: '2010-004', descripcion: 'Documentar náuseas/vómitos'),
  ],

  "2900-A": [
    const Actividad(
        idActividad: '2900-A-001',
        descripcion: 'Monitorizar drenajes abdominales'),
    const Actividad(
        idActividad: '2900-A-002',
        descripcion: 'Evaluar características del líquido drenado'),
    const Actividad(
        idActividad: '2900-A-003',
        descripcion: 'Controlar dolor postoperatorio'),
    const Actividad(
        idActividad: '2900-A-004',
        descripcion: 'Fomentar deambulación temprana'),
  ],

  "1802": [
    const Actividad(
        idActividad: '1802-001',
        descripcion: 'Realizar curación periestomal con agua y jabón'),
    const Actividad(
        idActividad: '1802-002',
        descripcion: 'Evaluar integridad de la piel periestomal'),
    const Actividad(
        idActividad: '1802-003',
        descripcion: 'Cambiar dispositivo según necesidad'),
    const Actividad(
        idActividad: '1802-004',
        descripcion: 'Enseñar autocuidado al paciente'),
  ],

  "1415-A": [
    const Actividad(
        idActividad: '1415-A-001',
        descripcion: 'Evaluar características del dolor abdominal'),
    const Actividad(
        idActividad: '1415-A-002',
        descripcion: 'Administrar analgesia según escalafón'),
    const Actividad(
        idActividad: '1415-A-003',
        descripcion: 'Aplicar calor local si está indicado'),
    const Actividad(
        idActividad: '1415-A-004',
        descripcion: 'Monitorizar respuesta al tratamiento'),
  ],

  "4170": [
    const Actividad(
        idActividad: '4170-001',
        descripcion: 'Administrar protectores gástricos'),
    const Actividad(
        idActividad: '4170-002',
        descripcion: 'Monitorizar hemoglobina/hematocrito'),
    const Actividad(
        idActividad: '4170-003',
        descripcion: 'Evaluar signos de sangrado digestivo'),
    const Actividad(
        idActividad: '4170-004', descripcion: 'Controlar pH gástrico'),
  ],

  "2080": [
    const Actividad(
        idActividad: '2080-001',
        descripcion: 'Monitorizar encefalopatía hepática'),
    const Actividad(
        idActividad: '2080-002',
        descripcion: 'Controlar balance hídrico estricto'),
    const Actividad(
        idActividad: '2080-003',
        descripcion: 'Restringir proteínas si está indicado'),
    const Actividad(
        idActividad: '2080-004', descripcion: 'Evaluar función de coagulación'),
  ],

  "0460": [
    const Actividad(
        idActividad: '0460-001',
        descripcion:
            'Monitorizar frecuencia y características de deposiciones'),
    const Actividad(
        idActividad: '0460-002',
        descripcion: 'Administrar antidiarreicos según prescripción'),
    const Actividad(
        idActividad: '0460-003', descripcion: 'Mantener hidratación adecuada'),
    const Actividad(
        idActividad: '0460-004',
        descripcion: 'Realizar higiene perianal después de cada deposición'),
  ],

  "0450": [
    const Actividad(
        idActividad: '0450-001',
        descripcion: 'Evaluar frecuencia deposicional'),
    const Actividad(
        idActividad: '0450-002',
        descripcion: 'Administrar laxantes según indicación'),
    const Actividad(
        idActividad: '0450-003',
        descripcion: 'Fomentar ingesta de fibra y líquidos'),
    const Actividad(
        idActividad: '0450-004',
        descripcion: 'Enseñar técnicas de masaje abdominal'),
  ],

  "4190": [
    const Actividad(
        idActividad: '4190-001',
        descripcion: 'Medir perímetro abdominal diario'),
    const Actividad(
        idActividad: '4190-002', descripcion: 'Controlar balance hídrico'),
    const Actividad(
        idActividad: '4190-003',
        descripcion: 'Administrar diuréticos según prescripción'),
    const Actividad(
        idActividad: '4190-004',
        descripcion: 'Preparar para paracentesis si está indicado'),
  ],

  "2030": [
    const Actividad(
        idActividad: '2030-001', descripcion: 'Mantener NPO según indicación'),
    const Actividad(
        idActividad: '2030-002', descripcion: 'Administrar analgesia adecuada'),
    const Actividad(
        idActividad: '2030-003', descripcion: 'Monitorizar amilasas/lipasas'),
    const Actividad(
        idActividad: '2030-004', descripcion: 'Controlar signos de infección'),
  ],

  "1850": [
    const Actividad(
        idActividad: '1850-001',
        descripcion: 'Evaluar pirosis y regurgitación'),
    const Actividad(
        idActividad: '1850-002',
        descripcion: 'Mantener cabecera elevada después de comer'),
    const Actividad(
        idActividad: '1850-003',
        descripcion: 'Administrar antiácidos/procinéticos'),
    const Actividad(
        idActividad: '1850-004',
        descripcion: 'Recomendar comidas pequeñas y frecuentes'),
  ],

  "2075": [
    const Actividad(
        idActividad: '2075-001',
        descripcion: 'Monitorizar signos de sangrado variceal'),
    const Actividad(
        idActividad: '2075-002',
        descripcion: 'Administrar betabloqueadores no selectivos'),
    const Actividad(
        idActividad: '2075-003',
        descripcion: 'Preparar para endoscopia terapéutica'),
    const Actividad(
        idActividad: '2075-004', descripcion: 'Restringir sodio en dieta'),
  ],

  "2890": [
    const Actividad(
        idActividad: '2890-001',
        descripcion: 'Monitorizar signos de peritonitis'),
    const Actividad(
        idActividad: '2890-002',
        descripcion: 'Administrar antibioterapia preoperatoria'),
    const Actividad(
        idActividad: '2890-003', descripcion: 'Controlar dolor abdominal'),
    const Actividad(
        idActividad: '2890-004',
        descripcion: 'Preparar para intervención quirúrgica'),
  ],

  "2905": [
    const Actividad(
        idActividad: '2905-001',
        descripcion: 'Evaluar tamaño y reducibilidad de la hernia'),
    const Actividad(
        idActividad: '2905-002', descripcion: 'Enseñar a evitar esfuerzos'),
    const Actividad(
        idActividad: '2905-003',
        descripcion: 'Preparar para reparación quirúrgica'),
    const Actividad(
        idActividad: '2905-004',
        descripcion: 'Monitorizar signos de estrangulación'),
  ],

  "2050": [
    const Actividad(
        idActividad: '2050-001',
        descripcion: 'Monitorizar signos de irritación peritoneal'),
    const Actividad(
        idActividad: '2050-002',
        descripcion: 'Administrar antibioterapia de amplio espectro'),
    const Actividad(
        idActividad: '2050-003', descripcion: 'Controlar drenajes quirúrgicos'),
    const Actividad(
        idActividad: '2050-004',
        descripcion: 'Mantener NPO hasta resolución del íleo'),
  ],

  "2008": [
    const Actividad(
        idActividad: '2008-001',
        descripcion: 'Administrar nutrición parenteral'),
    const Actividad(
        idActividad: '2008-002',
        descripcion: 'Monitorizar electrolitos y nutricionales'),
    const Actividad(
        idActividad: '2008-003',
        descripcion: 'Introducir nutrición enteral gradualmente'),
    const Actividad(
        idActividad: '2008-004',
        descripcion: 'Suplementar vitaminas y minerales'),
  ],

  "2895": [
    const Actividad(
        idActividad: '2895-001',
        descripcion: 'Controlar dolor en cuadrante superior derecho'),
    const Actividad(
        idActividad: '2895-002',
        descripcion: 'Administrar espasmolíticos si está indicado'),
    const Actividad(
        idActividad: '2895-003',
        descripcion: 'Monitorizar signos de colangitis'),
    const Actividad(
        idActividad: '2895-004',
        descripcion: 'Preparar para colecistectomía si es necesario'),
  ],

  "4175": [
    const Actividad(
        idActividad: '4175-001', descripcion: 'Medir presión intraabdominal'),
    const Actividad(
        idActividad: '4175-002', descripcion: 'Monitorizar perfusión orgánica'),
    const Actividad(
        idActividad: '4175-003',
        descripcion: 'Preparar para descompresión quirúrgica'),
    const Actividad(
        idActividad: '4175-004',
        descripcion: 'Optimizar reanimación de fluidos'),
  ],

  // REGIÓN PÉLVICA Y PERIANAL
  "0590": [
    const Actividad(
        idActividad: '0590-001', descripcion: 'Monitorizar diuresis horaria'),
    const Actividad(
        idActividad: '0590-002',
        descripcion: 'Evaluar características de la orina'),
    const Actividad(
        idActividad: '0590-003',
        descripcion: 'Realizar cateterismo vesical según necesidad'),
    const Actividad(
        idActividad: '0590-004',
        descripcion: 'Mantener sistema de drenaje cerrado'),
  ],

  "1876": [
    const Actividad(
        idActividad: '1876-001', descripcion: 'Realizar higiene meatal diaria'),
    const Actividad(
        idActividad: '1876-002',
        descripcion: 'Mantener bolsa colectora por debajo de vejiga'),
    const Actividad(
        idActividad: '1876-003', descripcion: 'Cambiar sonda según protocolo'),
    const Actividad(
        idActividad: '1876-004',
        descripcion: 'Evaluar signos de infección urinaria'),
  ],

  "0595": [
    const Actividad(
        idActividad: '0595-001', descripcion: 'Palpar globo vesical'),
    const Actividad(
        idActividad: '0595-002',
        descripcion: 'Realizar cateterismo intermitente'),
    const Actividad(
        idActividad: '0595-003',
        descripcion: 'Administrar colinérgicos si está indicado'),
    const Actividad(
        idActividad: '0595-004', descripcion: 'Evaluar causa de la retención'),
  ],

  "0591": [
    const Actividad(
        idActividad: '0591-001',
        descripcion: 'Identificar tipo de incontinencia'),
    const Actividad(
        idActividad: '0591-002', descripcion: 'Enseñar ejercicios de Kegel'),
    const Actividad(
        idActividad: '0591-003', descripcion: 'Usar absorbentes adecuados'),
    const Actividad(
        idActividad: '0591-004', descripcion: 'Programar micciones regulares'),
  ],

  "1845": [
    const Actividad(
        idActividad: '1845-001',
        descripcion: 'Realizar curaciones con solución salina'),
    const Actividad(
        idActividad: '1845-002', descripcion: 'Aplicar apósitos absorbentes'),
    const Actividad(
        idActividad: '1845-003', descripcion: 'Mantener área limpia y seca'),
    const Actividad(
        idActividad: '1845-004', descripcion: 'Prevenir maceración de la piel'),
  ],

  "0610": [
    const Actividad(
        idActividad: '0610-001',
        descripcion: 'Realizar baños de asiento tibios'),
    const Actividad(
        idActividad: '0610-002', descripcion: 'Enseñar reducción manual suave'),
    const Actividad(
        idActividad: '0610-003',
        descripcion: 'Administrar ablandadores de heces'),
    const Actividad(
        idActividad: '0610-004',
        descripcion: 'Preparar para corrección quirúrgica'),
  ],

  "1804": [
    const Actividad(
        idActividad: '1804-001',
        descripcion: 'Aplicar tratamiento tópico según indicación'),
    const Actividad(
        idActividad: '1804-002', descripcion: 'Enseñar higiene anal adecuada'),
    const Actividad(
        idActividad: '1804-003',
        descripcion: 'Administrar analgésicos para dolor agudo'),
    const Actividad(
        idActividad: '1804-004', descripcion: 'Recomendar dieta rica en fibra'),
  ],

  "1416": [
    const Actividad(
        idActividad: '1416-001',
        descripcion: 'Evaluar características del dolor pélvico'),
    const Actividad(
        idActividad: '1416-002', descripcion: 'Administrar analgesia adecuada'),
    const Actividad(
        idActividad: '1416-003',
        descripcion: 'Aplicar calor local si está indicado'),
    const Actividad(
        idActividad: '1416-004',
        descripcion: 'Derivar a especialista si es necesario'),
  ],

  "1803": [
    const Actividad(
        idActividad: '1803-001', descripcion: 'Realizar curación periestomal'),
    const Actividad(
        idActividad: '1803-002', descripcion: 'Enseñar manejo de dispositivos'),
    const Actividad(
        idActividad: '1803-003',
        descripcion: 'Monitorizar adaptación psicológica'),
    const Actividad(
        idActividad: '1803-004',
        descripcion: 'Recomendar dieta según tolerancia'),
  ],

  "0600": [
    const Actividad(
        idActividad: '0600-001',
        descripcion: 'Mantener sistema de drenaje estéril'),
    const Actividad(
        idActividad: '0600-002', descripcion: 'Irrigar sonda según indicación'),
    const Actividad(
        idActividad: '0600-003', descripcion: 'Cambiar sonda periódicamente'),
    const Actividad(
        idActividad: '0600-004', descripcion: 'Evaluar signos de infección'),
  ],

  "1200": [
    const Actividad(
        idActividad: '1200-001',
        descripcion: 'Controlar dolor pélvico crónico'),
    const Actividad(
        idActividad: '1200-002',
        descripcion: 'Administrar terapia hormonal si está indicado'),
    const Actividad(
        idActividad: '1200-003',
        descripcion: 'Derivar a ginecología especializada'),
    const Actividad(
        idActividad: '1200-004', descripcion: 'Brindar apoyo psicológico'),
  ],

  "2085": [
    const Actividad(
        idActividad: '2085-001',
        descripcion: 'Administrar antibioterapia específica'),
    const Actividad(
        idActividad: '2085-002',
        descripcion: 'Monitorizar respuesta al tratamiento'),
    const Actividad(
        idActividad: '2085-003',
        descripcion: 'Controlar fiebre y leucocitosis'),
    const Actividad(
        idActividad: '2085-004', descripcion: 'Evaluar necesidad de drenaje'),
  ],

  "1205": [
    const Actividad(
        idActividad: '1205-001', descripcion: 'Identificar causa del dolor'),
    const Actividad(
        idActividad: '1205-002',
        descripcion: 'Administrar lubricantes/analgésicos tópicos'),
    const Actividad(
        idActividad: '1205-003',
        descripcion: 'Derivar a terapia sexual si es necesario'),
    const Actividad(
        idActividad: '1205-004',
        descripcion: 'Brindar educación sobre técnicas alternativas'),
  ],

  "2100": [
    const Actividad(
        idActividad: '2100-001',
        descripcion: 'Monitorizar respuesta a tratamiento oncológico'),
    const Actividad(
        idActividad: '2100-002',
        descripcion: 'Controlar efectos secundarios de quimioterapia'),
    const Actividad(
        idActividad: '2100-003',
        descripcion: 'Realizar educación sobre autoexamen'),
    const Actividad(
        idActividad: '2100-004', descripcion: 'Brindar soporte emocional'),
  ],

  "0585": [
    const Actividad(
        idActividad: '0585-001',
        descripcion: 'Monitorizar síntomas obstructivos'),
    const Actividad(
        idActividad: '0585-002',
        descripcion: 'Administrar alfabloqueadores si está indicado'),
    const Actividad(
        idActividad: '0585-003',
        descripcion: 'Evaluar necesidad de cateterismo intermitente'),
    const Actividad(
        idActividad: '0585-004',
        descripcion: 'Preparar para intervención quirúrgica si es necesario'),
  ],

  "0455": [
    const Actividad(
        idActividad: '0455-001', descripcion: 'Evaluar hábitos intestinales'),
    const Actividad(
        idActividad: '0455-002', descripcion: 'Recomendar dieta rica en fibra'),
    const Actividad(
        idActividad: '0455-003',
        descripcion: 'Enseñar uso adecuado de laxantes'),
    const Actividad(
        idActividad: '0455-004',
        descripcion: 'Fomentar actividad física regular'),
  ],

  "1877": [
    const Actividad(
        idActividad: '1877-001',
        descripcion: 'Obtener urocultivo antes de iniciar antibióticos'),
    const Actividad(
        idActividad: '1877-002',
        descripcion: 'Administrar antibioterapia según antibiograma'),
    const Actividad(
        idActividad: '1877-003',
        descripcion: 'Fomentar ingesta hídrica abundante'),
    const Actividad(
        idActividad: '1877-004',
        descripcion: 'Educar sobre medidas preventivas'),
  ],

  "0740": [
    const Actividad(
        idActividad: '0740-001',
        descripcion: 'Clasificar úlceras según estadio'),
    const Actividad(
        idActividad: '0740-002',
        descripcion: 'Realizar curaciones con apósitos adecuados'),
    const Actividad(
        idActividad: '0740-003', descripcion: 'Mantener área limpia y seca'),
    const Actividad(
        idActividad: '0740-004',
        descripcion: 'Implementar medidas de alivio de presión'),
  ],

  "1805": [
    const Actividad(
        idActividad: '1805-001',
        descripcion: 'Aplicar compresas tibias para promover drenaje'),
    const Actividad(
        idActividad: '1805-002',
        descripcion: 'Administrar antibioterapia si está indicado'),
    const Actividad(
        idActividad: '1805-003',
        descripcion: 'Preparar para incisión y drenaje si es necesario'),
    const Actividad(
        idActividad: '1805-004',
        descripcion: 'Enseñar higiene perianal adecuada'),
  ],
};

final Map<String, List<Resultado>> resultadosDeIntervencion = {
  // REGIÓN CEFÁLICA (CABEZA Y CUELLO)
  "3160": [
    // Manejo de la Vía Aérea Artificial
    const Resultado(
        idResultado: 'NOC-0415',
        idNOC: 'NOC-0415',
        nombre: 'Permeabilidad de las vías aéreas'),
    const Resultado(
        idResultado: 'NOC-0417',
        idNOC: 'NOC-0417',
        nombre: 'Limpieza de las vías respiratorias'),
    const Resultado(
        idResultado: 'NOC-0403',
        idNOC: 'NOC-0403',
        nombre: 'Ventilación espontánea'),
  ],

  "2620": [
    // Monitorización Neurológica
    const Resultado(
        idResultado: 'NOC-0902',
        idNOC: 'NOC-0902',
        nombre: 'Estado neurológico'),
    const Resultado(
        idResultado: 'NOC-0903',
        idNOC: 'NOC-0903',
        nombre: 'Función cognitiva'),
    const Resultado(
        idResultado: 'NOC-0905', idNOC: 'NOC-0905', nombre: 'Función motora'),
  ],

  "2940": [
    // Control de la Presión Intracraneana
    const Resultado(
        idResultado: 'NOC-0902',
        idNOC: 'NOC-0902',
        nombre: 'Estado neurológico'),
    const Resultado(
        idResultado: 'NOC-0805',
        idNOC: 'NOC-0805',
        nombre: 'Control de la temperatura'),
    const Resultado(
        idResultado: 'NOC-0412',
        idNOC: 'NOC-0412',
        nombre: 'Estado de los signos vitales'),
  ],

  "3180": [
    // Cuidados de la Cánula de Traqueostomía
    const Resultado(
        idResultado: 'NOC-0415',
        idNOC: 'NOC-0415',
        nombre: 'Permeabilidad de las vías aéreas'),
    const Resultado(
        idResultado: 'NOC-1903',
        idNOC: 'NOC-1903',
        nombre: 'Cicatrización de heridas'),
    const Resultado(
        idResultado: 'NOC-1834',
        idNOC: 'NOC-1834',
        nombre: 'Prevención de infecciones'),
  ],

  "3320": [
    // Administración de Oxígeno
    const Resultado(
        idResultado: 'NOC-0404',
        idNOC: 'NOC-0404',
        nombre: 'Oxigenación tisular'),
    const Resultado(
        idResultado: 'NOC-0414',
        idNOC: 'NOC-0414',
        nombre: 'Intercambio gaseoso'),
    const Resultado(
        idResultado: 'NOC-0405',
        idNOC: 'NOC-0405',
        nombre: 'Estado respiratorio'),
  ],

  "2390": [
    // Control de la Sedación y Analgesia
    const Resultado(
        idResultado: 'NOC-143', idNOC: 'NOC-143', nombre: 'Control del dolor'),
    const Resultado(
        idResultado: 'NOC-210', idNOC: 'NOC-210', nombre: 'Nivel de malestar'),
    const Resultado(
        idResultado: 'NOC-2107',
        idNOC: 'NOC-2107',
        nombre: 'Control de los efectos de la medicación'),
  ],

  "4040": [
    // Monitorización de la Presión Arterial
    const Resultado(
        idResultado: 'NOC-0412',
        idNOC: 'NOC-0412',
        nombre: 'Estado de los signos vitales'),
    const Resultado(
        idResultado: 'NOC-1908',
        idNOC: 'NOC-1908',
        nombre: 'Estabilidad hemodinámica'),
    const Resultado(
        idResultado: 'NOC-0402',
        idNOC: 'NOC-0402',
        nombre: 'Estado circulatorio'),
  ],

  "1660": [
    // Cuidados de los Ojos en Pacientes Críticos
    const Resultado(
        idResultado: 'NOC-1902',
        idNOC: 'NOC-1902',
        nombre: 'Integridad tisular: piel'),
    const Resultado(
        idResultado: 'NOC-1103',
        idNOC: 'NOC-1103',
        nombre: 'Riesgo de úlceras por presión'),
    const Resultado(
        idResultado: 'NOC-1834',
        idNOC: 'NOC-1834',
        nombre: 'Prevención de infecciones'),
  ],

  "1400": [
    // Manejo del Dolor Neurológico y Cefalea
    const Resultado(
        idResultado: 'NOC-143', idNOC: 'NOC-143', nombre: 'Control del dolor'),
    const Resultado(
        idResultado: 'NOC-210', idNOC: 'NOC-210', nombre: 'Nivel de malestar'),
    const Resultado(
        idResultado: 'NOC-1210',
        idNOC: 'NOC-1210',
        nombre: 'Reducción de la ansiedad'),
  ],

  "2445": [
    // Mantenimiento del Acceso Venoso Central
    const Resultado(
        idResultado: 'NOC-2304',
        idNOC: 'NOC-2304',
        nombre: 'Manejo de infusión intravenosa'),
    const Resultado(
        idResultado: 'NOC-1834',
        idNOC: 'NOC-1834',
        nombre: 'Prevención de infecciones'),
    const Resultado(
        idResultado: 'NOC-1903',
        idNOC: 'NOC-1903',
        nombre: 'Cicatrización de heridas'),
  ],

  "4120": [
    // Monitorización de la Perfusión Cerebral
    const Resultado(
        idResultado: 'NOC-0902',
        idNOC: 'NOC-0902',
        nombre: 'Estado neurológico'),
    const Resultado(
        idResultado: 'NOC-0404',
        idNOC: 'NOC-0404',
        nombre: 'Oxigenación tisular'),
    const Resultado(
        idResultado: 'NOC-1908',
        idNOC: 'NOC-1908',
        nombre: 'Estabilidad hemodinámica'),
  ],

  "3900": [
    // Control de la Hipotermia/Hipertermia
    const Resultado(
        idResultado: 'NOC-0805',
        idNOC: 'NOC-0805',
        nombre: 'Control de la temperatura'),
    const Resultado(
        idResultado: 'NOC-0806',
        idNOC: 'NOC-0806',
        nombre: 'Temperatura corporal'),
    const Resultado(
        idResultado: 'NOC-0412',
        idNOC: 'NOC-0412',
        nombre: 'Estado de los signos vitales'),
  ],

  "3540": [
    // Protección de la Piel
    const Resultado(
        idResultado: 'NOC-1902',
        idNOC: 'NOC-1902',
        nombre: 'Integridad tisular: piel'),
    const Resultado(
        idResultado: 'NOC-1103',
        idNOC: 'NOC-1103',
        nombre: 'Riesgo de úlceras por presión'),
    const Resultado(
        idResultado: 'NOC-1834',
        idNOC: 'NOC-1834',
        nombre: 'Prevención de infecciones'),
  ],

  "3165": [
    // Aspiración de Secreciones
    const Resultado(
        idResultado: 'NOC-0415',
        idNOC: 'NOC-0415',
        nombre: 'Permeabilidad de las vías aéreas'),
    const Resultado(
        idResultado: 'NOC-0417',
        idNOC: 'NOC-0417',
        nombre: 'Limpieza de las vías respiratorias'),
    const Resultado(
        idResultado: 'NOC-0405',
        idNOC: 'NOC-0405',
        nombre: 'Estado respiratorio'),
  ],

  "3200": [
    // Prevención del Broncoaspirado
    const Resultado(
        idResultado: 'NOC-0415',
        idNOC: 'NOC-0415',
        nombre: 'Permeabilidad de las vías aéreas'),
    const Resultado(
        idResultado: 'NOC-1834',
        idNOC: 'NOC-1834',
        nombre: 'Prevención de infecciones'),
    const Resultado(
        idResultado: 'NOC-0703',
        idNOC: 'NOC-0703',
        nombre: 'Estado de infección'),
  ],

  "2625": [
    // Evaluación del Reflejo Pupilar
    const Resultado(
        idResultado: 'NOC-0902',
        idNOC: 'NOC-0902',
        nombre: 'Estado neurológico'),
    const Resultado(
        idResultado: 'NOC-0903',
        idNOC: 'NOC-0903',
        nombre: 'Función cognitiva'),
    const Resultado(
        idResultado: 'NOC-0905', idNOC: 'NOC-0905', nombre: 'Función motora'),
  ],

  "1710": [
    // Higiene Bucal en Pacientes Intubados
    const Resultado(
        idResultado: 'NOC-1902',
        idNOC: 'NOC-1902',
        nombre: 'Integridad tisular: piel'),
    const Resultado(
        idResultado: 'NOC-1834',
        idNOC: 'NOC-1834',
        nombre: 'Prevención de infecciones'),
    const Resultado(
        idResultado: 'NOC-0703',
        idNOC: 'NOC-0703',
        nombre: 'Estado de infección'),
  ],

  "6400": [
    // Manejo de Crisis Convulsivas
    const Resultado(
        idResultado: 'NOC-0902',
        idNOC: 'NOC-0902',
        nombre: 'Estado neurológico'),
    const Resultado(
        idResultado: 'NOC-0905', idNOC: 'NOC-0905', nombre: 'Función motora'),
    const Resultado(
        idResultado: 'NOC-0415',
        idNOC: 'NOC-0415',
        nombre: 'Permeabilidad de las vías aéreas'),
  ],

  "6440": [
    // Detección y Control de Delirium
    const Resultado(
        idResultado: 'NOC-0903',
        idNOC: 'NOC-0903',
        nombre: 'Función cognitiva'),
    const Resultado(
        idResultado: 'NOC-1210',
        idNOC: 'NOC-1210',
        nombre: 'Reducción de la ansiedad'),
    const Resultado(
        idResultado: 'NOC-1202',
        idNOC: 'NOC-1202',
        nombre: 'Nivel de ansiedad'),
  ],

  "4820": [
    // Prevención del Síndrome de Abstinencia
    const Resultado(
        idResultado: 'NOC-2107',
        idNOC: 'NOC-2107',
        nombre: 'Control de los efectos de la medicación'),
    const Resultado(
        idResultado: 'NOC-2108',
        idNOC: 'NOC-2108',
        nombre: 'Cumplimiento de la terapia farmacológica'),
    const Resultado(
        idResultado: 'NOC-1210',
        idNOC: 'NOC-1210',
        nombre: 'Reducción de la ansiedad'),
  ],

  // REGIÓN TORÁCICA
  "4220": [
    // Monitorización Cardiovascular
    const Resultado(
        idResultado: 'NOC-0402',
        idNOC: 'NOC-0402',
        nombre: 'Estado circulatorio'),
    const Resultado(
        idResultado: 'NOC-1908',
        idNOC: 'NOC-1908',
        nombre: 'Estabilidad hemodinámica'),
    const Resultado(
        idResultado: 'NOC-0412',
        idNOC: 'NOC-0412',
        nombre: 'Estado de los signos vitales'),
  ],

  "4250": [
    // Monitorización de la Hemodinámica Invasiva
    const Resultado(
        idResultado: 'NOC-0402',
        idNOC: 'NOC-0402',
        nombre: 'Estado circulatorio'),
    const Resultado(
        idResultado: 'NOC-1908',
        idNOC: 'NOC-1908',
        nombre: 'Estabilidad hemodinámica'),
    const Resultado(
        idResultado: 'NOC-0410',
        idNOC: 'NOC-0410',
        nombre: 'Equilibrio de líquidos'),
  ],

  "4210": [
    // Administración de Medicación Cardiovascular
    const Resultado(
        idResultado: 'NOC-0402',
        idNOC: 'NOC-0402',
        nombre: 'Estado circulatorio'),
    const Resultado(
        idResultado: 'NOC-2107',
        idNOC: 'NOC-2107',
        nombre: 'Control de los efectos de la medicación'),
    const Resultado(
        idResultado: 'NOC-2108',
        idNOC: 'NOC-2108',
        nombre: 'Cumplimiento de la terapia farmacológica'),
  ],

  "1410": [
    // Control del Dolor Torácico
    const Resultado(
        idResultado: 'NOC-143', idNOC: 'NOC-143', nombre: 'Control del dolor'),
    const Resultado(
        idResultado: 'NOC-210', idNOC: 'NOC-210', nombre: 'Nivel de malestar'),
    const Resultado(
        idResultado: 'NOC-1210',
        idNOC: 'NOC-1210',
        nombre: 'Reducción de la ansiedad'),
  ],

  "3430": [
    // Manejo del Drenaje Torácico
    const Resultado(
        idResultado: 'NOC-0405',
        idNOC: 'NOC-0405',
        nombre: 'Estado respiratorio'),
    const Resultado(
        idResultado: 'NOC-1903',
        idNOC: 'NOC-1903',
        nombre: 'Cicatrización de heridas'),
    const Resultado(
        idResultado: 'NOC-1834',
        idNOC: 'NOC-1834',
        nombre: 'Prevención de infecciones'),
  ],

  "3350": [
    // Monitorización de la Respuesta Pulmonar
    const Resultado(
        idResultado: 'NOC-0405',
        idNOC: 'NOC-0405',
        nombre: 'Estado respiratorio'),
    const Resultado(
        idResultado: 'NOC-0414',
        idNOC: 'NOC-0414',
        nombre: 'Intercambio gaseoso'),
    const Resultado(
        idResultado: 'NOC-0403',
        idNOC: 'NOC-0403',
        nombre: 'Ventilación espontánea'),
  ],

  "3325": [
    // Monitorización de la Saturación de Oxígeno
    const Resultado(
        idResultado: 'NOC-0404',
        idNOC: 'NOC-0404',
        nombre: 'Oxigenación tisular'),
    const Resultado(
        idResultado: 'NOC-0414',
        idNOC: 'NOC-0414',
        nombre: 'Intercambio gaseoso'),
    const Resultado(
        idResultado: 'NOC-0412',
        idNOC: 'NOC-0412',
        nombre: 'Estado de los signos vitales'),
  ],

  "3250": [
    // Fisioterapia Torácica
    const Resultado(
        idResultado: 'NOC-0405',
        idNOC: 'NOC-0405',
        nombre: 'Estado respiratorio'),
    const Resultado(
        idResultado: 'NOC-0417',
        idNOC: 'NOC-0417',
        nombre: 'Limpieza de las vías respiratorias'),
    const Resultado(
        idResultado: 'NOC-0208', idNOC: 'NOC-0208', nombre: 'Movilidad física'),
  ],

  "1415": [
    // Manejo del Dolor Postoperatorio Torácico
    const Resultado(
        idResultado: 'NOC-143', idNOC: 'NOC-143', nombre: 'Control del dolor'),
    const Resultado(
        idResultado: 'NOC-290',
        idNOC: 'NOC-290',
        nombre: 'Recuperación postoperatoria'),
    const Resultado(
        idResultado: 'NOC-1210',
        idNOC: 'NOC-1210',
        nombre: 'Reducción de la ansiedad'),
  ],

  "3355": [
    // Prevención de la Neumonía Asociada a Ventilador
    const Resultado(
        idResultado: 'NOC-1834',
        idNOC: 'NOC-1834',
        nombre: 'Prevención de infecciones'),
    const Resultado(
        idResultado: 'NOC-0703',
        idNOC: 'NOC-0703',
        nombre: 'Estado de infección'),
    const Resultado(
        idResultado: 'NOC-0415',
        idNOC: 'NOC-0415',
        nombre: 'Permeabilidad de las vías aéreas'),
  ],

  "2900": [
    // Cuidado del Paciente con Cirugía Torácica
    const Resultado(
        idResultado: 'NOC-290',
        idNOC: 'NOC-290',
        nombre: 'Recuperación postoperatoria'),
    const Resultado(
        idResultado: 'NOC-2902',
        idNOC: 'NOC-2902',
        nombre: 'Estado de la herida quirúrgica'),
    const Resultado(
        idResultado: 'NOC-0405',
        idNOC: 'NOC-0405',
        nombre: 'Estado respiratorio'),
  ],

  "3322": [
    // Manejo del Paciente con Insuficiencia Respiratoria Aguda
    const Resultado(
        idResultado: 'NOC-0405',
        idNOC: 'NOC-0405',
        nombre: 'Estado respiratorio'),
    const Resultado(
        idResultado: 'NOC-0414',
        idNOC: 'NOC-0414',
        nombre: 'Intercambio gaseoso'),
    const Resultado(
        idResultado: 'NOC-0404',
        idNOC: 'NOC-0404',
        nombre: 'Oxigenación tisular'),
  ],

  "4140": [
    // Monitorización de la Presión Arterial No Invasiva
    const Resultado(
        idResultado: 'NOC-0412',
        idNOC: 'NOC-0412',
        nombre: 'Estado de los signos vitales'),
    const Resultado(
        idResultado: 'NOC-1908',
        idNOC: 'NOC-1908',
        nombre: 'Estabilidad hemodinámica'),
    const Resultado(
        idResultado: 'NOC-0402',
        idNOC: 'NOC-0402',
        nombre: 'Estado circulatorio'),
  ],

  "3326": [
    // Cuidado del Paciente con Edema Pulmonar
    const Resultado(
        idResultado: 'NOC-0405',
        idNOC: 'NOC-0405',
        nombre: 'Estado respiratorio'),
    const Resultado(
        idResultado: 'NOC-0410',
        idNOC: 'NOC-0410',
        nombre: 'Equilibrio de líquidos'),
    const Resultado(
        idResultado: 'NOC-1908',
        idNOC: 'NOC-1908',
        nombre: 'Estabilidad hemodinámica'),
  ],

  "2920": [
    // Prevención de Tromboembolismo Pulmonar
    const Resultado(
        idResultado: 'NOC-0402',
        idNOC: 'NOC-0402',
        nombre: 'Estado circulatorio'),
    const Resultado(
        idResultado: 'NOC-0208', idNOC: 'NOC-0208', nombre: 'Movilidad física'),
    const Resultado(
        idResultado: 'NOC-1834',
        idNOC: 'NOC-1834',
        nombre: 'Prevención de infecciones'),
  ],

  // REGIÓN ABDOMINAL
  "1050": [
    // Manejo de la Nutrición Enteral
    const Resultado(
        idResultado: 'NOC-1024',
        idNOC: 'NOC-1024',
        nombre: 'Estado nutricional'),
    const Resultado(
        idResultado: 'NOC-0603',
        idNOC: 'NOC-0603',
        nombre: 'Ingesta de nutrientes'),
    const Resultado(
        idResultado: 'NOC-2010',
        idNOC: 'NOC-2010',
        nombre: 'Tolerancia a la alimentación'),
  ],

  "1052": [
    // Manejo de la Nutrición Parenteral
    const Resultado(
        idResultado: 'NOC-1024',
        idNOC: 'NOC-1024',
        nombre: 'Estado nutricional'),
    const Resultado(
        idResultado: 'NOC-0605',
        idNOC: 'NOC-0605',
        nombre: 'Manejo de electrolitos'),
    const Resultado(
        idResultado: 'NOC-2304',
        idNOC: 'NOC-2304',
        nombre: 'Manejo de infusión intravenosa'),
  ],

  "2010": [
    // Monitoreo de la Función Gastrointestinal
    const Resultado(
        idResultado: 'NOC-0501',
        idNOC: 'NOC-0501',
        nombre: 'Función gastrointestinal'),
    const Resultado(
        idResultado: 'NOC-0502',
        idNOC: 'NOC-0502',
        nombre: 'Eliminación intestinal'),
    const Resultado(
        idResultado: 'NOC-1024',
        idNOC: 'NOC-1024',
        nombre: 'Estado nutricional'),
  ],

  "2900-A": [
    // Manejo del Paciente con Cirugía Abdominal
    const Resultado(
        idResultado: 'NOC-290',
        idNOC: 'NOC-290',
        nombre: 'Recuperación postoperatoria'),
    const Resultado(
        idResultado: 'NOC-2902',
        idNOC: 'NOC-2902',
        nombre: 'Estado de la herida quirúrgica'),
    const Resultado(
        idResultado: 'NOC-0501',
        idNOC: 'NOC-0501',
        nombre: 'Función gastrointestinal'),
  ],

  "1802": [
    // Cuidados del Paciente con Ostomía
    const Resultado(
        idResultado: 'NOC-0509',
        idNOC: 'NOC-0509',
        nombre: 'Manejo de la ostomía'),
    const Resultado(
        idResultado: 'NOC-0510',
        idNOC: 'NOC-0510',
        nombre: 'Autocuidado del estoma'),
    const Resultado(
        idResultado: 'NOC-1903',
        idNOC: 'NOC-1903',
        nombre: 'Cicatrización de heridas'),
  ],

  "1415-A": [
    // Manejo del Dolor Abdominal
    const Resultado(
        idResultado: 'NOC-143', idNOC: 'NOC-143', nombre: 'Control del dolor'),
    const Resultado(
        idResultado: 'NOC-210', idNOC: 'NOC-210', nombre: 'Nivel de malestar'),
    const Resultado(
        idResultado: 'NOC-0501',
        idNOC: 'NOC-0501',
        nombre: 'Función gastrointestinal'),
  ],

  "4170": [
    // Prevención de la Hemorragia Digestiva
    const Resultado(
        idResultado: 'NOC-0402',
        idNOC: 'NOC-0402',
        nombre: 'Estado circulatorio'),
    const Resultado(
        idResultado: 'NOC-1908',
        idNOC: 'NOC-1908',
        nombre: 'Estabilidad hemodinámica'),
    const Resultado(
        idResultado: 'NOC-0501',
        idNOC: 'NOC-0501',
        nombre: 'Función gastrointestinal'),
  ],

  "2080": [
    // Manejo del Paciente con Insuficiencia Hepática
    const Resultado(
        idResultado: 'NOC-0501',
        idNOC: 'NOC-0501',
        nombre: 'Función gastrointestinal'),
    const Resultado(
        idResultado: 'NOC-0902',
        idNOC: 'NOC-0902',
        nombre: 'Estado neurológico'),
    const Resultado(
        idResultado: 'NOC-0410',
        idNOC: 'NOC-0410',
        nombre: 'Equilibrio de líquidos'),
  ],

  "0460": [
    // Control de la Diarrea
    const Resultado(
        idResultado: 'NOC-0502',
        idNOC: 'NOC-0502',
        nombre: 'Eliminación intestinal'),
    const Resultado(
        idResultado: 'NOC-0410',
        idNOC: 'NOC-0410',
        nombre: 'Equilibrio de líquidos'),
    const Resultado(
        idResultado: 'NOC-1902',
        idNOC: 'NOC-1902',
        nombre: 'Integridad tisular: piel'),
  ],

  "0450": [
    // Control del Estreñimiento
    const Resultado(
        idResultado: 'NOC-0502',
        idNOC: 'NOC-0502',
        nombre: 'Eliminación intestinal'),
    const Resultado(
        idResultado: 'NOC-0208', idNOC: 'NOC-0208', nombre: 'Movilidad física'),
    const Resultado(
        idResultado: 'NOC-1024',
        idNOC: 'NOC-1024',
        nombre: 'Estado nutricional'),
  ],

  "4190": [
    // Manejo del Paciente con Ascitis
    const Resultado(
        idResultado: 'NOC-0410',
        idNOC: 'NOC-0410',
        nombre: 'Equilibrio de líquidos'),
    const Resultado(
        idResultado: 'NOC-0501',
        idNOC: 'NOC-0501',
        nombre: 'Función gastrointestinal'),
    const Resultado(
        idResultado: 'NOC-1908',
        idNOC: 'NOC-1908',
        nombre: 'Estabilidad hemodinámica'),
  ],

  "2030": [
    // Manejo del Paciente con Pancreatitis Aguda
    const Resultado(
        idResultado: 'NOC-143', idNOC: 'NOC-143', nombre: 'Control del dolor'),
    const Resultado(
        idResultado: 'NOC-0501',
        idNOC: 'NOC-0501',
        nombre: 'Función gastrointestinal'),
    const Resultado(
        idResultado: 'NOC-0410',
        idNOC: 'NOC-0410',
        nombre: 'Equilibrio de líquidos'),
  ],

  "1850": [
    // Monitorización del Reflujo Gastroesofágico
    const Resultado(
        idResultado: 'NOC-0501',
        idNOC: 'NOC-0501',
        nombre: 'Función gastrointestinal'),
    const Resultado(
        idResultado: 'NOC-143', idNOC: 'NOC-143', nombre: 'Control del dolor'),
    const Resultado(
        idResultado: 'NOC-1024',
        idNOC: 'NOC-1024',
        nombre: 'Estado nutricional'),
  ],

  "2075": [
    // Manejo de la Hipertensión Portal
    const Resultado(
        idResultado: 'NOC-0501',
        idNOC: 'NOC-0501',
        nombre: 'Función gastrointestinal'),
    const Resultado(
        idResultado: 'NOC-0402',
        idNOC: 'NOC-0402',
        nombre: 'Estado circulatorio'),
    const Resultado(
        idResultado: 'NOC-0410',
        idNOC: 'NOC-0410',
        nombre: 'Equilibrio de líquidos'),
  ],

  "2890": [
    // Manejo del Paciente con Apendicitis
    const Resultado(
        idResultado: 'NOC-143', idNOC: 'NOC-143', nombre: 'Control del dolor'),
    const Resultado(
        idResultado: 'NOC-1834',
        idNOC: 'NOC-1834',
        nombre: 'Prevención de infecciones'),
    const Resultado(
        idResultado: 'NOC-290',
        idNOC: 'NOC-290',
        nombre: 'Recuperación postoperatoria'),
  ],

  "2905": [
    // Cuidado del Paciente con Hernia Abdominal
    const Resultado(
        idResultado: 'NOC-143', idNOC: 'NOC-143', nombre: 'Control del dolor'),
    const Resultado(
        idResultado: 'NOC-290',
        idNOC: 'NOC-290',
        nombre: 'Recuperación postoperatoria'),
    const Resultado(
        idResultado: 'NOC-0501',
        idNOC: 'NOC-0501',
        nombre: 'Función gastrointestinal'),
  ],

  "2050": [
    // Monitorización de la Peritonitis
    const Resultado(
        idResultado: 'NOC-1834',
        idNOC: 'NOC-1834',
        nombre: 'Prevención de infecciones'),
    const Resultado(
        idResultado: 'NOC-0703',
        idNOC: 'NOC-0703',
        nombre: 'Estado de infección'),
    const Resultado(
        idResultado: 'NOC-0501',
        idNOC: 'NOC-0501',
        nombre: 'Función gastrointestinal'),
  ],

  "2008": [
    // Manejo del Paciente con Síndrome de Intestino Corto
    const Resultado(
        idResultado: 'NOC-1024',
        idNOC: 'NOC-1024',
        nombre: 'Estado nutricional'),
    const Resultado(
        idResultado: 'NOC-0501',
        idNOC: 'NOC-0501',
        nombre: 'Función gastrointestinal'),
    const Resultado(
        idResultado: 'NOC-0410',
        idNOC: 'NOC-0410',
        nombre: 'Equilibrio de líquidos'),
  ],

  "2895": [
    // Cuidados del Paciente con Colecistitis
    const Resultado(
        idResultado: 'NOC-143', idNOC: 'NOC-143', nombre: 'Control del dolor'),
    const Resultado(
        idResultado: 'NOC-0501',
        idNOC: 'NOC-0501',
        nombre: 'Función gastrointestinal'),
    const Resultado(
        idResultado: 'NOC-290',
        idNOC: 'NOC-290',
        nombre: 'Recuperación postoperatoria'),
  ],

  "4175": [
    // Manejo del Paciente con Síndrome Compartimental Abdominal
    const Resultado(
        idResultado: 'NOC-0501',
        idNOC: 'NOC-0501',
        nombre: 'Función gastrointestinal'),
    const Resultado(
        idResultado: 'NOC-0410',
        idNOC: 'NOC-0410',
        nombre: 'Equilibrio de líquidos'),
    const Resultado(
        idResultado: 'NOC-1908',
        idNOC: 'NOC-1908',
        nombre: 'Estabilidad hemodinámica'),
  ],

  // REGIÓN PÉLVICA Y PERIANAL
  "0590": [
    // Manejo de la Eliminación Urinaria
    const Resultado(
        idResultado: 'NOC-0505',
        idNOC: 'NOC-0505',
        nombre: 'Control de la eliminación urinaria'),
    const Resultado(
        idResultado: 'NOC-0507',
        idNOC: 'NOC-0507',
        nombre: 'Continencia urinaria'),
    const Resultado(
        idResultado: 'NOC-0410',
        idNOC: 'NOC-0410',
        nombre: 'Equilibrio de líquidos'),
  ],

  "1876": [
    // Cuidados del Paciente con Sonda Vesical
    const Resultado(
        idResultado: 'NOC-0505',
        idNOC: 'NOC-0505',
        nombre: 'Control de la eliminación urinaria'),
    const Resultado(
        idResultado: 'NOC-1834',
        idNOC: 'NOC-1834',
        nombre: 'Prevención de infecciones'),
    const Resultado(
        idResultado: 'NOC-0703',
        idNOC: 'NOC-0703',
        nombre: 'Estado de infección'),
  ],

  "0595": [
    // Monitorización de la Retención Urinaria
    const Resultado(
        idResultado: 'NOC-0505',
        idNOC: 'NOC-0505',
        nombre: 'Control de la eliminación urinaria'),
    const Resultado(
        idResultado: 'NOC-0506',
        idNOC: 'NOC-0506',
        nombre: 'Eliminación urinaria'),
    const Resultado(
        idResultado: 'NOC-0410',
        idNOC: 'NOC-0410',
        nombre: 'Equilibrio de líquidos'),
  ],

  "0591": [
    // Manejo del Paciente con Incontinencia Urinaria
    const Resultado(
        idResultado: 'NOC-0507',
        idNOC: 'NOC-0507',
        nombre: 'Continencia urinaria'),
    const Resultado(
        idResultado: 'NOC-1902',
        idNOC: 'NOC-1902',
        nombre: 'Integridad tisular: piel'),
    const Resultado(
        idResultado: 'NOC-1805',
        idNOC: 'NOC-1805',
        nombre: 'Conocimiento sobre el autocuidado'),
  ],

  "1845": [
    // Cuidados del Paciente con Fístula Perianal
    const Resultado(
        idResultado: 'NOC-1902',
        idNOC: 'NOC-1902',
        nombre: 'Integridad tisular: piel'),
    const Resultado(
        idResultado: 'NOC-1903',
        idNOC: 'NOC-1903',
        nombre: 'Cicatrización de heridas'),
    const Resultado(
        idResultado: 'NOC-1834',
        idNOC: 'NOC-1834',
        nombre: 'Prevención de infecciones'),
  ],

  "0610": [
    // Manejo del Paciente con Prolapso Rectal
    const Resultado(
        idResultado: 'NOC-0502',
        idNOC: 'NOC-0502',
        nombre: 'Eliminación intestinal'),
    const Resultado(
        idResultado: 'NOC-1902',
        idNOC: 'NOC-1902',
        nombre: 'Integridad tisular: piel'),
    const Resultado(
        idResultado: 'NOC-143', idNOC: 'NOC-143', nombre: 'Control del dolor'),
  ],

  "1804": [
    // Cuidados del Paciente con Hemorroides
    const Resultado(
        idResultado: 'NOC-143', idNOC: 'NOC-143', nombre: 'Control del dolor'),
    const Resultado(
        idResultado: 'NOC-1902',
        idNOC: 'NOC-1902',
        nombre: 'Integridad tisular: piel'),
    const Resultado(
        idResultado: 'NOC-0502',
        idNOC: 'NOC-0502',
        nombre: 'Eliminación intestinal'),
  ],

  "1416": [
    // Manejo del Dolor Pélvico
    const Resultado(
        idResultado: 'NOC-143', idNOC: 'NOC-143', nombre: 'Control del dolor'),
    const Resultado(
        idResultado: 'NOC-210', idNOC: 'NOC-210', nombre: 'Nivel de malestar'),
    const Resultado(
        idResultado: 'NOC-1210',
        idNOC: 'NOC-1210',
        nombre: 'Reducción de la ansiedad'),
  ],

  "1803": [
    // Cuidados del Paciente con Colostomía
    const Resultado(
        idResultado: 'NOC-0509',
        idNOC: 'NOC-0509',
        nombre: 'Manejo de la ostomía'),
    const Resultado(
        idResultado: 'NOC-0510',
        idNOC: 'NOC-0510',
        nombre: 'Autocuidado del estoma'),
    const Resultado(
        idResultado: 'NOC-1903',
        idNOC: 'NOC-1903',
        nombre: 'Cicatrización de heridas'),
  ],

  "0600": [
    // Manejo del Paciente con Cistostomía
    const Resultado(
        idResultado: 'NOC-0505',
        idNOC: 'NOC-0505',
        nombre: 'Control de la eliminación urinaria'),
    const Resultado(
        idResultado: 'NOC-1834',
        idNOC: 'NOC-1834',
        nombre: 'Prevención de infecciones'),
    const Resultado(
        idResultado: 'NOC-1903',
        idNOC: 'NOC-1903',
        nombre: 'Cicatrización de heridas'),
  ],

  "1200": [
    // Manejo del Paciente con Endometriosis
    const Resultado(
        idResultado: 'NOC-143', idNOC: 'NOC-143', nombre: 'Control del dolor'),
    const Resultado(
        idResultado: 'NOC-1210',
        idNOC: 'NOC-1210',
        nombre: 'Reducción de la ansiedad'),
    const Resultado(
        idResultado: 'NOC-1803',
        idNOC: 'NOC-1803',
        nombre: 'Conocimiento sobre la enfermedad'),
  ],

  "2085": [
    // Cuidados del Paciente con Infección Pélvica
    const Resultado(
        idResultado: 'NOC-1834',
        idNOC: 'NOC-1834',
        nombre: 'Prevención de infecciones'),
    const Resultado(
        idResultado: 'NOC-0703',
        idNOC: 'NOC-0703',
        nombre: 'Estado de infección'),
    const Resultado(
        idResultado: 'NOC-143', idNOC: 'NOC-143', nombre: 'Control del dolor'),
  ],

  "1205": [
    // Manejo del Paciente con Dispareunia
    const Resultado(
        idResultado: 'NOC-143', idNOC: 'NOC-143', nombre: 'Control del dolor'),
    const Resultado(
        idResultado: 'NOC-1210',
        idNOC: 'NOC-1210',
        nombre: 'Reducción de la ansiedad'),
    const Resultado(
        idResultado: 'NOC-1805',
        idNOC: 'NOC-1805',
        nombre: 'Conocimiento sobre el autocuidado'),
  ],

  "2100": [
    // Monitorización del Paciente con Cáncer Ginecológico
    const Resultado(
        idResultado: 'NOC-1803',
        idNOC: 'NOC-1803',
        nombre: 'Conocimiento sobre la enfermedad'),
    const Resultado(
        idResultado: 'NOC-1210',
        idNOC: 'NOC-1210',
        nombre: 'Reducción de la ansiedad'),
    const Resultado(
        idResultado: 'NOC-143', idNOC: 'NOC-143', nombre: 'Control del dolor'),
  ],

  "0585": [
    // Manejo del Paciente con Hipertrofia Prostática
    const Resultado(
        idResultado: 'NOC-0505',
        idNOC: 'NOC-0505',
        nombre: 'Control de la eliminación urinaria'),
    const Resultado(
        idResultado: 'NOC-0506',
        idNOC: 'NOC-0506',
        nombre: 'Eliminación urinaria'),
    const Resultado(
        idResultado: 'NOC-1803',
        idNOC: 'NOC-1803',
        nombre: 'Conocimiento sobre la enfermedad'),
  ],

  "0455": [
    // Manejo del Paciente con Estreñimiento Crónico
    const Resultado(
        idResultado: 'NOC-0502',
        idNOC: 'NOC-0502',
        nombre: 'Eliminación intestinal'),
    const Resultado(
        idResultado: 'NOC-1805',
        idNOC: 'NOC-1805',
        nombre: 'Conocimiento sobre el autocuidado'),
    const Resultado(
        idResultado: 'NOC-1024',
        idNOC: 'NOC-1024',
        nombre: 'Estado nutricional'),
  ],

  "1877": [
    // Cuidados del Paciente con Infección Urinaria
    const Resultado(
        idResultado: 'NOC-0703',
        idNOC: 'NOC-0703',
        nombre: 'Estado de infección'),
    const Resultado(
        idResultado: 'NOC-0505',
        idNOC: 'NOC-0505',
        nombre: 'Control de la eliminación urinaria'),
    const Resultado(
        idResultado: 'NOC-1834',
        idNOC: 'NOC-1834',
        nombre: 'Prevención de infecciones'),
  ],

  "0740": [
    // Manejo del Paciente con Úlceras por Presión Perineales
    const Resultado(
        idResultado: 'NOC-1902',
        idNOC: 'NOC-1902',
        nombre: 'Integridad tisular: piel'),
    const Resultado(
        idResultado: 'NOC-1903',
        idNOC: 'NOC-1903',
        nombre: 'Cicatrización de heridas'),
    const Resultado(
        idResultado: 'NOC-1834',
        idNOC: 'NOC-1834',
        nombre: 'Prevención de infecciones'),
  ],

  "1805": [
    // Cuidados del Paciente con Absceso Perianal
    const Resultado(
        idResultado: 'NOC-1903',
        idNOC: 'NOC-1903',
        nombre: 'Cicatrización de heridas'),
    const Resultado(
        idResultado: 'NOC-1834',
        idNOC: 'NOC-1834',
        nombre: 'Prevención de infecciones'),
    const Resultado(
        idResultado: 'NOC-143', idNOC: 'NOC-143', nombre: 'Control del dolor'),
  ],
};

final Map<String, List<Indicador>> indicadoresDeResultados = {
  // Control del dolor y malestar
  'NOC-143': [
    const Indicador(
        idIndicador: '001',
        descripcion:
            'Nivel de confort reportado por el paciente (escala 0-10)'),
    const Indicador(
        idIndicador: '002',
        descripcion: 'Intensidad del dolor medida con escala EVA o similar'),
    const Indicador(
        idIndicador: '003',
        descripcion: 'Duración de los episodios dolorosos (minutos/horas)'),
    const Indicador(
        idIndicador: '004', descripcion: 'Frecuencia de analgesia requerida'),
    const Indicador(
        idIndicador: '005',
        descripcion:
            'Expresión facial y lenguaje corporal indicativo de dolor'),
  ],

  'NOC-210': [
    const Indicador(
        idIndicador: '001',
        descripcion: 'Frecuencia de episodios de malestar (veces/día)'),
    const Indicador(
        idIndicador: '002',
        descripcion: 'Severidad del malestar reportado por el paciente'),
    const Indicador(
        idIndicador: '003',
        descripcion: 'Impacto del malestar en actividades diarias'),
    const Indicador(
        idIndicador: '004',
        descripcion: 'Necesidad de intervenciones para alivio'),
  ],

  // Recuperación postoperatoria y heridas
  'NOC-290': [
    const Indicador(
        idIndicador: '001',
        descripcion: 'Tiempo de recuperación funcional (días)'),
    const Indicador(
        idIndicador: '002',
        descripcion: 'Presencia/Ausencia de complicaciones postoperatorias'),
    const Indicador(
        idIndicador: '003', descripcion: 'Nivel de movilidad alcanzado'),
    const Indicador(
        idIndicador: '004',
        descripcion: 'Reincorporación a actividades normales'),
  ],

  'NOC-2902': [
    const Indicador(
        idIndicador: '001',
        descripcion: 'Estado de cicatrización (escala de Bates-Jensen)'),
    const Indicador(
        idIndicador: '002',
        descripcion:
            'Presencia de signos de infección (enrojecimiento, edema, secreción)'),
    const Indicador(
        idIndicador: '003',
        descripcion: 'Integridad de los bordes de la herida'),
    const Indicador(
        idIndicador: '004',
        descripcion: 'Tiempo de cierre completo de la herida'),
  ],

  // Integridad tisular y piel
  'NOC-1902': [
    const Indicador(
        idIndicador: '001',
        descripcion: 'Estado de la piel (escala Braden modificada)'),
    const Indicador(
        idIndicador: '002',
        descripcion:
            'Presencia de lesiones cutáneas (número, tamaño, estadio)'),
    const Indicador(
        idIndicador: '003', descripcion: 'Hidratación y turgencia cutánea'),
    const Indicador(
        idIndicador: '004', descripcion: 'Temperatura y coloración de la piel'),
  ],

  'NOC-1103': [
    const Indicador(
        idIndicador: '001',
        descripcion:
            'Puntaje en escala de riesgo de úlceras por presión (Braden/Norton)'),
    const Indicador(
        idIndicador: '002',
        descripcion: 'Número de medidas preventivas implementadas'),
    const Indicador(
        idIndicador: '003',
        descripcion: 'Frecuencia de cambios posturales realizados'),
    const Indicador(
        idIndicador: '004',
        descripcion: 'Ausencia de nuevas lesiones dérmicas'),
  ],

  // Prevención y control de infecciones
  'NOC-1834': [
    const Indicador(
        idIndicador: '001',
        descripcion: 'Número de infecciones nosocomiales evitadas'),
    const Indicador(
        idIndicador: '002',
        descripcion: 'Cumplimiento de protocolos de higiene y aislamiento'),
    const Indicador(
        idIndicador: '003',
        descripcion: 'Uso adecuado de barreras protectoras'),
    const Indicador(
        idIndicador: '004',
        descripcion: 'Tasa de adherencia a técnicas asépticas'),
  ],

  'NOC-0703': [
    const Indicador(
        idIndicador: '001',
        descripcion: 'Presencia de signos sistémicos/locales de infección'),
    const Indicador(
        idIndicador: '002',
        descripcion: 'Resultados de cultivos microbiológicos'),
    const Indicador(
        idIndicador: '003',
        descripcion: 'Respuesta a terapia antimicrobiana (días hasta mejoría)'),
    const Indicador(
        idIndicador: '004',
        descripcion: 'Marcadores inflamatorios (PCR, leucocitos)'),
  ],

  // Estado respiratorio
  'NOC-0405': [
    const Indicador(
        idIndicador: '001', descripcion: 'Frecuencia respiratoria (resp/min)'),
    const Indicador(
        idIndicador: '002', descripcion: 'Saturación de oxígeno (SpO2%)'),
    const Indicador(
        idIndicador: '003',
        descripcion: 'Patrón respiratorio y uso de músculos accesorios'),
    const Indicador(
        idIndicador: '004',
        descripcion: 'Resultados de gases arteriales (PaO2, PaCO2)'),
    const Indicador(
        idIndicador: '005', descripcion: 'Tolerancia al ejercicio/disnea'),
  ],

  'NOC-0403': [
    const Indicador(
        idIndicador: '001',
        descripcion: 'Tiempo en ventilación espontánea (horas/día)'),
    const Indicador(
        idIndicador: '002',
        descripcion: 'Saturación de oxígeno durante respiración espontánea'),
    const Indicador(
        idIndicador: '003',
        descripcion: 'Frecuencia respiratoria durante respiración espontánea'),
    const Indicador(
        idIndicador: '004',
        descripcion: 'Nivel de fatiga durante ventilación espontánea'),
  ],

  // Balance hídrico y electrolitos
  'NOC-0410': [
    const Indicador(
        idIndicador: '001',
        descripcion: 'Balance hídrico (ingreso/egreso en ml/24h)'),
    const Indicador(
        idIndicador: '002',
        descripcion: 'Signos clínicos de deshidratación/sobrecarga'),
    const Indicador(
        idIndicador: '003', descripcion: 'Peso corporal diario (variaciones)'),
    const Indicador(
        idIndicador: '004', descripcion: 'Turgencia de piel y mucosas'),
    const Indicador(idIndicador: '005', descripcion: 'Nivel de sed'),
  ],

  'NOC-0605': [
    const Indicador(
        idIndicador: '001',
        descripcion: 'Niveles séricos de electrolitos (Na+, K+, Cl-)'),
    const Indicador(
        idIndicador: '002',
        descripcion: 'Presencia de síntomas por desequilibrio electrolítico'),
    const Indicador(
        idIndicador: '003',
        descripcion: 'Estabilidad en ECG (arritmias relacionadas)'),
    const Indicador(
        idIndicador: '004',
        descripcion: 'Necesidad de suplementación electrolítica'),
  ],

  // Estado nutricional
  'NOC-1024': [
    const Indicador(
        idIndicador: '001', descripcion: 'Índice de masa corporal (kg/m2)'),
    const Indicador(
        idIndicador: '002', descripcion: 'Circunferencia muscular del brazo'),
    const Indicador(
        idIndicador: '003',
        descripcion: 'Niveles de albúmina y prealbúmina sérica'),
    const Indicador(
        idIndicador: '004', descripcion: 'Fuerza muscular evaluada'),
    const Indicador(
        idIndicador: '005', descripcion: 'Estado general y energía reportada'),
  ],

  'NOC-0603': [
    const Indicador(
        idIndicador: '001',
        descripcion: 'Porcentaje de requerimientos nutricionales cubiertos'),
    const Indicador(
        idIndicador: '002',
        descripcion: 'Variedad de grupos alimenticios consumidos'),
    const Indicador(
        idIndicador: '003',
        descripcion: 'Tolerancia a la alimentación (náuseas, vómitos)'),
    const Indicador(
        idIndicador: '004', descripcion: 'Apetito y consumo reportado'),
  ],

  // Manejo intravenoso
  'NOC-2304': [
    const Indicador(
        idIndicador: '001',
        descripcion: 'Precisión en tasas de infusión programadas'),
    const Indicador(
        idIndicador: '002',
        descripcion:
            'Número de complicaciones relacionadas (flebitis, extravasación)'),
    const Indicador(
        idIndicador: '003', descripcion: 'Estado del sitio de inserción IV'),
    const Indicador(
        idIndicador: '004',
        descripcion: 'Cumplimiento de protocolos de cambio de sistemas'),
  ],

  'NOC-2303': [
    const Indicador(
        idIndicador: '001',
        descripcion: 'Tasa de infecciones relacionadas a catéteres'),
    const Indicador(
        idIndicador: '002',
        descripcion:
            'Efectividad de la terapia medida por parámetros objetivos'),
    const Indicador(
        idIndicador: '003',
        descripcion: 'Tiempo de permanencia del acceso IV sin complicaciones'),
    const Indicador(
        idIndicador: '004',
        descripcion: 'Número de intentos fallidos de acceso IV'),
  ],

  // Movilidad física
  'NOC-0208': [
    const Indicador(
        idIndicador: '001',
        descripcion: 'Rango de movimiento articular (escala 0-5)'),
    const Indicador(
        idIndicador: '002',
        descripcion: 'Nivel de independencia en movimientos (escala FIM)'),
    const Indicador(
        idIndicador: '003', descripcion: 'Fuerza muscular (escala 0-5)'),
    const Indicador(
        idIndicador: '004',
        descripcion: 'Tolerancia al ejercicio (minutos de actividad)'),
  ],

  'NOC-0205': [
    const Indicador(
        idIndicador: '001',
        descripcion: 'Distancia caminada sin asistencia (metros)'),
    const Indicador(
        idIndicador: '002',
        descripcion: 'Necesidad de dispositivos de asistencia'),
    const Indicador(
        idIndicador: '003', descripcion: 'Velocidad al caminar (m/seg)'),
    const Indicador(
        idIndicador: '004',
        descripcion: 'Equilibrio y coordinación al deambular'),
  ],

  // Signos vitales y hemodinámica
  'NOC-0412': [
    const Indicador(
        idIndicador: '001',
        descripcion: 'Estabilidad de signos vitales (FC, FR, TA, Temp)'),
    const Indicador(
        idIndicador: '002',
        descripcion: 'Porcentaje de mediciones dentro de rangos normales'),
    const Indicador(
        idIndicador: '003', descripcion: 'Variabilidad entre mediciones'),
    const Indicador(
        idIndicador: '004', descripcion: 'Respuesta a cambios posturales'),
  ],

  'NOC-1908': [
    const Indicador(
        idIndicador: '001', descripcion: 'Presión arterial media (PAM)'),
    const Indicador(
        idIndicador: '002', descripcion: 'Índice de shock (FC/PAS)'),
    const Indicador(
        idIndicador: '003',
        descripcion: 'Perfusión periférica (relleno capilar, extremidades)'),
    const Indicador(
        idIndicador: '004', descripcion: 'Gasto urinario horario (ml/kg/h)'),
  ],

  // Oxigenación e intercambio gaseoso
  'NOC-0404': [
    const Indicador(
        idIndicador: '001',
        descripcion: 'Saturación de oxígeno (SpO2%) en diferentes FiO2'),
    const Indicador(
        idIndicador: '002', descripcion: 'Presión arterial de oxígeno (PaO2)'),
    const Indicador(
        idIndicador: '003',
        descripcion: 'Diferencia alveolo-arterial de O2 (A-a)'),
    const Indicador(
        idIndicador: '004', descripcion: 'Signos clínicos de hipoxia'),
  ],

  'NOC-0414': [
    const Indicador(idIndicador: '001', descripcion: 'Relación PaO2/FiO2'),
    const Indicador(
        idIndicador: '002', descripcion: 'Presión arterial de CO2 (PaCO2)'),
    const Indicador(
        idIndicador: '003',
        descripcion: 'Patrón respiratorio y trabajo ventilatorio'),
    const Indicador(
        idIndicador: '004', descripcion: 'Uso de músculos accesorios'),
  ],

  // Control glucémico
  'NOC-2121': [
    const Indicador(
        idIndicador: '001',
        descripcion: 'Niveles de glucosa en sangre (mg/dL)'),
    const Indicador(
        idIndicador: '002',
        descripcion: 'Variabilidad glucémica (desviación estándar)'),
    const Indicador(
        idIndicador: '003',
        descripcion: 'Episodios de hipoglucemia/hiperglucemia'),
    const Indicador(
        idIndicador: '004',
        descripcion: 'Hemoglobina glicosilada (HbA1c) si aplica'),
  ],

  'NOC-2122': [
    const Indicador(
        idIndicador: '001',
        descripcion: 'Porcentaje de mediciones dentro de rango objetivo'),
    const Indicador(
        idIndicador: '002',
        descripcion: 'Episodios de cetoacidosis/estado hiperosmolar'),
    const Indicador(
        idIndicador: '003', descripcion: 'Necesidad de ajustes terapéuticos'),
    const Indicador(
        idIndicador: '004',
        descripcion: 'Síntomas asociados a descontrol glucémico'),
  ],

  // Permeabilidad y limpieza de vías aéreas
  'NOC-0415': [
    const Indicador(
        idIndicador: '001',
        descripcion: 'Presencia/ausencia de estridor o ruidos agregados'),
    const Indicador(
        idIndicador: '002',
        descripcion: 'Frecuencia de obstrucción documentada'),
    const Indicador(
        idIndicador: '003',
        descripcion: 'Necesidad de maniobras/succiones para desobstrucción'),
    const Indicador(
        idIndicador: '004',
        descripcion: 'Evaluación mediante escalas de disnea'),
  ],

  'NOC-0417': [
    const Indicador(
        idIndicador: '001',
        descripcion: 'Volumen y características de secreciones'),
    const Indicador(
        idIndicador: '002', descripcion: 'Frecuencia de aspiración requerida'),
    const Indicador(
        idIndicador: '003',
        descripcion: 'Resultados de cultivos de secreciones'),
    const Indicador(
        idIndicador: '004',
        descripcion: 'Efectividad de técnicas de limpieza implementadas'),
  ],

  // Control de temperatura
  'NOC-0805': [
    const Indicador(
        idIndicador: '001', descripcion: 'Temperatura central (°C)'),
    const Indicador(
        idIndicador: '002',
        descripcion: 'Diferencia temperatura central-periférica'),
    const Indicador(
        idIndicador: '003',
        descripcion: 'Uso de medidas de regulación térmica'),
    const Indicador(
        idIndicador: '004',
        descripcion: 'Estabilidad térmica en diferentes ambientes'),
  ],

  'NOC-0806': [
    const Indicador(
        idIndicador: '001',
        descripcion: 'Porcentaje de mediciones dentro de rango normal'),
    const Indicador(
        idIndicador: '002',
        descripcion: 'Magnitud y duración de episodios febriles'),
    const Indicador(
        idIndicador: '003', descripcion: 'Respuesta a medidas antipiréticas'),
    const Indicador(
        idIndicador: '004',
        descripcion: 'Síntomas asociados a alteraciones térmicas'),
  ],

  // Manejo de medicación
  'NOC-2107': [
    const Indicador(
        idIndicador: '001',
        descripcion: 'Número y severidad de efectos adversos documentados'),
    const Indicador(
        idIndicador: '002',
        descripcion: 'Nivel de monitorización de parámetros relacionados'),
    const Indicador(
        idIndicador: '003',
        descripcion: 'Necesidad de ajustes o suspensiones de medicación'),
    const Indicador(
        idIndicador: '004',
        descripcion: 'Resultados de niveles séricos de fármacos si aplica'),
  ],

  'NOC-2108': [
    const Indicador(
        idIndicador: '001',
        descripcion: 'Porcentaje de dosis administradas según prescripción'),
    const Indicador(
        idIndicador: '002',
        descripcion: 'Autorreporte de adherencia por el paciente'),
    const Indicador(
        idIndicador: '003',
        descripcion: 'Resultados terapéuticos esperados alcanzados'),
    const Indicador(
        idIndicador: '004',
        descripcion: 'Uso de sistemas de apoyo para la adherencia'),
  ],

  // Cicatrización de heridas
  'NOC-1903': [
    const Indicador(
        idIndicador: '001',
        descripcion: 'Reducción del tamaño de la herida (cm/semana)'),
    const Indicador(
        idIndicador: '002', descripcion: 'Formación de tejido de granulación'),
    const Indicador(idIndicador: '003', descripcion: 'Epitelización de bordes'),
    const Indicador(
        idIndicador: '004',
        descripcion: 'Evaluación mediante escalas de cicatrización'),
  ],

  'NOC-1904': [
    const Indicador(
        idIndicador: '001',
        descripcion: 'Ausencia de signos de infección local'),
    const Indicador(
        idIndicador: '002',
        descripcion: 'Cumplimiento de protocolos de curación'),
    const Indicador(
        idIndicador: '003',
        descripcion: 'Uso apropiado de apósitos y antimicrobianos tópicos'),
    const Indicador(
        idIndicador: '004', descripcion: 'Resultados de cultivos de herida'),
  ],

  // Eliminación urinaria
  'NOC-0505': [
    const Indicador(
        idIndicador: '001', descripcion: 'Volumen urinario (ml/kg/hora)'),
    const Indicador(
        idIndicador: '002',
        descripcion: 'Frecuencia de episodios de incontinencia'),
    const Indicador(
        idIndicador: '003', descripcion: 'Residuo posmiccional (ml) si aplica'),
    const Indicador(
        idIndicador: '004', descripcion: 'Características físicas de la orina'),
  ],

  'NOC-0507': [
    const Indicador(
        idIndicador: '001',
        descripcion: 'Número de episodios de continencia/incontinencia'),
    const Indicador(
        idIndicador: '002', descripcion: 'Uso de técnicas de control vesical'),
    const Indicador(
        idIndicador: '003',
        descripcion: 'Impacto en calidad de vida reportado'),
    const Indicador(
        idIndicador: '004',
        descripcion: 'Necesidad de productos de contención'),
  ],

  // Manejo de ostomías
  'NOC-0509': [
    const Indicador(
        idIndicador: '001',
        descripcion: 'Estado del estoma (color, edema, retracción)'),
    const Indicador(
        idIndicador: '002',
        descripcion: 'Frecuencia de cambios de dispositivo requeridos'),
    const Indicador(
        idIndicador: '003',
        descripcion: 'Presencia de complicaciones (dermatitis, estenosis)'),
    const Indicador(
        idIndicador: '004', descripcion: 'Adecuación del sistema recolector'),
  ],

  'NOC-0510': [
    const Indicador(
        idIndicador: '001',
        descripcion: 'Nivel de independencia en cuidados del estoma'),
    const Indicador(
        idIndicador: '002',
        descripcion: 'Conocimiento demostrado sobre cuidados'),
    const Indicador(
        idIndicador: '003',
        descripcion: 'Habilidad para resolver problemas comunes'),
    const Indicador(
        idIndicador: '004', descripcion: 'Disponibilidad de recursos y apoyo'),
  ],

  // Autocuidado
  'NOC-1210': [
    const Indicador(
        idIndicador: '001',
        descripcion:
            'Nivel de independencia en actividades básicas (escala Barthel)'),
    const Indicador(
        idIndicador: '002', descripcion: 'Uso de ayudas técnicas adecuadas'),
    const Indicador(
        idIndicador: '003',
        descripcion: 'Planificación y organización de actividades diarias'),
    const Indicador(
        idIndicador: '004',
        descripcion: 'Seguridad en la ejecución de actividades'),
  ],

  // Agregando resultados adicionales mencionados en tu ejemplo original
  'NOC-1803': [
    const Indicador(
        idIndicador: '001',
        descripcion: 'Nivel de conocimiento demostrado sobre la enfermedad'),
    const Indicador(
        idIndicador: '002',
        descripcion: 'Habilidad para explicar condición y tratamiento'),
    const Indicador(
        idIndicador: '003',
        descripcion: 'Uso apropiado de información proporcionada'),
    const Indicador(
        idIndicador: '004', descripcion: 'Preguntas y dudas expresadas'),
  ],

  'NOC-1805': [
    const Indicador(
        idIndicador: '001',
        descripcion: 'Ejecución correcta de técnicas de autocuidado'),
    const Indicador(
        idIndicador: '002', descripcion: 'Identificación de signos de alarma'),
    const Indicador(
        idIndicador: '003',
        descripcion: 'Adherencia a recomendaciones terapéuticas'),
    const Indicador(
        idIndicador: '004',
        descripcion: 'Uso de recursos comunitarios disponibles'),
  ],

  'NOC-0501': [
    const Indicador(
        idIndicador: '001',
        descripcion: 'Frecuencia y características de deposiciones'),
    const Indicador(
        idIndicador: '002',
        descripcion: 'Síntomas gastrointestinales reportados'),
    const Indicador(
        idIndicador: '003', descripcion: 'Resultados de estudios diagnósticos'),
    const Indicador(
        idIndicador: '004', descripcion: 'Tolerancia a la alimentación'),
  ],

  'NOC-0502': [
    const Indicador(
        idIndicador: '001', descripcion: 'Frecuencia evacuatoria (veces/día)'),
    const Indicador(
        idIndicador: '002',
        descripcion: 'Consistencia de heces (escala Bristol)'),
    const Indicador(
        idIndicador: '003', descripcion: 'Esfuerzo evacuatorio requerido'),
    const Indicador(
        idIndicador: '004', descripcion: 'Uso de ayudas para la defecación'),
  ],

  'NOC-0902': [
    const Indicador(
        idIndicador: '001',
        descripcion: 'Nivel de conciencia (escala de Glasgow)'),
    const Indicador(
        idIndicador: '002', descripcion: 'Función motora y reflejos'),
    const Indicador(idIndicador: '003', descripcion: 'Estado sensorial'),
    const Indicador(
        idIndicador: '004', descripcion: 'Signos de focalización neurológica'),
  ],

  'NOC-0903': [
    const Indicador(
        idIndicador: '001',
        descripcion: 'Orientación en tiempo, espacio y persona'),
    const Indicador(
        idIndicador: '002', descripcion: 'Memoria reciente y remota'),
    const Indicador(
        idIndicador: '003',
        descripcion: 'Capacidad de atención y concentración'),
    const Indicador(
        idIndicador: '004', descripcion: 'Habilidad para seguir instrucciones'),
  ],

  'NOC-0905': [
    const Indicador(
        idIndicador: '001', descripcion: 'Fuerza muscular (escala 0-5)'),
    const Indicador(
        idIndicador: '002', descripcion: 'Coordinación y equilibrio'),
    const Indicador(idIndicador: '003', descripcion: 'Tono muscular'),
    const Indicador(
        idIndicador: '004', descripcion: 'Presencia de movimientos anormales'),
  ],

  'NOC-1202': [
    const Indicador(
        idIndicador: '001',
        descripcion: 'Nivel de ansiedad autorreportado (escala HADS)'),
    const Indicador(
        idIndicador: '002', descripcion: 'Síntomas físicos de ansiedad'),
    const Indicador(
        idIndicador: '003', descripcion: 'Impacto en actividades diarias'),
    const Indicador(
        idIndicador: '004', descripcion: 'Uso de estrategias de afrontamiento'),
  ],

  'NOC-2010': [
    const Indicador(
        idIndicador: '001',
        descripcion: 'Tolerancia a la alimentación enteral'),
    const Indicador(
        idIndicador: '002', descripcion: 'Volumen de residuo gástrico'),
    const Indicador(idIndicador: '003', descripcion: 'Distensión abdominal'),
    const Indicador(idIndicador: '004', descripcion: 'Ruidos intestinales'),
  ],

  'NOC-0402': [
    const Indicador(
        idIndicador: '001', descripcion: 'Frecuencia cardíaca y ritmo'),
    const Indicador(
        idIndicador: '002', descripcion: 'Presión arterial y pulso'),
    const Indicador(idIndicador: '003', descripcion: 'Perfusión periférica'),
    const Indicador(idIndicador: '004', descripcion: 'Edema periférico'),
  ],
};
