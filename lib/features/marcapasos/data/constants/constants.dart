const List<String> modosMarcapaso = [
  'Modo VVI',
  'Modo AAI',
  'Modo DDD',
  'Modo VOO',
  'Modo AOO',
  'Modo DOO',
];

const List<String> viasMarcapaso = [
  'Vena yugular interna',
  'Vena yugular externa izquierda',
  'Vena yugular externa derecha',
  'Vena subclavia derecha',
  'Vena subclavia izquierda',
  'Vena femoral izquierda',
  'Vena femoral derecha',
  'Vena basílica izquierda',
  'Vena basílica derecha',
];

// ✅ `final` en lugar de `const` debido al `for`
final List<int> frecuenciasMarcapaso = [for (int i = 30; i <= 180; i += 5) i];

// ✅ Agregado `.0` para evitar problemas con `double`
const List<double> sensibilidadesMarcapaso = [
  20.0,
  10.0,
  5.0,
  3.0,
  2.0,
  1.0,
  0.5
];

const List<double> salidasMarcapaso = [
  0.1,
  0.2,
  0.5,
  1.0,
  2.0,
  5.0,
  7.0,
  10.0,
  15.0,
  20.0
];
