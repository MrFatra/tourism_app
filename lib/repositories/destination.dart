import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/destination.dart';

class DestinationRepository {
  final CollectionReference destinations =
      FirebaseFirestore.instance.collection('destinations');

  Future<List<Destination>> getDestinations() async {
    QuerySnapshot querySnapshot = await destinations.get();
    return querySnapshot.docs.map((doc) => Destination.fromJson(doc.data() as Map<String, dynamic>)).toList();
  }
}
