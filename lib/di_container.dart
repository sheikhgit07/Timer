// import 'package:dio/dio.dart';
// import 'package:get_it/get_it.dart';
//
// final sl = GetIt.instance;
//
// Future<void> init() async {
//   // Core
//   //sl.registerLazySingleton(() => NetworkInfo(sl()));
//   // sl.registerLazySingleton(() => DioClient(AppConstant.baseUrl, sl(),
//   //     loggingInterceptor: sl(), sharedPreferences: sl()));
//
//   // Repository
//   sl.registerLazySingleton(
//       () => AuthRepo(dioClient: sl(), sharedPreferences: sl()));
//   sl.registerLazySingleton(() => ChatRepo(dioClient: sl()));
//   sl.registerLazySingleton(() => HomeRepo(dioClient: sl()));
//   sl.registerLazySingleton(() => SavedRepo(dioClient: sl()));
//   sl.registerLazySingleton(() => SearchRepo(dioClient: sl()));
//   sl.registerLazySingleton(() => DiscoverRepo(dioClient: sl()));
//   sl.registerLazySingleton(() => AddNewVideoRepo(dioClient: sl()));
//   sl.registerLazySingleton(() => ProfileRepo(dioClient: sl()));
//   sl.registerLazySingleton(() => SettingRepo(dioClient: sl()));
//   sl.registerLazySingleton(() => FollowFollowingRepo(dioClient: sl()));
//   sl.registerLazySingleton(() => NotificationRepo(dioClient: sl()));
//   sl.registerLazySingleton(() => SoundRepo(dioClient: sl()));
//   sl.registerLazySingleton(() => OtherUserRepo(dioClient: sl()));
//   sl.registerLazySingleton(() => PaymentRepo(dioClient: sl()));
//   // Provider
//   sl.registerFactory(() => AuthProvider(authRepo: sl()));
//   sl.registerFactory(() => QrProvider(authRepo: sl()));
//   sl.registerFactory(() => BlockUserProvider(authRepo: sl()));
//   sl.registerFactory(() => ThemeProvider(sharedPreferences: sl()));
//   sl.registerFactory(() => HomeProvider(homeRepo: sl()));
//   sl.registerFactory(() => VideoCommentsProvider(homeRepo: sl()));
//   sl.registerFactory(() => ChatProvider(messageRepo: sl()));
//   sl.registerFactory(() => SavedProvider(savedRepo: sl()));
//   sl.registerFactory(() => RepostProvider(savedRepo: sl()));
//   sl.registerFactory(() => MainSearchProvider(searchRepo: sl()));
//   sl.registerFactory(() => SearchTopProvider(searchRepo: sl()));
//   sl.registerFactory(() => SearchVideosProvider(searchRepo: sl()));
//   sl.registerFactory(() => SearchUsersProvider(searchRepo: sl()));
//   sl.registerFactory(() => SearchSoundsProvider(searchRepo: sl()));
//   sl.registerFactory(() => SearchPlacesProvider(searchRepo: sl()));
//   sl.registerFactory(() => SearchHashtagProvider(searchRepo: sl()));
//   sl.registerFactory(() => DiscoverProvider(discoverRepo: sl()));
//   sl.registerFactory(() => AddNewVideoProvider(addNewVideoRepo: sl()));
//   sl.registerFactory(() => ProfileProvider(profileRepo: sl()));
//   sl.registerFactory(() => OtherUserProfileProvider(otherUserRepo: sl()));
//   sl.registerFactory(() => SettingProvider(settingRepo: sl()));
//   sl.registerFactory(() => LanguageProvider(settingRepo: sl()));
//   sl.registerFactory(
//       () => FollowingFollowersProvider(followFollowingRepo: sl()));
//   sl.registerFactory(() => SuggestedUsersProvider(followFollowingRepo: sl()));
//   sl.registerFactory(
//       () => FollowingFollowersOtherUserProvider(followFollowingRepo: sl()));
//   sl.registerFactory(() => NotificationProvider(notificationRepo: sl()));
//   sl.registerFactory(() => SoundProvider(soundRepo: sl()));
//   sl.registerFactory(() => ShowVideoAgainstHashtagProvider(soundRepo: sl()));
//   sl.registerFactory(() => FavouriteSoundProvider(soundRepo: sl()));
//   sl.registerFactory(() => ShowAllSoundProvider(soundRepo: sl()));
//   sl.registerFactory(() => PaymentProvider(paymentRepo: sl()));
//
//   // External
//   final sharedPreferences = await SharedPreferences.getInstance();
//   sl.registerLazySingleton(() => sharedPreferences);
//   sl.registerLazySingleton(() => Dio());
//   sl.registerLazySingleton(() => LoggingInterceptor());
// }
