import 'package:flutter/material.dart';
//import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:pasopacifco_mobile/core/app_export.dart';
import 'package:pasopacifco_mobile/routes/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp();

  // Llama a la función para agregar datos, pero solo si no existen
  //await addDepartmentsWithSeaAccessToFirestore();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          theme: theme,
          title: 'Paso_Pacifico',
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.initialRoute,
          routes: AppRoutes.routes,
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaler: TextScaler.linear(1.0),
              ),
              child: child!,
            );
          },
        );
      },
    );
  }
}

Future<void> addDepartmentsAndMunicipalitiesToFirestore() async {
  final firestore = FirebaseFirestore.instance;

  // Verificar si ya existen datos en las colecciones
  final departmentsSnapshot = await firestore.collection("departments").get();
  final municipalitiesSnapshot =
      await firestore.collection("municipalities").get();

  if (departmentsSnapshot.docs.isNotEmpty ||
      municipalitiesSnapshot.docs.isNotEmpty) {
    print(
        "Las colecciones 'departments' y 'municipalities' ya contienen datos.");
    return;
  }

  // Datos de los departamentos y municipios
  final Map<String, List<String>> departmentsWithMunicipalities = {
    "Chinandega": ["Corinto", "El Viejo"],
    "León": ["León", "Nagarote"],
    "Managua": ["Villa El Carmen", "San Rafael del Sur"],
    "Carazo": ["Jinotepe", "Diriamba", "Santa Teresa"],
    "Rivas": ["Tola", "San Juan del Sur"],
    "Caribe Norte": ["Bilwi (Puerto Cabezas)", "Waspam", "Prinzapolka"],
    "Caribe Sur": [
      "Bluefields",
      "Laguna de Perlas",
      "Kukra Hill",
      "La Cruz de Río Grande",
      "Corn Island"
    ]
  };

  try {
    for (final departmentName in departmentsWithMunicipalities.keys) {
      // Agregar departamento a la colección 'departments'
      final departmentRef = await firestore.collection("departments").add({
        "name": departmentName,
        "country": "Nicaragua",
        "state": "active", // Estado del departamento
        "hasSeaAccess": true, // Acceso al mar (ejemplo)
        "createdAt": FieldValue.serverTimestamp(),
      });

      print(
          "Departamento '$departmentName' agregado con ID: ${departmentRef.id}");

      // Agregar municipios correspondientes a la colección 'municipalities'
      final municipalities = departmentsWithMunicipalities[departmentName]!;
      for (final municipalityName in municipalities) {
        await firestore.collection("municipalities").add({
          "name": municipalityName,
          "departmentId": departmentRef.id, // Relación con el departamento
          "state": "active", // Estado del municipio
          "hasSeaAccess": true, // Acceso al mar (si aplica)
          "createdAt": FieldValue.serverTimestamp(),
        });

        print(
            "Municipio '$municipalityName' agregado al departamento '$departmentName'.");
      }
    }

    print(
        "Todos los departamentos y municipios fueron agregados correctamente.");
  } catch (e) {
    print("Error al agregar los datos: $e");
  }
}
