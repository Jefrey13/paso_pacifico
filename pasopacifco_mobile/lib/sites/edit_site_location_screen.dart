import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pasopacifco_mobile/core/app_export.dart';
import 'package:pasopacifco_mobile/sites/models/Department.dart';
import 'package:pasopacifco_mobile/sites/models/Municipality.dart';
import 'package:pasopacifco_mobile/sites/models/Site.dart';
import 'package:pasopacifco_mobile/sites/services/location_service.dart';
import 'package:pasopacifco_mobile/sites/services/site_service.dart';
import 'package:pasopacifco_mobile/theme/custom_button_style.dart';
import 'package:pasopacifco_mobile/theme/custom_text_style.dart';
import 'package:pasopacifco_mobile/widgets/custom_checkbox_button.dart';
import 'package:pasopacifco_mobile/widgets/custom_elevated_button.dart';

class EditSiteLocationScreen extends StatefulWidget {
  final Site site; // Recibe el sitio a editar
  EditSiteLocationScreen({Key? key, required this.site}) : super(key: key);

  @override
  _EditSiteLocationScreenState createState() => _EditSiteLocationScreenState();
}

class _EditSiteLocationScreenState extends State<EditSiteLocationScreen> {
  // Controladores de texto
  late TextEditingController nameController;
  late TextEditingController crossingController;

  // Datos dinámicos
  List<Department> departments = [];
  List<Municipality> municipalities = [];
  Department? selectedDepartment;
  Municipality? selectedMunicipality;

  // Estados de carga
  bool isLoadingDepartments = true;
  bool isLoadingMunicipalities = false;

  // Checkbox values
  bool terrestreone = false;
  bool embarcacinone = false;
  bool submarinaone = false;

  @override
  void initState() {
    super.initState();

    // Inicializar controladores con los datos del sitio
    nameController = TextEditingController(text: widget.site.name);
    crossingController =
        TextEditingController(text: widget.site.closestCrossing);

    // Inicializar modalidades de limpieza
    terrestreone = widget.site.cleaningModes.contains("Terrestre");
    embarcacinone = widget.site.cleaningModes.contains("Embarcación");
    submarinaone = widget.site.cleaningModes.contains("Submarina");

    // Cargar departamentos y municipios
    fetchDepartments();
    fetchMunicipalities(widget.site.departmentId);
  }

