// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'postal_code_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchPostalCodeApiResponseHash() =>
    r'0658c36ea330eb834d00aa35cf8bdb2c10908017';

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

/// See also [fetchPostalCodeApiResponse].
@ProviderFor(fetchPostalCodeApiResponse)
const fetchPostalCodeApiResponseProvider = FetchPostalCodeApiResponseFamily();

/// See also [fetchPostalCodeApiResponse].
class FetchPostalCodeApiResponseFamily
    extends Family<AsyncValue<PostalCodeApiResponse>> {
  /// See also [fetchPostalCodeApiResponse].
  const FetchPostalCodeApiResponseFamily();

  /// See also [fetchPostalCodeApiResponse].
  FetchPostalCodeApiResponseProvider call(
    int postalCode,
  ) {
    return FetchPostalCodeApiResponseProvider(
      postalCode,
    );
  }

  @override
  FetchPostalCodeApiResponseProvider getProviderOverride(
    covariant FetchPostalCodeApiResponseProvider provider,
  ) {
    return call(
      provider.postalCode,
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
  String? get name => r'fetchPostalCodeApiResponseProvider';
}

/// See also [fetchPostalCodeApiResponse].
class FetchPostalCodeApiResponseProvider
    extends AutoDisposeFutureProvider<PostalCodeApiResponse> {
  /// See also [fetchPostalCodeApiResponse].
  FetchPostalCodeApiResponseProvider(
    int postalCode,
  ) : this._internal(
          (ref) => fetchPostalCodeApiResponse(
            ref as FetchPostalCodeApiResponseRef,
            postalCode,
          ),
          from: fetchPostalCodeApiResponseProvider,
          name: r'fetchPostalCodeApiResponseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchPostalCodeApiResponseHash,
          dependencies: FetchPostalCodeApiResponseFamily._dependencies,
          allTransitiveDependencies:
              FetchPostalCodeApiResponseFamily._allTransitiveDependencies,
          postalCode: postalCode,
        );

  FetchPostalCodeApiResponseProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.postalCode,
  }) : super.internal();

  final int postalCode;

  @override
  Override overrideWith(
    FutureOr<PostalCodeApiResponse> Function(
            FetchPostalCodeApiResponseRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchPostalCodeApiResponseProvider._internal(
        (ref) => create(ref as FetchPostalCodeApiResponseRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        postalCode: postalCode,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<PostalCodeApiResponse> createElement() {
    return _FetchPostalCodeApiResponseProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchPostalCodeApiResponseProvider &&
        other.postalCode == postalCode;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, postalCode.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchPostalCodeApiResponseRef
    on AutoDisposeFutureProviderRef<PostalCodeApiResponse> {
  /// The parameter `postalCode` of this provider.
  int get postalCode;
}

class _FetchPostalCodeApiResponseProviderElement
    extends AutoDisposeFutureProviderElement<PostalCodeApiResponse>
    with FetchPostalCodeApiResponseRef {
  _FetchPostalCodeApiResponseProviderElement(super.provider);

  @override
  int get postalCode =>
      (origin as FetchPostalCodeApiResponseProvider).postalCode;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
