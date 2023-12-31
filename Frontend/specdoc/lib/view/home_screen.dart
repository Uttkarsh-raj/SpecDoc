import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:specdoc/data/firebase_database.dart';
import 'package:specdoc/models/categories.dart';
import 'package:specdoc/providers/provider.dart';
import 'package:specdoc/services/apis.dart';
import 'package:specdoc/utils/colors.dart';
import 'package:specdoc/widgets/categories_list_tile.dart';
import 'package:specdoc/widgets/check_auth.dart';

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
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 10),
              Row(
                children: [
                  SizedBox(
                    height: size.height * 0.1,
                    width: size.width * 0.17,
                    child: Image.asset(
                      'assets/images/logo_removebg.png',
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Spec',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Colors.green[800],
                      fontSize: 39,
                    ),
                  ),
                  const Text(
                    'Doc',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: AppColors.black,
                      fontSize: 39,
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.02),
              Padding(
                padding: const EdgeInsets.all(8.0).copyWith(bottom: 0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.home_outlined,
                    ),
                    const SizedBox(width: 10),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'Home',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: AppColors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0).copyWith(top: 0, bottom: 0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.search_outlined,
                    ),
                    const SizedBox(width: 10),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'Search',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: AppColors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0).copyWith(top: 0, bottom: 0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.logout_outlined,
                    ),
                    const SizedBox(width: 10),
                    TextButton(
                      onPressed: () {
                        FirebaseFuncs.logOut();
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const CheckAuth(),
                          ),
                        );
                      },
                      child: const Text(
                        'Logout',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: AppColors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Consumer<CategoriesList>(
        builder: (context, categoriesListModel, child) => SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: (!loading)
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: size.height * 0.06,
                          width: size.width * 0.93,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: AppColors.lightGrey.withOpacity(0.7),
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
                    )
                  : const Center(child: CircularProgressIndicator()),
            ),
          ),
        ),
      ),
    );
  }
}
