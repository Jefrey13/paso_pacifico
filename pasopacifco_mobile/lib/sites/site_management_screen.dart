import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pasopacifco_mobile/core/app_export.dart';
import 'package:pasopacifco_mobile/routes/app_routes.dart';
import 'package:pasopacifco_mobile/sites/models/Site.dart';
import 'package:pasopacifco_mobile/sites/services/location_service.dart';
import 'package:pasopacifco_mobile/sites/services/site_service.dart';
import 'package:pasopacifco_mobile/sites/widgets/management_elements_widget.dart';
import 'package:pasopacifco_mobile/theme/custom_button_style.dart';
import 'package:pasopacifco_mobile/theme/custom_text_style.dart';
import 'package:pasopacifco_mobile/widgets/custom_elevated_button.dart';

class SiteManagementScreen extends StatefulWidget {
  SiteManagementScreen({Key? key}) : super(key: key);

  @override
  _SiteManagementScreenState createState() => _SiteManagementScreenState();
}

class _SiteManagementScreenState extends State<SiteManagementScreen> {
  final SiteService _siteService = SiteService();
  final LocationService _locationService =
      LocationService(); // Para buscar nombres
  List<Site> _sites = [];
  Map<String, String> _departmentNames =
      {}; // Cache de nombres de departamentos
  Map<String, String> _municipalityNames = {}; // Cache de nombres de municipios
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchSites();
  }

  /// Método para obtener sitios activos y sus nombres
  Future<void> _fetchSites() async {
    setState(() => _isLoading = true);
    try {
      final sites = await _siteService.getAllActiveSites();
      await _loadDepartmentAndMunicipalityNames(sites);

      setState(() {
        _sites = sites;
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
      Fluttertoast.showToast(
        msg: "Error al cargar sitios: $e",
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
        gravity: ToastGravity.BOTTOM,
      );
    }
  }

  /// Método para cargar nombres de departamentos y municipios
  Future<void> _loadDepartmentAndMunicipalityNames(List<Site> sites) async {
    for (var site in sites) {
      if (!_departmentNames.containsKey(site.departmentId)) {
        try {
          final department =
              await _locationService.getDepartmentById(site.departmentId);
          _departmentNames[site.departmentId] = department.name;
        } catch (e) {
          _departmentNames[site.departmentId] = "Desconocido";
        }
      }
      if (!_municipalityNames.containsKey(site.municipalityId)) {
        try {
          final municipality =
              await _locationService.getMunicipalityById(site.municipalityId);
          _municipalityNames[site.municipalityId] = municipality.name;
        } catch (e) {
          _municipalityNames[site.municipalityId] = "Desconocido";
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppbar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Column(
            children: [
              _buildAgregar(context),
              SizedBox(height: 22.0),
              _isLoading
                  ? Center(child: CircularProgressIndicator())
                  : _buildListView(),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppbar() {
    return AppBar(
      title: Text("Gestión de sitios"),
      centerTitle: true,
    );
  }

  Widget _buildAgregar(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: CustomElevatedButton(
        height: 36.h,
        width: 100.h,
        buttonStyle: CustomButtonStyles.fillPrimaryTL10,
        buttonTextStyle:
            CustomTextStyles.bodyMediumLeagueSpartanOnPrimaryContainer,
        alignment: Alignment.centerRight,
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.addSiteLocationScreen)
              .then((_) {
            // Refrescar datos después de regresar de la pantalla de creación
            _fetchSites();
          });
        },
        text: "Agregar Sitio",
      ),
    );
  }

  Widget _buildListView() {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(height: 14.0),
        itemCount: _sites.length,
        itemBuilder: (context, index) {
          final site = _sites[index];
          return ManagementElementsWidget(
            site: site,
            departmentName:
                _departmentNames[site.departmentId] ?? "Desconocido",
            municipalityName:
                _municipalityNames[site.municipalityId] ?? "Desconocido",
            onSiteEdited: _fetchSites,
          );
        },
      ),
    );
  }
}
