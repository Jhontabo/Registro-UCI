/// 🔹 **Tipos de Catéter**
const List<String> tiposCateter = [
  'Venoso central',
  'Venoso periférico',
  'Arterial',
];

/// 🔹 **Sitios de Inserción**
const List<String> sitiosCateter = [
  'Yugular derecho',
  'Yugular izquierdo',
  'Subclavia derecho',
  'Subclavia izquierdo',
  'Periférico miembro superior derecho',
  'Periférico miembro superior izquierdo',
  'Radial derecho',
  'Radial izquierdo',
  'Pedial derecho',
  'Pedial izquierdo',
  'Femoral derecho',
  'Femoral izquierdo',
];

/// 🔹 **Lugares de Procedencia**
const List<String> lugaresProcedenciaCateter = [
  'Hospitalización',
  'Urgencias',
  'Quirófano',
  'Cuidado intermedio',
];

/// 🔹 **Lista de Fechas de Retiro Predefinidas** (Ejemplo de opciones rápidas)
final List<String> fechasRetiroCateter = [
  DateTime.now().subtract(const Duration(days: 1)).toIso8601String(),
  DateTime.now().toIso8601String(),
  DateTime.now().add(const Duration(days: 1)).toIso8601String(),
];
