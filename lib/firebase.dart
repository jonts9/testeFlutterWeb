import 'package:firebase/firebase.dart' as fb;
import 'package:firebase/firestore.dart';

CollectionReference get _movies => fb.firestore().collection("movies");

// Cria a Stream de documentos para usuários
Stream<List<DocumentSnapshot>> get streamMovies => _movies.onSnapshot.map(
      (QuerySnapshot query) =>
      query.docs.map((DocumentSnapshot doc) => doc).toList(),
);

initFirebase() {
  fb.initializeApp(
    apiKey: "AIzaSyAbze_m-jWAkPkkEy2c24ToyMaoV2MpURc",
    projectId: "moviesupjonts9",
    databaseURL: "https://moviesupjonts9.firebaseio.com",
  );
}
