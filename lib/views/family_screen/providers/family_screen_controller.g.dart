// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'family_screen_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$familyScreenControllerHash() =>
    r'c08cbdb883fbaf8e4a6846bd692bdfef1573b7a6';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [familyScreenController].
@ProviderFor(familyScreenController)
const familyScreenControllerProvider = FamilyScreenControllerFamily();

/// See also [familyScreenController].
class FamilyScreenControllerFamily extends Family<int> {
  /// See also [familyScreenController].
  const FamilyScreenControllerFamily();

  /// See also [familyScreenController].
  FamilyScreenControllerProvider call(
    int num1,
    int num2,
  ) {
    return FamilyScreenControllerProvider(
      num1,
      num2,
    );
  }

  @override
  FamilyScreenControllerProvider getProviderOverride(
    covariant FamilyScreenControllerProvider provider,
  ) {
    return call(
      provider.num1,
      provider.num2,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'familyScreenControllerProvider';
}

/// See also [familyScreenController].
class FamilyScreenControllerProvider extends AutoDisposeProvider<int> {
  /// See also [familyScreenController].
  FamilyScreenControllerProvider(
    int num1,
    int num2,
  ) : this._internal(
          (ref) => familyScreenController(
            ref as FamilyScreenControllerRef,
            num1,
            num2,
          ),
          from: familyScreenControllerProvider,
          name: r'familyScreenControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$familyScreenControllerHash,
          dependencies: FamilyScreenControllerFamily._dependencies,
          allTransitiveDependencies:
              FamilyScreenControllerFamily._allTransitiveDependencies,
          num1: num1,
          num2: num2,
        );

  FamilyScreenControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.num1,
    required this.num2,
  }) : super.internal();

  final int num1;
  final int num2;

  @override
  Override overrideWith(
    int Function(FamilyScreenControllerRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FamilyScreenControllerProvider._internal(
        (ref) => create(ref as FamilyScreenControllerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        num1: num1,
        num2: num2,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<int> createElement() {
    return _FamilyScreenControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FamilyScreenControllerProvider &&
        other.num1 == num1 &&
        other.num2 == num2;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, num1.hashCode);
    hash = _SystemHash.combine(hash, num2.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FamilyScreenControllerRef on AutoDisposeProviderRef<int> {
  /// The parameter `num1` of this provider.
  int get num1;

  /// The parameter `num2` of this provider.
  int get num2;
}

class _FamilyScreenControllerProviderElement
    extends AutoDisposeProviderElement<int> with FamilyScreenControllerRef {
  _FamilyScreenControllerProviderElement(super.provider);

  @override
  int get num1 => (origin as FamilyScreenControllerProvider).num1;
  @override
  int get num2 => (origin as FamilyScreenControllerProvider).num2;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
