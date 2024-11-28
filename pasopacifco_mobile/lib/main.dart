import 'package:flutter/material.dart';
//import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:pasopacifco_mobile/core/app_export.dart';
import 'package:pasopacifco_mobile/routes/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pasopacifco_mobile/sites/models/Department.dart';
import 'package:pasopacifco_mobile/sites/models/Municipality.dart';
import 'package:pasopacifco_mobile/waste/services/category_service.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp();

  // Llama a la función para agregar datos, pero solo si no existen
  //await addDepartmentsAndMunicipalitiesToFirestore();
  // Llama a la función para agregar categorías predeterminadas si no existen
  //final CategoryService _categoryService = CategoryService();
  //await _categoryService.createDefaultCategories();

  // Si también deseas agregar los departamentos y municipios, descomenta esta línea
  // await addDepartmentsAndMunicipalitiesToFirestore();

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
      // Crear el modelo de departamento
      final department = Department(
        id: '', // ID se genera automáticamente en Firestore
        name: departmentName,
        country: "Nicaragua",
        hasSeaAccess: true, // Acceso al mar
        state: true, // Activo
        createdAt: DateTime.now(), // Fecha de creación
      );

      // Guardar el departamento en Firestore
      final departmentRef = await firestore
          .collection("departments")
          .add(department.toFirestore());

      print(
          "Departamento '$departmentName' agregado con ID: ${departmentRef.id}");

      // Obtener los municipios del departamento
      final municipalities = departmentsWithMunicipalities[departmentName]!;

      for (final municipalityName in municipalities) {
        // Crear el modelo de municipio
        final municipality = Municipality(
          id: '', // ID se genera automáticamente en Firestore
          name: municipalityName,
          departmentId: departmentRef.id, // Relación con el departamento
          hasSeaAccess: true, // Acceso al mar (si aplica)
          state: true, // Activo
          createdAt: DateTime.now(), // Fecha de creación
        );

        // Guardar el municipio en Firestore
        await firestore
            .collection("municipalities")
            .add(municipality.toFirestore());

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
