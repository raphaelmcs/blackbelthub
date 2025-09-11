import 'modality.dart';

class UserProfile {
  final String id;
  final String name;
  final List<Modality> modalities;

  const UserProfile({
    required this.id,
    required this.name,
    required this.modalities,
  });
}
