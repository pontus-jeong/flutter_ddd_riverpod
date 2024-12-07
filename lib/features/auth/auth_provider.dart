import 'package:example/config/providers.dart';
import 'package:example/features/auth/infrastructure/datasources/local/auth_token_local_data_source.dart';
import 'package:example/features/auth/infrastructure/repositories/auth_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

///
/// Infrastructure dependencies
///
@riverpod
AuthRepository authRepository(Ref ref) {
  final authClient = ref.watch(supabaseClientProvider).auth;
  final prefs = ref.read(sharedPreferencesProvider).valueOrNull;
  if (prefs == null) {
    throw 'Shared preferences not initialized';
  }
  return AuthRepository(
    AuthTokenLocalDataSource(
      prefs,
    ),
    authClient,
  );
}

///
/// Application dependencies
///

/// Provides a [ValueNotifier] to the app router to redirect on auth state change
final authStateListenable = ValueNotifier<bool>(false);
