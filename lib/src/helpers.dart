import 'package:analyzer/dart/element/element.dart';

bool isGetter(FieldElement element) {
  return element.setter == null;
}

bool isInt(FieldElement element) {
  return element.declaration.type.isDartCoreInt;
}
