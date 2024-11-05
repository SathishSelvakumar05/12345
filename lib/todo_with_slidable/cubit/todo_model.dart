class Todo {
  final String name;
  final DateTime createdAt;
  final DateTime? updatedAt;

  Todo({
    required this.name,
    required this.createdAt,
    this.updatedAt,
  });

  Todo copy({
    String? name,
    DateTime? updatedAt,
  }) {
    return Todo(
      name: name ?? this.name,
      createdAt: this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