  /// Cargar departamentos desde Firestore
  Future<void> fetchDepartments() async {
    setState(() {
      isLoadingDepartments = true;
    });
    try {
      final locationService = LocationService();
      final fetchedDepartments = await locationService.getAllDepartments();
      setState(() {
        departments = fetchedDepartments;
        selectedDepartment = departments.firstWhere(
          (dept) => dept.id == widget.site.departmentId,
        );
        isLoadingDepartments = false;
      });
    } catch (e) {
      setState(() {
        isLoadingDepartments = false;
      });
      Fluttertoast.showToast(
        msg: "Error al cargar departamentos.",
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

  /// Cargar municipios basados en el departamento seleccionado
  Future<void> fetchMunicipalities(String departmentId) async {
    setState(() {
      isLoadingMunicipalities = true;
    });
    try {
      final locationService = LocationService();
      final fetchedMunicipalities =
          await locationService.getMunicipalitiesByDepartment(departmentId);
      setState(() {
        municipalities = fetchedMunicipalities;
        selectedMunicipality = municipalities.firstWhere(
          (mun) => mun.id == widget.site.municipalityId,
        );
        isLoadingMunicipalities = false;
      });
    } catch (e) {
      setState(() {
        isLoadingMunicipalities = false;
      });
      Fluttertoast.showToast(
        msg: "Error al cargar municipios.",
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

  /// Validar inputs antes de guardar cambios
  bool validateInputs() {
    if (nameController.text.trim().isEmpty) {
      Fluttertoast.showToast(
        msg: "El nombre del sitio no puede estar vacío.",
        backgroundColor: Colors.orange,
        textColor: Colors.white,
      );
      return false;
    }

    if (crossingController.text.trim().isEmpty) {
      Fluttertoast.showToast(
        msg: "El cruce más cercano no puede estar vacío.",
        backgroundColor: Colors.orange,
        textColor: Colors.white,
      );
      return false;
    }

    if (selectedDepartment == null || selectedMunicipality == null) {
      Fluttertoast.showToast(
        msg: "Selecciona un departamento y un municipio.",
        backgroundColor: Colors.orange,
        textColor: Colors.white,
      );
      return false;
    }

    return true;
  }

  /// Actualizar el sitio
  Future<void> updateSite() async {
    if (!validateInputs()) return;

    try {
      final updatedSite = Site(
        id: widget.site.id,
        name: nameController.text.trim(),
        closestCrossing: crossingController.text.trim(),
        departmentId: selectedDepartment!.id,
        municipalityId: selectedMunicipality!.id,
        cleaningModes: [
          if (terrestreone) "Terrestre",
          if (embarcacinone) "Embarcación",
          if (submarinaone) "Submarina",
        ],
        state: widget.site.state,
        country: "Nicaragua",
        createdAt: widget.site.createdAt,
      );

      final siteService = SiteService();
      await siteService.updateSite(widget.site.id, updatedSite);

      Fluttertoast.showToast(
        msg: "Sitio actualizado exitosamente.",
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );

      Navigator.pop(context);
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Error al actualizar el sitio.",
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

  /// Desactivar el sitio
  Future<void> deactivateSite() async {
    try {
      final siteService = SiteService();
      await siteService.toggleSiteState(widget.site.id, false);

      Fluttertoast.showToast(
        msg: "Sitio desactivado exitosamente.",
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );

      Navigator.pop(context);
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Error al desactivar el sitio.",
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Editar Sitio"),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildInput(context, "Sitio", nameController, "Nombre del sitio"),
              SizedBox(height: 16.0),
              _buildInput(context, "Cruce más cercano", crossingController,
                  "Nombre del cruce"),
              SizedBox(height: 16.0),
              _buildDropdown(
                "Departamento",
                departments,
                selectedDepartment,
                (value) {
                  setState(() {
                    selectedDepartment = value;
                    fetchMunicipalities(selectedDepartment!.id);
                  });
                },
                isLoadingDepartments,
              ),
              SizedBox(height: 16.0),
              _buildDropdown(
                "Municipio",
                municipalities,
                selectedMunicipality,
                (value) => setState(() => selectedMunicipality = value),
                isLoadingMunicipalities,
              ),
              SizedBox(height: 16.0),
              _buildOptions(context),
              SizedBox(height: 32.0),
              _buildActionButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: CustomElevatedButton(
            onPressed: updateSite,
            text: "Actualizar",
          ),
        ),
        SizedBox(width: 16.0),
        Expanded(
          child: CustomElevatedButton(
            buttonStyle: ElevatedButton.styleFrom(
              backgroundColor: Colors.red, // Color de fondo rojo
            ),
            onPressed: deactivateSite,
            text: "Desactivar",
          ),
        ),
      ],
    );
  }

  Widget _buildInput(BuildContext context, String label,
      TextEditingController controller, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        SizedBox(height: 8.0),
        TextField(
          controller: controller,
          decoration: InputDecoration(hintText: hint),
        ),
      ],
    );
  }

  Widget _buildOptions(BuildContext context) {
    return Row(
      children: [
        CustomCheckboxButton(
          value: terrestreone,
          onChange: (value) => setState(() => terrestreone = value!),
          text: "Terrestre",
        ),
        SizedBox(width: 26.h),
        CustomCheckboxButton(
          value: embarcacinone,
          onChange: (value) => setState(() => embarcacinone = value!),
          text: "Embarcación",
        ),
        SizedBox(width: 26.h),
        CustomCheckboxButton(
          value: submarinaone,
          onChange: (value) => setState(() => submarinaone = value!),
          text: "Submarina",
        ),
      ],
    );
  }

  Widget _buildDropdown<T>(
    String label,
    List<T> items,
    T? selectedValue,
    ValueChanged<T?> onChanged,
    bool isLoading,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16.0), // Estilo del texto del label
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
                    color: Colors.grey[600], // Color del texto predeterminado
                  ),
                ),
                items: items.map((item) {
                  if (item is Department) {
                    return DropdownMenuItem(
                      value: item,
                      child: Text(
                        item.name,
                        style: TextStyle(
                          fontSize: 14.0, // Tamaño de fuente uniforme
                          fontWeight: FontWeight.normal, // Fuente no bold
                          color: Colors.black, // Color estándar
                        ),
                      ),
                    );
                  } else if (item is Municipality) {
                    return DropdownMenuItem(
                      value: item,
                      child: Text(
                        item.name,
                        style: TextStyle(
                          fontSize: 14.0, // Tamaño de fuente uniforme
                          fontWeight: FontWeight.normal, // Fuente no bold
                          color: Colors.black, // Color estándar
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
}
