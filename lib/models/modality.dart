class Modality {
  final String id;
  final String name; // e.g., Jiu-Jitsu (Gi), No-Gi, Muay Thai
  final String belt; // optional: White, Blue, etc.
  final bool activeEnrollment;

  const Modality({
    required this.id,
    required this.name,
    required this.belt,
    required this.activeEnrollment,
  });
}
