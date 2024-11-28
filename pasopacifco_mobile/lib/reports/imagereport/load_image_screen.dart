import 'package:flutter/material.dart';
import 'package:pasopacifco_mobile/core/app_export.dart';
import 'package:pasopacifco_mobile/reports/widgets/management_report_element_widget.dart';
import 'package:pasopacifco_mobile/routes/app_routes.dart';
import 'package:pasopacifco_mobile/sites/widgets/management_elements_widget.dart';
import 'package:pasopacifco_mobile/theme/custom_button_style.dart';
import 'package:pasopacifco_mobile/widgets/app_bar/appbar_title.dart';
import 'package:pasopacifco_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:pasopacifco_mobile/widgets/custom_checkbox_button.dart';
import 'package:pasopacifco_mobile/widgets/custom_drop_dowm.dart';
import 'package:pasopacifco_mobile/widgets/custom_elevated_button.dart';
import 'package:pasopacifco_mobile/widgets/custom_text_form_field.dart';
import 'package:pasopacifco_mobile/widgets/app_bar/app_bar_leading_iconbutton.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:open_filex/open_filex.dart';

class LoadImageScreen extends StatelessWidget {
  LoadImageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppbar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 16.h,
            vertical: 156.h,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 16.h),
              Container(
                width: double.maxFinite,
                margin: EdgeInsets.only(
                  left: 52.h,
                  right: 60.h,
                ),
                padding: EdgeInsets.symmetric(vertical: 10.h),
                decoration: BoxDecoration(
                  color: theme.colorScheme.onPrimaryContainer,
                  borderRadius: BorderRadiusStyle.roundedBorder6,
                  border: Border.all(
                    color: appTheme.gray500,
                    width: 1.h,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.image_not_found,
                      height: 48.h,
                      width: 54.h,
                    ),
                    SizedBox(height: 6.h),
                    SizedBox(
                      width: 40.h,
                      child: Text(
                        "Cargar Imagen",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style:
                            CustomTextStyles.bodyMediumJaldiIndigo900.copyWith(
                          height: 1.36,
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                  ],
                ),
              ),
              Spacer(),
              CustomElevatedButton(
                text: "Finalizar Registro",
                margin: EdgeInsets.only(right: 4.h),
                onPressed: () async {
                  await generateAndOpenPDF(context);
                },
              ),
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
        margin: EdgeInsets.only(
          left: 20.h,
          top: 7.h,
          bottom: 7.h,
        ),
        onTap: () {},
      ),
      centerTitle: true,
      title: AppbarTitle(
        text: "Agregar Imagen",
        margin: EdgeInsets.only(right: 96.h),
      ),
    );
  }

  // pdf
  Future<void> generateAndOpenPDF(BuildContext context) async {
    try {
      // Solicitar permisos de almacenamiento
      await requestStoragePermission();

      // Crear el documento PDF
      final pdf = pw.Document();

      // Cargar el logo desde los assets
      final Uint8List? logoImage = await loadLogo();

      // Generar el contenido del reporte
      pdf.addPage(
        pw.MultiPage(
          margin: pw.EdgeInsets.all(32),
          header: (pw.Context context) => buildHeader(logoImage),
          footer: (pw.Context context) => buildFooter(context.pageNumber),
          build: (pw.Context context) => [
            // Título principal
            pw.Text(
              'Resumen de Limpieza',
              style: pw.TextStyle(
                fontSize: 18,
                fontWeight: pw.FontWeight.bold,
              ),
              textAlign: pw.TextAlign.center,
            ),
            pw.SizedBox(height: 16),

            // Sección: Objetos más extraños recogidos
            pw.Text(
              'Objetos más Extraños Recogidos:',
              style: pw.TextStyle(
                fontSize: 14,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
            pw.Bullet(text: 'Tubos.'),
            pw.Bullet(text: 'Guantes de Latex.'),
            pw.Divider(),
            pw.SizedBox(height: 16),

            // Sección: Objetos más comúnmente encontrados (tabla)
            pw.Text(
              'Objetos Más Comúnmente Encontrados',
              style: pw.TextStyle(
                fontSize: 14,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
            pw.SizedBox(height: 8),
            buildTable([
              {'Objeto': 'Colillas de cigarrillo', 'Cantidad': '60'},
              {'Objeto': 'Tapas', 'Cantidad': '56'},
              {'Objeto': 'Popotes', 'Cantidad': '90'},
              {'Objeto': 'Tenedores', 'Cantidad': '60'},
              {'Objeto': 'Corcholatas', 'Cantidad': '63'},
            ]),
          ],
        ),
      );

      // Obtener el directorio donde guardar el archivo
      final directory = await getStorageDirectory();
      final folderPath = '${directory.path}/ReportesPDF';
      final folder = Directory(folderPath);

      // Crear la carpeta si no existe
      if (!await folder.exists()) {
        await folder.create(recursive: true);
      }

      // Generar un nombre de archivo único
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final filePath = '$folderPath/reporte_$timestamp.pdf';

      // Guardar el archivo PDF
      final file = File(filePath);
      await file.writeAsBytes(await pdf.save());

      // Abrir el archivo automáticamente
      await OpenFilex.open(filePath);
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al generar o abrir el PDF: $e')),
      );
    }
  }

  Future<void> requestStoragePermission() async {
    var status = await Permission.storage.status;

    if (!status.isGranted) {
      status = await Permission.storage.request();

      if (status.isPermanentlyDenied) {
        throw Exception(
            "Permisos de almacenamiento denegados permanentemente.");
      }
    }

    if (!status.isGranted) {
      throw Exception("Permiso de almacenamiento denegado.");
    }
  }

  Future<Directory> getStorageDirectory() async {
    // Usar almacenamiento externo si está disponible, de lo contrario, interno
    if (Platform.isAndroid) {
      return await getExternalStorageDirectory() ??
          await getApplicationDocumentsDirectory();
    } else {
      return await getApplicationDocumentsDirectory();
    }
  }

  Future<Uint8List?> loadLogo() async {
    // Reemplazar por tu método real para cargar el logo desde los assets
    try {
      final logoFile = File('assets/logo_paso_pacifico.png'); // Path del logo
      return await logoFile.readAsBytes();
    } catch (e) {
      print('Error al cargar el logo: $e');
      return null;
    }
  }

  pw.Widget buildHeader(Uint8List? logoImage) {
    return pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
      children: [
        if (logoImage != null)
          pw.Image(
            pw.MemoryImage(logoImage),
            width: 50,
            height: 50,
          ),
        pw.Text(
          'Reporte de Basura Marina',
          style: pw.TextStyle(
            fontSize: 18,
            fontWeight: pw.FontWeight.bold,
          ),
        ),
        pw.Text(
          DateTime.now().toLocal().toString().split(' ')[0],
          style: pw.TextStyle(fontSize: 12),
        ),
      ],
    );
  }

  pw.Widget buildFooter(int pageNumber) {
    return pw.Align(
      alignment: pw.Alignment.centerRight,
      child: pw.Text(
        'Página $pageNumber',
        style: pw.TextStyle(fontSize: 12),
      ),
    );
  }

  pw.Widget buildTable(List<Map<String, String>> data) {
    return pw.Table(
      border: pw.TableBorder.all(),
      columnWidths: {
        0: pw.FlexColumnWidth(3),
        1: pw.FlexColumnWidth(1),
      },
      children: [
        // Cabecera de la tabla
        pw.TableRow(
          decoration: pw.BoxDecoration(color: PdfColors.grey300),
          children: [
            pw.Padding(
              padding: pw.EdgeInsets.all(8),
              child: pw.Text(
                'Objeto',
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
              ),
            ),
            pw.Padding(
              padding: pw.EdgeInsets.all(8),
              child: pw.Text(
                'Cantidad',
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
              ),
            ),
          ],
        ),
        // Filas de datos
        ...data.map((row) {
          return pw.TableRow(
            children: [
              pw.Padding(
                padding: pw.EdgeInsets.all(8),
                child: pw.Text(row['Objeto']!),
              ),
              pw.Padding(
                padding: pw.EdgeInsets.all(8),
                child: pw.Text(row['Cantidad']!),
              ),
            ],
          );
        }).toList(),
      ],
    );
  }
}
