import 'package:flutter/material.dart';
import 'package:pasopacifco_mobile/core/app_export.dart';
import 'package:pasopacifco_mobile/profile/models/UserProfile.dart';
import 'package:pasopacifco_mobile/profile/services/user_service.dart';
import 'package:pasopacifco_mobile/widgets/app_bar/appbar_title.dart';
import 'package:pasopacifco_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:pasopacifco_mobile/widgets/app_bar/app_bar_leading_iconbutton.dart';
import 'package:pasopacifco_mobile/widgets/custom_text_form_field.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final UserService _userService = UserService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;

  bool isEditingName = false;
  bool isEditingEmail = false;
  bool isEditingPhone = false;

  UserProfile? userProfile;

  @override
  void initState() {
    super.initState();
    _loadUserProfile();
  }

  Future<void> _loadUserProfile() async {
    try {
      final profile = await _userService.getUserProfile();

      setState(() {
        userProfile = profile;
        nameController = TextEditingController(text: profile.displayName);
        emailController = TextEditingController(text: profile.email);
        phoneController = TextEditingController(text: profile.phoneNumber);
      });
    } catch (e) {
      _showError("Error: " + e.toString());
    }
  }

  Future<void> _updateUserProfile(String field, String value) async {
    try {
      if (field == 'displayName') {
        await _userService.updateUserName(value);
        setState(() => userProfile?.displayName = value);
      } else if (field == 'email') {
        await _userService.updateUserEmail(value);
        setState(() => userProfile?.email = value);
      } else if (field == 'phoneNumber') {
        await _userService.updateUserPhone(value);
        setState(() => userProfile?.phoneNumber = value);
      }
    } catch (e) {
      _showError(e.toString());
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  Widget _buildEditableField({
    required String label,
    required TextEditingController controller,
    required bool isEditing,
    required Function onSave,
    required VoidCallback toggleEditMode,
  }) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: CustomTextStyles.bodyMediumGray60001),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller,
                  enabled: isEditing,
                  style: CustomTextStyles.bodyMediumOnPrimary,
                  decoration: InputDecoration(
                    border: TextFormFieldStyleHelper.underLineGray,
                    contentPadding: EdgeInsets.only(top: 8.h, bottom: 8.h),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(isEditing ? Icons.check : Icons.edit,
                    color: appTheme.lime600),
                onPressed: isEditing
                    ? () {
                        onSave();
                        toggleEditMode();
                      }
                    : toggleEditMode,
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppbar(context),
        body: userProfile == null
            ? Center(child: CircularProgressIndicator())
            : Form(
                key: _formKey,
                child: SingleChildScrollView(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.h, vertical: 20.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 45.h,
                        backgroundImage:
                            AssetImage(ImageConstant.image_not_found),
                      ),
                      SizedBox(height: 10.h),
                      Text(userProfile!.displayName,
                          style: CustomTextStyles.titleSmallOnPrimary),
                      SizedBox(height: 5.h),
                      Text("Cordinador",
                          style: CustomTextStyles.bodyMediumGray60001_1),
                      SizedBox(height: 30.h),
                      _buildEditableField(
                        label: "Nombre Completo",
                        controller: nameController,
                        isEditing: isEditingName,
                        toggleEditMode: () =>
                            setState(() => isEditingName = !isEditingName),
                        onSave: () async {
                          await _updateUserProfile(
                              'displayName', nameController.text);
                        },
                      ),
                      SizedBox(height: 20.h),
                      _buildEditableField(
                        label: "Correo Electrónico",
                        controller: emailController,
                        isEditing: isEditingEmail,
                        toggleEditMode: () =>
                            setState(() => isEditingEmail = !isEditingEmail),
                        onSave: () async {
                          await _updateUserProfile(
                              'email', emailController.text);
                        },
                      ),
                      SizedBox(height: 20.h),
                      _buildEditableField(
                        label: "Número de Teléfono",
                        controller: phoneController,
                        isEditing: isEditingPhone,
                        toggleEditMode: () =>
                            setState(() => isEditingPhone = !isEditingPhone),
                        onSave: () async {
                          await _updateUserProfile(
                              'phoneNumber', phoneController.text);
                        },
                      ),
                      SizedBox(height: 22.h),
                      Text(
                        "Se unió el 17 de octubre de 2024",
                        style: CustomTextStyles.bodySmallRobotoGray60001,
                      ),
                    ],
                  ),
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
        onTap: () => Navigator.pop(context),
      ),
      centerTitle: true,
      title: AppbarTitle(text: "Mi Perfil"),
    );
  }
}
