import 'package:flutter/material.dart';
import 'package:pasopacifco_mobile/core/app_export.dart';
import 'package:pasopacifco_mobile/theme/custom_button_style.dart';
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

class EditWasteScreen extends StatefulWidget {
  final Waste waste; // Recibe el residuo a editar

  EditWasteScreen({Key? key, required this.waste}) : super(key: key);

  @override
  _EditWasteScreenState createState() => _EditWasteScreenState();
}

class _EditWasteScreenState extends State<EditWasteScreen> {
  final CategoryService _categoryService = CategoryService();
  final WasteService _wasteService = WasteService();
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  String? selectedCategory;
  List<Category> categories = [];
  bool isLoadingCategories = true;

  @override
  void initState() {
    super.initState();
    _fetchCategories(); // Cargar categorías desde Firestore
    _initializeFields();
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

  // Inicializar los campos con los datos del residuo
  void _initializeFields() {
    nameController.text = widget.waste.name;
    descriptionController.text = widget.waste.description;
    selectedCategory = widget.waste.category;
  }

  // Validación de los campos antes de actualizar
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

  // Método para actualizar el residuo en Firestore
  Future<void> _updateWaste() async {
    if (!_validateInputs()) return;

    try {
      final updatedWaste = Waste(
        id: widget.waste.id,
        name: nameController.text.trim(),
        description: descriptionController.text.trim(),
        category: selectedCategory!,
        state: true,
        createdAt: widget.waste.createdAt,
      );

      await _wasteService.updateWaste(widget.waste.id,
          updatedWaste); // Usar el servicio de Waste para actualizar el residuo

      Fluttertoast.showToast(
        msg: "Residuo actualizado exitosamente.",
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );

      // Limpiar los campos después de actualizar
      nameController.clear();
      descriptionController.clear();
      setState(() {
        selectedCategory = null;
      });
      Navigator.pop(context);
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Error al actualizar el residuo.",
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
      print("Error al actualizar el residuo: $e");
    }
  }

  // Método para desactivar el residuo
  Future<void> _deactivateWaste() async {
    try {
      await _wasteService.deactivateWaste(widget
          .waste.id); // Usar el servicio de Waste para desactivar el residuo

      Fluttertoast.showToast(
        msg: "Residuo desactivado exitosamente.",
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );
      Navigator.pop(context);
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Error al desactivar el residuo.",
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
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
              _buildActionButtons(),
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
        text: "Editar Residuo",
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

  // Método para los botones de actualizar y desactivar
  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: CustomElevatedButton(
            onPressed:
                _updateWaste, // Llamada al método para actualizar el residuo
            text: "Actualizar",
          ),
        ),
        SizedBox(width: 24.h),
        Expanded(
          child: CustomElevatedButton(
            buttonStyle: CustomButtonStyles.fillRedTL4,
            onPressed:
                _deactivateWaste, // Llamada al método para desactivar el residuo
            text: "Desactivar",
          ),
        ),
      ],
    );
  }
}
