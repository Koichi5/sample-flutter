// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_compress_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$imageCompressHash() => r'ecb5cde5b2cf1ec44b6c54131b961dcdfc0698b0';

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

/// See also [imageCompress].
@ProviderFor(imageCompress)
const imageCompressProvider = ImageCompressFamily();

/// See also [imageCompress].
class ImageCompressFamily extends Family<AsyncValue<Uint8List>> {
  /// See also [imageCompress].
  const ImageCompressFamily();

  /// See also [imageCompress].
  ImageCompressProvider call(
    Uint8List file,
  ) {
    return ImageCompressProvider(
      file,
    );
  }

  @override
  ImageCompressProvider getProviderOverride(
    covariant ImageCompressProvider provider,
  ) {
    return call(
      provider.file,
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
  String? get name => r'imageCompressProvider';
}

/// See also [imageCompress].
class ImageCompressProvider extends AutoDisposeFutureProvider<Uint8List> {
  /// See also [imageCompress].
  ImageCompressProvider(
    Uint8List file,
  ) : this._internal(
          (ref) => imageCompress(
            ref as ImageCompressRef,
            file,
          ),
          from: imageCompressProvider,
          name: r'imageCompressProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$imageCompressHash,
          dependencies: ImageCompressFamily._dependencies,
          allTransitiveDependencies:
              ImageCompressFamily._allTransitiveDependencies,
          file: file,
        );

  ImageCompressProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.file,
  }) : super.internal();

  final Uint8List file;

  @override
  Override overrideWith(
    FutureOr<Uint8List> Function(ImageCompressRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ImageCompressProvider._internal(
        (ref) => create(ref as ImageCompressRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        file: file,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Uint8List> createElement() {
    return _ImageCompressProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ImageCompressProvider && other.file == file;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, file.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ImageCompressRef on AutoDisposeFutureProviderRef<Uint8List> {
  /// The parameter `file` of this provider.
  Uint8List get file;
}

class _ImageCompressProviderElement
    extends AutoDisposeFutureProviderElement<Uint8List> with ImageCompressRef {
  _ImageCompressProviderElement(super.provider);

  @override
  Uint8List get file => (origin as ImageCompressProvider).file;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
