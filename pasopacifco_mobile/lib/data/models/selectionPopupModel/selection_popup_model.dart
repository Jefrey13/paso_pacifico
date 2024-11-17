class SelectionPopupModel {
  final String? id;
  final String title;
  final dynamic value;
  bool isSelected;

  SelectionPopupModel({
    this.id,
    required this.title,
    this.value,
    this.isSelected = false,
  });
}
