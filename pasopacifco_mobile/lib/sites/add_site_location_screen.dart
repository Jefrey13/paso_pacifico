import 'package:flutter/material.dart';
import 'package:pasopacifco_mobile/core/app_export.dart';
import 'package:pasopacifco_mobile/routes/app_routes.dart';
import 'package:pasopacifco_mobile/widgets/app_bar/appbar_title.dart';
import 'package:pasopacifco_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:pasopacifco_mobile/widgets/custom_checkbox_button.dart';
import 'package:pasopacifco_mobile/widgets/custom_drop_dowm.dart';
import 'package:pasopacifco_mobile/widgets/custom_elevated_button.dart';
import 'package:pasopacifco_mobile/widgets/custom_text_form_field.dart';
import 'package:pasopacifco_mobile/widgets/app_bar/app_bar_leading_iconbutton.dart';
import 'package:pasopacifco_mobile/sites/models/Department.dart';
import 'package:pasopacifco_mobile/sites/models/Municipality.dart';
import 'package:pasopacifco_mobile/sites/services/location_service.dart';
import 'package:pasopacifco_mobile/sites/services/site_service.dart';
import 'package:pasopacifco_mobile/sites/models/Site.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pasopacifco_mobile/sites/services/location_service.dart';
import 'package:pasopacifco_mobile/sites/services/site_service.dart';

class AddSiteLocationScreen extends StatefulWidget {
  AddSiteLocationScreen({Key? key}) : super(key: key);

  @override
  _AddSiteLocationScreenState createState() => _AddSiteLocationScreenState();
}

class _AddSiteLocationScreenState extends State<AddSiteLocationScreen> {
  // Controladores de texto
  TextEditingController inputNameController = TextEditingController();
  TextEditingController inputiCrossinController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  // Datos dinámicos
  List<Department> departments = [];
  List<Municipality> municipalities = [];
  Department? selectedDepartment;
  Municipality? selectedMunicipality;

  // Estados de carga
  bool isLoadingDepartments = true;
  bool isLoadingMunicipalities = false;

  // Checkbox values
  bool terrestreone = true;
  bool embarcacinone = false;
  bool submarinaone = false;

  @override
  void initState() {
    super.initState();
    fetchDepartments();
  }

  /// Método para cargar departamentos desde Firestore
  Future<void> fetchDepartments() async {
    setState(() {
      isLoadingDepartments = true;
    });
    try {
      final locationService = LocationService();
      final fetchedDepartments = await locationService.getAllDepartments();
      setState(() {
        departments = fetchedDepartments;
        isLoadingDepartments = false;
      });
    } catch (e) {
      setState(() {
        isLoadingDepartments = false;
      });
      Fluttertoast.showToast(
        msg: "Error al cargar departamentos. Inténtalo de nuevo.",
        backgroundColor: Colors.red,
        textColor: Colors.white,
        gravity: ToastGravity.BOTTOM,
        fontSize: 16.0,
      );
    }
  }

  /// Método para cargar municipios basados en el departamento seleccionado
  Future<void> fetchMunicipalities(String departmentId) async {
    setState(() {
      isLoadingMunicipalities = true;
      municipalities = [];
      selectedMunicipality = null;
    });
    try {
      final locationService = LocationService();
      final fetchedMunicipalities =
          await locationService.getMunicipalitiesByDepartment(departmentId);
      setState(() {
        municipalities = fetchedMunicipalities;
        isLoadingMunicipalities = false;
      });
    } catch (e) {
      setState(() {
        isLoadingMunicipalities = false;
      });
      Fluttertoast.showToast(
        msg: "Error al cargar municipios. Inténtalo de nuevo.",
        backgroundColor: Colors.red,
        textColor: Colors.white,
        gravity: ToastGravity.BOTTOM,
        fontSize: 16.0,
      );
    }
  }

  /// Validar datos antes de guardar
  bool validateInputs() {
    if (inputNameController.text.trim().isEmpty) {
      Fluttertoast.showToast(
        msg: "El nombre del sitio no puede estar vacío.",
        backgroundColor: Colors.orange,
        textColor: Colors.white,
        gravity: ToastGravity.BOTTOM,
        fontSize: 16.0,
      );
      return false;
    }

    if (inputiCrossinController.text.trim().isEmpty) {
      Fluttertoast.showToast(
        msg: "El cruce más cercano no puede estar vacío.",
        backgroundColor: Colors.orange,
        textColor: Colors.white,
        gravity: ToastGravity.BOTTOM,
        fontSize: 16.0,
      );
      return false;
    }

    if (selectedDepartment == null || selectedMunicipality == null) {
      Fluttertoast.showToast(
        msg: "Selecciona un departamento y un municipio.",
        backgroundColor: Colors.orange,
        textColor: Colors.white,
        gravity: ToastGravity.BOTTOM,
        fontSize: 16.0,
      );
      return false;
    }

    if (!terrestreone && !embarcacinone && !submarinaone) {
      Fluttertoast.showToast(
        msg: "Selecciona al menos una modalidad de limpieza.",
        backgroundColor: Colors.orange,
        textColor: Colors.white,
        gravity: ToastGravity.BOTTOM,
        fontSize: 16.0,
      );
      return false;
    }

    return true;
  }

