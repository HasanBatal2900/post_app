import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/network/network_info.dart';
import 'features/posts/data/datasources/post_local_data_source.dart';
import 'features/posts/data/datasources/post_remote_data_source.dart';
import 'features/posts/data/repositories/post_repostory_imp.dart';
import 'features/posts/domain/repositories/post_repo.dart';
import 'features/posts/domain/usecases/add_post_usecase.dart';
import 'features/posts/domain/usecases/delete_post_usecase.dart';
import 'features/posts/domain/usecases/get_all_post_case.dart';
import 'features/posts/domain/usecases/update_post_usecase.dart';
import 'features/posts/presentation/bloc/post_operations/post_opreations_bloc.dart';
import 'features/posts/presentation/bloc/posts/posts_bloc.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  // Extra
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => InternetConnectionChecker());
// core
  sl.registerLazySingleton<NetworkInfoImb>(() => NetworkInfoImb(sl<InternetConnectionChecker>()));

// Data Sources

  sl.registerLazySingleton<PostRemoteDataSourceImp>(() => PostRemoteDataSourceImp());
  sl.registerLazySingleton<PostLocalDataSourceImp>(
      () => PostLocalDataSourceImp(sharedPreferences: sl<SharedPreferences>()));
//! repostory

  sl.registerLazySingleton<PostRepository>(() => PostRepositoryImp(
      networkInfoImb: sl<NetworkInfoImb>(),
      postLocalDataSourceImp: sl<PostLocalDataSourceImp>(),
      postRemoteDataSourceImp: sl<PostRemoteDataSourceImp>()));

// ! Use Cases
  sl.registerLazySingleton<AddPostUseCase>(
      () => AddPostUseCase(repostory: sl<PostRepository>()));
  sl.registerLazySingleton<DeletePostUseCase>(
      () => DeletePostUseCase(repostory: sl<PostRepository>()));
  sl.registerLazySingleton<UpdatePostUseCase>(
      () => UpdatePostUseCase(repostory: sl<PostRepository>()));
  sl.registerLazySingleton<GetAllPostsUseCase>(
      () => GetAllPostsUseCase(repostory: sl<PostRepository>()));

//? Blocs

  sl.registerFactory<PostsBloc>(() => PostsBloc(getAllPosts: sl()));
  sl.registerFactory<PostOpreationsBloc>(() =>
      PostOpreationsBloc(addPost: sl<AddPostUseCase>(), deletePost: sl<DeletePostUseCase>(), updatePost: sl<UpdatePostUseCase>()));
}
