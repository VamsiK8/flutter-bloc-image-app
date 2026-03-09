import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_bloc_app/features/products/data/datasources/product_remote_data_source.dart';
import 'package:image_bloc_app/features/products/data/repositories/product_repository_impl.dart';
import 'package:image_bloc_app/features/products/domain/usecases/get_products.dart';
import 'package:image_bloc_app/features/products/presentation/bloc/product_bloc.dart';
import 'package:image_bloc_app/features/products/presentation/bloc/product_event.dart';
import 'package:image_bloc_app/features/products/presentation/screens/product_list_screen.dart';
import 'package:image_bloc_app/core/firebase/firebase_notification_service.dart';
import 'package:image_bloc_app/firebase_options.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("Background message: ${message.messageId}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseNotificationService().init();

    final remoteDataSource = ProductRemoteDataSource();
    final repository = ProductRepositoryImpl(remoteDataSource);
    final usecase = GetProducts(repository);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => ProductBloc(usecase)..add(FetchProducts()),
        child: const ProductListScreen(),
      ),
    );
  }
}
