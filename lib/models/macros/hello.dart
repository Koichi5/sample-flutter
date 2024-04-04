import 'package:macros/macros.dart';
import 'package:_fe_analyzer_shared/src/macros/api.dart';

macro class Hello implements ClassDeclarationsMacro {
  const Hello();

  @override
void buildDeclarationsForClass(ClassDeclaration clazz, MemberDeclarationBuilder builder) {
  builder.declareInType(DeclarationCode.fromParts([
    'void greet() {',
    "  print('Hello, World!');",
    '}'
  ]));
}
}