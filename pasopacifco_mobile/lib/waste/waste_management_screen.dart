import 'package:flutter/material.dart';
import 'package:pasopacifco_mobile/core/app_export.dart';
import 'package:pasopacifco_mobile/routes/app_routes.dart';
import 'package:pasopacifco_mobile/theme/custom_button_style.dart';
import 'package:pasopacifco_mobile/waste/models/Category.dart';
import 'package:pasopacifco_mobile/widgets/app_bar/appbar_title.dart';
import 'package:pasopacifco_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:pasopacifco_mobile/widgets/custom_checkbox_button.dart';
import 'package:pasopacifco_mobile/widgets/custom_drop_dowm.dart';
import 'package:pasopacifco_mobile/widgets/custom_elevated_button.dart';
import 'package:pasopacifco_mobile/widgets/custom_search_view.dart';
import 'package:pasopacifco_mobile/widgets/custom_text_form_field.dart';
import 'package:pasopacifco_mobile/widgets/app_bar/app_bar_leading_iconbutton.dart';
import 'package:pasopacifco_mobile/waste/models/Waste.dart';
import 'package:pasopacifco_mobile/waste/services/waste_service.dart';
import 'package:pasopacifco_mobile/waste/services/category_service.dart';

class WasteManagementScreen extends StatefulWidget {
  WasteManagementScreen({Key? key}) : super(key: key);

  @override
  _WasteManagementScreenState createState() => _WasteManagementScreenState();
}

class _WasteManagementScreenState extends State<WasteManagementScreen> {
  TextEditingController searchController = TextEditingController();
  final WasteService _wasteService = WasteService();
  final CategoryService _categoryService = CategoryService();
  List<Waste> wastes = [];
  List<Waste> filteredWastes = [];
  Map<String, String> wasteCategories = {};

  @override
  void initState() {
    super.initState();
    _fetchWastes();
    searchController.addListener(_filterWastes);
  }

  // Fetch the active wastes from Firestore
  Future<void> _fetchWastes() async {
    try {
      final activeWastes = await _wasteService.getAllActiveWastes();
      setState(() {
        wastes = activeWastes;
        filteredWastes = wastes;
      });

      for (var waste in wastes) {
        String categoryName = await _getCategoryName(waste.category);
        setState(() {
          wasteCategories[waste.category] = categoryName;
        });
      }
    } catch (e) {
      print("Error fetching wastes: $e");
    }
  }

  // Get category name by categoryId using the CategoryService
  Future<String> _getCategoryName(String categoryId) async {
    try {
      Category category = await _categoryService.getCategoryById(categoryId);
      return category.name;
    } catch (e) {
      print("Error fetching category: $e");
      return "Categoría no encontrada";
    }
  }

  // Filter the wastes based on the search input
  void _filterWastes() {
    String query = searchController.text.toLowerCase();
    setState(() {
      filteredWastes = wastes.where((waste) {
        return waste.name.toLowerCase().contains(query);
      }).toList();
    });
  }

  // This function will be called when the user returns from the Edit screen
  void _onWasteEdited() {
    // Refresh the list of wastes after editing
    _fetchWastes();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppbar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(left: 8.h, top: 16.h, right: 8.h),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              _buildSearchField(),
              SizedBox(height: 24.h),
              _buildAddWasteButton(context),
              SizedBox(height: 12.h),
              _buildWasteList(),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppbar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 62.h,
      leading: AppbarLeadingIconButton(
        imagePath: ImageConstant.arrowBack,
        margin: EdgeInsets.only(left: 20.h, top: 7.h, bottom: 7.h),
        onTap: () {},
      ),
      centerTitle: true,
      title: AppbarTitle(
        text: "Gestión de residuos",
      ),
    );
  }

  // Build the search field
  Widget _buildSearchField() {
    return Padding(
      padding: EdgeInsets.only(left: 4.h),
      child: CustomSearchView(
        controller: searchController,
        hintText: "Buscar residuo de limpieza",
        contentPadding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 14.h),
      ),
    );
  }

  // Build the button to navigate to the 'AddWasteScreen'
  Widget _buildAddWasteButton(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, AppRoutes.addWasteScreen);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Lista de residuos",
                style: theme.textTheme.titleMedium,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.addWasteScreen);
              },
              constraints: BoxConstraints(minHeight: 50.h, minWidth: 50.h),
              padding: EdgeInsets.all(0),
              icon: SizedBox(
                width: 50.h,
                height: 50.h,
                child: CustomImageView(
                  imagePath: ImageConstant.button,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // Build the waste list with dynamic data
  Widget _buildWasteList() {
    return SizedBox(
      width: 342.h,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: appTheme.gray400, width: 1.h),
            ),
            width: double.maxFinite,
            child: Row(
              children: [
                Expanded(
                  child: CustomElevatedButton(
                    height: 48.h,
                    text: "Nombre",
                    buttonStyle: CustomButtonStyles.fillGray,
                    buttonTextStyle: theme.textTheme.titleSmall,
                  ),
                ),
                Expanded(
                  child: CustomElevatedButton(
                    height: 48.h,
                    text: "Categoria",
                    buttonStyle: CustomButtonStyles.fillGray,
                    buttonTextStyle: theme.textTheme.titleSmall,
                  ),
                )
              ],
            ),
          ),
          if (filteredWastes.isNotEmpty)
            Column(
              children: filteredWastes.map((waste) {
                return _buildWasteRow(waste);
              }).toList(),
            )
          else
            Center(
              child: Text(
                "No se encontraron residuos.",
                style: theme.textTheme.bodyMedium,
              ),
            ),
        ],
      ),
    );
  }

  // Build each row for the waste
  Widget _buildWasteRow(Waste waste) {
    return GestureDetector(
      onTap: () => _navigateToEditWasteScreen(waste),
      child: Container(
        decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(color: appTheme.gray400, width: 1.h)),
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 16.h, top: 14.h, bottom: 14.h),
                child: Text(
                  waste.name,
                  style: theme.textTheme.bodyMedium,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 14.h),
                child: Text(
                  wasteCategories[waste.category] ?? "Cargando...",
                  style: CustomTextStyles.bodyMediumPrimary_1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Navigate to the edit waste screen with the selected waste
  void _navigateToEditWasteScreen(Waste waste) {
    Navigator.pushNamed(
      context,
      AppRoutes.editWasteScreen,
      arguments: waste,
    ).then((_) {
      _onWasteEdited(); // Refresh data after returning from the edit screen
    });
  }
}
