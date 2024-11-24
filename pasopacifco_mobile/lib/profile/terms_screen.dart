import 'package:flutter/material.dart';
import 'package:pasopacifco_mobile/core/app_export.dart';
import 'package:pasopacifco_mobile/widgets/app_bar/appbar_title.dart';
import 'package:pasopacifco_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:pasopacifco_mobile/widgets/app_bar/app_bar_leading_iconbutton.dart';
import 'package:pasopacifco_mobile/profile/services/policy_services.dart';

class TermsScreen extends StatefulWidget {
  TermsScreen({Key? key}) : super(key: key);

  @override
  _TermsScreenState createState() => _TermsScreenState();
}

class _TermsScreenState extends State<TermsScreen> {
  final TermsService _termsService = TermsService();

  Map<String, String>? _termsData;
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _loadTerms();
  }

  Future<void> _loadTerms() async {
    try {
      final terms = await _termsService.fetchTermsAndConditions();
      setState(() {
        _termsData = terms;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppbar(context),
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImageConstant.Logo),
              fit: BoxFit.cover,
            ),
          ),
          child: _isLoading
              ? Center(child: CircularProgressIndicator())
              : _errorMessage != null
                  ? Center(
                      child: Text(
                        _errorMessage!,
                        style: CustomTextStyles.bodyMediumErrorContainer,
                        textAlign: TextAlign.center,
                      ),
                    )
                  : _buildTermsContent(),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppbar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 62.h,
      leading: AppbarLeadingIconButton(
        imagePath: ImageConstant.arrowBack,
        margin: EdgeInsets.only(
          left: 20.h,
          top: 7.h,
          bottom: 7.h,
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
      title: AppbarTitle(
        text: "Términos y Condiciones",
        margin: EdgeInsets.only(right: 48.h),
      ),
    );
  }

  Widget _buildTermsContent() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSection("Bienvenida", _termsData?['welcome']),
          _buildSection("Protección de la privacidad", _termsData?['privacy']),
          _buildSection("Uso de la aplicación", _termsData?['usage']),
          _buildSection("Participación voluntaria", _termsData?['voluntary']),
          _buildSection("Responsabilidades del voluntario",
              _termsData?['responsibility']),
          _buildSection(
              "Exoneración de responsabilidad", _termsData?['exoneration']),
          _buildSection("Actualización de políticas", _termsData?['updates']),
        ],
      ),
    );
  }

  Widget _buildSection(String title, String? content) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.h),
            ),
            child: Text(
              title,
              style: CustomTextStyles.bodyMediumBluegray900.copyWith(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            content ?? "Información no disponible",
            style: CustomTextStyles.bodyMediumBluegray900,
          ),
        ],
      ),
    );
  }
}
