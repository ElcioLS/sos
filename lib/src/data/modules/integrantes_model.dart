import 'dart:convert';

class IntegrantesModel {
  final String tipo;
  final int quantidade;
  IntegrantesModel({
    required this.tipo,
    required this.quantidade,
  });

  IntegrantesModel copyWith({
    String? tipo,
    int? quantidade,
  }) {
    return IntegrantesModel(
      tipo: tipo ?? this.tipo,
      quantidade: quantidade ?? this.quantidade,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'tipo': tipo,
      'quantidade': quantidade,
    };
  }

  factory IntegrantesModel.fromMap(Map<String, dynamic> map) {
    return IntegrantesModel(
      tipo: map['tipo'] ?? '',
      quantidade: map['quantidade']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory IntegrantesModel.fromJson(String source) =>
      IntegrantesModel.fromMap(json.decode(source));

  @override
  String toString() => 'IntegrantesModel(tipo: $tipo, quantidade: $quantidade)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is IntegrantesModel &&
        other.tipo == tipo &&
        other.quantidade == quantidade;
  }

  @override
  int get hashCode => tipo.hashCode ^ quantidade.hashCode;
}
