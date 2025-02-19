import 'package:cloud_firestore/cloud_firestore.dart';
import '../dto/create_marcapaso_dto.dart';

class MarcapasosRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> registrarMarcapaso(CreateMarcapasoDto dto) async {
    await _firestore.collection("marcapasos").add(dto.toJson());
  }
}
