import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:specdoc/models/categories.dart';
import 'package:specdoc/providers/provider.dart';
import 'package:specdoc/services/apis.dart';
import 'package:specdoc/utils/colors.dart';
import 'package:specdoc/widgets/categories_list_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String search = "";
  late List<Categories> searchCategory;
  bool loading = true;
  void get() {
    setState(() {
      loading = true;
    });
    ApiCalls().getCategories();
    Provider.of<CategoriesList>(context, listen: false).getData();
    setState(() {
      loading = false;
    });
  }

  searchCategoryApi(String val) async {
    setState(() {
      loading = true;
    });
    searchCategory = await ApiCalls().search(val);
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    get();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'SpecDoc',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            // color: AppColors.white,
            fontSize: 25,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/images/logo.png'),
            ),
          )
        ],
      ),
      drawer: const Drawer(),
      body: Consumer<CategoriesList>(
        builder: (context, categoriesListModel, child) => SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: (!loading)
                ? SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: size.height * 0.06,
                          width: size.width * 0.93,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: AppColors.lightGrey.withOpacity(0.5),
                          ),
                          child: TextField(
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.search_outlined,
                                color: AppColors.darkGrey,
                              ),
                              border: InputBorder.none,
                              hintText: 'Search',
                              hintStyle: TextStyle(
                                color: AppColors.darkGrey,
                                fontSize: 16,
                              ),
                            ),
                            onSubmitted: (value) {
                              search = value;
                              if (value.isNotEmpty) {
                                searchCategoryApi(value);
                              }
                            },
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: size.height * 0.03),
                            const Center(
                              child: Text(
                                'Categories',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.black,
                                  fontSize: 24,
                                ),
                              ),
                            ),
                            SizedBox(height: size.height * 0.02),
                            if (search.isEmpty)
                              ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return CategoriesListTile(
                                    title: categoriesListModel.category[index],
                                    desc: categoriesListModel.desc[index],
                                  );
                                },
                                itemCount: categoriesListModel.category.length,
                                separatorBuilder: (context, index) =>
                                    SizedBox(height: size.height * 0.02),
                              ),
                            if (search.isNotEmpty && searchCategory.isNotEmpty)
                              ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return CategoriesListTile(
                                    title: searchCategory[index].title!,
                                    desc: searchCategory[index].desc!,
                                  );
                                },
                                itemCount: searchCategory.length,
                                separatorBuilder: (context, index) =>
                                    SizedBox(height: size.height * 0.02),
                              ),
                            if (search.isNotEmpty && searchCategory.isEmpty)
                              const Text(
                                'No data found.',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.black,
                                  fontSize: 18,
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  )
                : const Center(child: CircularProgressIndicator()),
          ),
        ),
      ),
    );
  }
}
