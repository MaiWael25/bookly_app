import 'package:bookly_app/core/utils/app_routers.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:bookly_app/features/home/presentaion/manager/featured_books_cubit/featured_books_cubit_cubit.dart';
import 'package:bookly_app/features/home/presentaion/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FeatureBooksListView extends StatelessWidget {
  const FeatureBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksCubitState>(
      builder: (context, state) {
        if (state is FeaturedBooksCubitSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.books.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child:  GestureDetector(
                      onTap: ()
                      {
                         GoRouter.of(context).push(AppRouter.kBookDetailsView,extra: state.books[index]);
                      },
                      child: CustomBookImage(imageUrl: state.books[index].volumeInfo.imageLinks?.thumbnail??'',)),
                  );
                }),
          );
        } else if (state is FeaturedBooksCubitFailure) {
          return CustomError(errmessage: state.errMessage);
        } else {
          return CustomLoadingIndicator();
        }
      },
    );
  }
}
