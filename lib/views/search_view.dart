import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapi/cubits/news_cubit/news_cubit.dart';
import 'package:newsapi/widgets/build_item_article.dart';
import 'package:newsapi/widgets/custom_text_field.dart';

class SearchView extends StatelessWidget {
  SearchView({Key? key}) : super(key: key);

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        final List<dynamic> list = context.read<NewsCubit>().search;

        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: CustomTextField(
                  controller: searchController,
                  type: TextInputType.text,
                  onChange: (value) {
                    context.read<NewsCubit>().getSearch(value);
                  },
                  hint: 'Search',
                  prefixIcon: const Icon(Icons.search),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    if (index < list.length) {
                      return BuildArticleItem(list[index]);
                    } else {
                      return const SizedBox(); // Return an empty SizedBox if index is out of bounds
                    }
                  },
                  itemCount: list.length,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