  /// Guardar el sitio en Firestore
  void saveSite() async {
    if (!validateInputs()) return;

    try {
      final site = Site(
        id: '',
        name: inputNameController.text.trim(),
        closestCrossing: inputiCrossinController.text.trim(),
        departmentId: selectedDepartment!.id,
        municipalityId: selectedMunicipality!.id,
        country: "Nicaragua",
        cleaningModes: [
          if (terrestreone) "Terrestre",
          if (embarcacinone) "Embarcación",
          if (submarinaone) "Submarina",
        ],
        state: true,
        createdAt: DateTime.now(),
      );

      final siteService = SiteService();
      await siteService.createSite(site);

      Fluttertoast.showToast(
        msg: "Sitio guardado exitosamente.",
        backgroundColor: Colors.green,
        textColor: Colors.white,
        gravity: ToastGravity.BOTTOM,
        fontSize: 16.0,
      );

      Navigator.pop(context);
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Error al guardar el sitio. Inténtalo de nuevo.",
        backgroundColor: Colors.red,
        textColor: Colors.white,
        gravity: ToastGravity.BOTTOM,
        fontSize: 16.0,
      );
    }
  }

  Widget _buildDropdown<T>(
    String label,
    List<T> items,
    T? selectedValue,
    void Function(T?) onChanged,
    bool isLoading,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        SizedBox(height: 8.0),
        isLoading
            ? CircularProgressIndicator()
            : DropdownButtonFormField<T>(
                value: selectedValue,
                hint: Text(
                  "Seleccionar",
                  style: TextStyle(
                    fontSize: 14.0,
                    color:
                        Colors.grey[600], // Color para el hint predeterminado
                  ),
                ),
                items: items.map((item) {
                  if (item is Department) {
                    return DropdownMenuItem(
                      value: item,
                      child: Text(
                        item.name,
                        style: TextStyle(
                          fontSize: 14.0, // Tamaño uniforme para el texto
                          fontWeight: FontWeight.normal, // Fuente normal
                          color: Colors.black, // Color negro para el texto
                        ),
                      ),
                    );
                  } else if (item is Municipality) {
                    return DropdownMenuItem(
                      value: item,
                      child: Text(
                        item.name,
                        style: TextStyle(
                          fontSize: 14.0, // Tamaño uniforme para el texto
                          fontWeight: FontWeight.normal, // Fuente normal
                          color: Colors.black, // Color negro para el texto
                        ),
                      ),
                    );
                  }
                  throw Exception("Tipo no soportado.");
                }).toList(),
                onChanged: onChanged,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(8.0), // Bordes redondeados
                    borderSide: BorderSide(
                      color: Colors.black, // Color del borde
                      width: 1.0,
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 8.0,
                  ),
                ),
              ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppbar(context),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Detalles del Sitio Seleccionado",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(height: 16.0),
                      _buildInput(context, "Sitio", inputNameController,
                          "Nombre del sitio"),
                      SizedBox(height: 16.0),
                      _buildInput(context, "Cruce más cercano",
                          inputiCrossinController, "Nombre del cruce"),
                      SizedBox(height: 16.0),
                      _buildDropdown(
                        "Departamento",
                        departments,
                        selectedDepartment,
                        (value) {
                          setState(() {
                            selectedDepartment = value as Department;
                          });
                          fetchMunicipalities(selectedDepartment!.id);
                        },
                        isLoadingDepartments,
                      ),
                      SizedBox(height: 16.0),
                      _buildDropdown(
                        "Municipio",
                        municipalities,
                        selectedMunicipality,
                        (value) => setState(
                            () => selectedMunicipality = value as Municipality),
                        isLoadingMunicipalities,
                      ),
                      SizedBox(height: 16.0),
                      _buildOptions(context),
                      SizedBox(height: 16.0),
                      CustomElevatedButton(
                        onPressed: saveSite,
                        text: "Guardar Registro",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppbar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(56.0), // Altura estándar de un AppBar
      child: CustomAppBar(
        leadingWidth: 62.h,
        leading: AppbarLeadingIconButton(
          imagePath: ImageConstant.arrowBack,
          margin: EdgeInsets.only(left: 20.h, top: 7.h, bottom: 7.h),
          onTap: () {},
        ),
        centerTitle: true, // Centra el título
        title: AppbarTitle(
          text: "Ubicación del Sitio",
          // Eliminamos el margen derecho que desalineaba el título
        ),
      ),
    );
  }

  Widget _buildInput(BuildContext context, String label,
      TextEditingController controller, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.bodyLarge),
        SizedBox(height: 8.0),
        CustomTextFormField(
          controller: controller,
          hintText: hint,
          hintStyle: CustomTextStyles.bodyMediumErrorContainer,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.h, vertical: 14.h),
        ),
      ],
    );
  }

  Widget _buildOptions(BuildContext context) {
    return Row(
      children: [
        CustomCheckboxButton(
          text: "Terrestre",
          value: terrestreone,
          onChange: (value) => setState(() => terrestreone = value),
        ),
        SizedBox(width: 16.0),
        CustomCheckboxButton(
          text: "Embarcación",
          value: embarcacinone,
          onChange: (value) => setState(() => embarcacinone = value),
        ),
        SizedBox(width: 16.0),
        CustomCheckboxButton(
          text: "Submarina",
          value: submarinaone,
          onChange: (value) => setState(() => submarinaone = value),
        ),
      ],
    );
  }
}
