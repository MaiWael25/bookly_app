import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentaion/views/widgets/book_rating.dart';
import 'package:bookly_app/features/home/presentaion/views/widgets/books_action.dart';
import 'package:bookly_app/features/home/presentaion/views/widgets/custom_book_details_app_bar.dart';
import 'package:bookly_app/features/home/presentaion/views/widgets/custom_book_item.dart';
import 'package:bookly_app/features/home/presentaion/views/widgets/similar_books_list_view.dart';

import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                CustomBookDetailsAppBar(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * .28),
                  child: const CustomBookImage(),
                ),
                const SizedBox(
                  height: 43,
                ),
                Text(
                  'The Jungle Book',
                  style:
                      Styles.textStyle30.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 2,
                ),
                Opacity(
                  opacity: 0.7,
                  child: Text(
                    'Rudyard Kibling',
                    style: Styles.textStyle18.copyWith(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                BookRating(
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                BooksAction(),
                Expanded(
                  child: const SizedBox(
                    height: 30,
                  ),
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'You can also like',
                      style: Styles.textStyle14
                          .copyWith(fontWeight: FontWeight.bold),
                    )),
                const SizedBox(
                  height: 16,
                ),
                SimilarBooksListView(),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
