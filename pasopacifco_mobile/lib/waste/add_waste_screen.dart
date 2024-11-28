import 'package:flutter/material.dart';
import 'package:pasopacifco_mobile/core/app_export.dart';
import 'package:pasopacifco_mobile/widgets/app_bar/appbar_title.dart';
import 'package:pasopacifco_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:pasopacifco_mobile/widgets/custom_elevated_button.dart';
import 'package:pasopacifco_mobile/widgets/custom_text_form_field.dart';
import 'package:pasopacifco_mobile/widgets/app_bar/app_bar_leading_iconbutton.dart';
import 'package:pasopacifco_mobile/waste/models/Category.dart';
import 'package:pasopacifco_mobile/waste/services/category_service.dart';
import 'package:pasopacifco_mobile/waste/models/Waste.dart';
import 'package:pasopacifco_mobile/waste/services/waste_service.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddWasteScreen extends StatefulWidget {
  AddWasteScreen({Key? key}) : super(key: key);

  @override
  _AddWasteScreenState createState() => _AddWasteScreenState();
}

class _AddWasteScreenState extends State<AddWasteScreen> {
  final CategoryService _categoryService = CategoryService();
  final WasteService _wasteService = WasteService();
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  String? selectedCategory;

  List<Category> categories =
      []; // Lista para almacenar las categorías obtenidas
  bool isLoadingCategories = true;

  @override
  void initState() {
    super.initState();
    _fetchCategories(); // Cargar categorías desde Firestore
  }

  // Método para obtener las categorías activas desde Firestore
  Future<void> _fetchCategories() async {
    try {
      final fetchedCategories = await _categoryService.getAllActiveCategories();
      setState(() {
        categories = fetchedCategories;
        isLoadingCategories = false;
      });
    } catch (e) {
      setState(() {
        isLoadingCategories = false;
      });
      print("Error al cargar categorías: $e");
    }
  }

  // Validación de los campos antes de guardar
  bool _validateInputs() {
    if (nameController.text.trim().isEmpty) {
      Fluttertoast.showToast(
        msg: "El nombre del residuo no puede estar vacío.",
        backgroundColor: Colors.orange,
        textColor: Colors.white,
      );
      return false;
    }

    if (descriptionController.text.trim().isEmpty) {
      Fluttertoast.showToast(
        msg: "La descripción no puede estar vacía.",
        backgroundColor: Colors.orange,
        textColor: Colors.white,
      );
      return false;
    }

    if (selectedCategory == null) {
      Fluttertoast.showToast(
        msg: "Por favor, selecciona una categoría.",
        backgroundColor: Colors.orange,
        textColor: Colors.white,
      );
      return false;
    }

    return true;
  }

  // Método para guardar el residuo en Firestore
  Future<void> _saveWaste() async {
    if (!_validateInputs()) return;

    try {
      final waste = Waste(
        id: '', // Se generará automáticamente en Firestore
        name: nameController.text.trim(),
        description: descriptionController.text.trim(),
        category: selectedCategory!,
        state: true,
        createdAt: DateTime.now(),
      );

      await _wasteService.createWaste(
          waste); // Usar el servicio de Waste para crear el residuo

      Fluttertoast.showToast(
        msg: "Residuo guardado exitosamente.",
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );

      // Limpiar los campos después de guardar
      nameController.clear();
      descriptionController.clear();
      setState(() {
        selectedCategory = null;
      });

      Navigator.pop(context);
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Error al guardar el residuo.",
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
      print("Error al guardar el residuo: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppbar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(left: 8.h, top: 18.h, right: 8.h),
          child: Column(
            children: [
              _buildInput(context),
              SizedBox(height: 12.h),
              _buildCategoryDropdown(),
              SizedBox(height: 12.h),
              _buildDescriptionInput(context),
              SizedBox(height: 12.h),
              CustomElevatedButton(
                height: 52.h,
                text: "Agregar Residuo",
                onPressed:
                    _saveWaste, // Llamada al método para guardar el residuo
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Método para construir el app bar
  PreferredSizeWidget _buildAppbar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 62.h,
      leading: AppbarLeadingIconButton(
        imagePath: ImageConstant.arrowBack,
        margin: EdgeInsets.only(left: 20.h, top: 7.h, bottom: 7.h),
        onTap: () => Navigator.pop(context),
      ),
      centerTitle: true,
      title: AppbarTitle(
        text: "Agregar Residuo",
        margin: EdgeInsets.only(right: 96.h),
      ),
    );
  }

  // Método para construir el campo de nombre
  Widget _buildInput(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Nombre", style: theme.textTheme.bodyLarge),
          SizedBox(height: 4.h),
          CustomTextFormField(
            controller: nameController,
            hintText: "Puntas de puros",
            hintStyle: theme.textTheme.bodyMedium!,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 16.h, vertical: 14.h),
          ),
        ],
      ),
    );
  }

  // Método para construir el campo de descripción
  Widget _buildDescriptionInput(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Descripción", style: theme.textTheme.bodyLarge),
          SizedBox(height: 4.h),
          CustomTextFormField(
            controller: descriptionController,
            hintText: "Descripción del residuo",
            hintStyle: theme.textTheme.bodyMedium!,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 16.h, vertical: 14.h),
            maxLines: 7,
          ),
        ],
      ),
    );
  }

  // Método para construir el dropdown de categorías
  Widget _buildCategoryDropdown() {
    return Container(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Categoría", style: theme.textTheme.bodyLarge),
          SizedBox(height: 4.h),
          isLoadingCategories
              ? CircularProgressIndicator()
              : DropdownButtonFormField<String>(
                  value: selectedCategory,
                  hint: Text("Seleccionar categoría"),
                  onChanged: (newValue) {
                    setState(() {
                      selectedCategory = newValue;
                    });
                  },
                  items: categories.map((Category category) {
                    return DropdownMenuItem<String>(
                      value: category.id,
                      child: Text(category.name),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 12.0, vertical: 14.0),
                  ),
                ),
        ],
      ),
    );
  }
}
