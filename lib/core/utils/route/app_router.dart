import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/models/article_model.dart';
import 'package:news_app/core/utils/route/app_routes.dart';
import 'package:news_app/features/favorites/cubit/favorites_cubit.dart';
import 'package:news_app/features/favorites/views/pages/favorites_page.dart';
import 'package:news_app/features/home/views/pages/article_details_page.dart';
import 'package:news_app/features/home/views/pages/home_page.dart';
import 'package:news_app/features/profile/views/pages/profile_page.dart';
import 'package:news_app/features/search/cubit/search_cubit.dart';
import 'package:news_app/features/search/views/pages/search_page.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.homeRoute:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
          settings: settings,
        );
      case AppRoutes.favoritesRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) {
              final cubit = FavoritesCubit();
              cubit.getFavoriteItems();
              return cubit;
            },
            child: const FavoritesPage(),
          ),
          settings: settings,
        );
      case AppRoutes.searchRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => SearchCubit(),
            child: const SearchPage(),
          ),
          settings: settings,
        );
      case AppRoutes.articleDetailsRoute:
        final article = settings.arguments as Article;
        return MaterialPageRoute(
          builder: (_) => ArticleDetailsPage(article: article),
          settings: settings,
        );
      case AppRoutes.profileRoute:
        // final article = settings.arguments as Article;
        return MaterialPageRoute(
          builder: (_) => ProfilePage(),
          settings: settings,
        );
      // Add more routes here as needed
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
          settings: settings,
        );
    }
  }
}
