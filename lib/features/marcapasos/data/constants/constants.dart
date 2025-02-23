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

List<int> frecuenciasMarcapaso = [for (int i = 30; i <= 180; i += 5) i];

const List<double> sensibilidadesMarcapaso = [20, 10, 5, 3, 2, 1, 0.5];

const List<double> salidasMarcapaso = [0.1, 0.2, 0.5, 1, 2, 5, 7, 10, 15, 20];
