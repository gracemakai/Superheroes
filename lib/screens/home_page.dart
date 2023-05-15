import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:superheroes/bloc/superhero_bloc.dart';
import 'package:superheroes/models/superhero_model.dart' as supsModel;
import 'package:superheroes/services/superhero_repository.dart';
import 'package:superheroes/services/superhero_service.dart';

import 'sup_details_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 0.01.sh,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: RepositoryProvider(
          create: (BuildContext context) =>
              SuperHeroRepository(service: SuperHeroService()),
          child: BlocProvider(
            create: (context) {
              return SuperHeroBloc(
                  superHeroRepository: context.read<SuperHeroRepository>())
                ..add(SuperheroEvent());
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 0.07.sh,
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                        border: Border.all(color: Colors.black12, width: 1.5)),
                    child: TextFormField(
                      textAlign: TextAlign.start,
                      decoration: const InputDecoration(
                        hintText: "Search",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        border: InputBorder.none,
                        suffixIcon: Icon(Icons.search),
                        suffixIconConstraints:
                            BoxConstraints(minWidth: 0, minHeight: 0),
                      ),
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      enabled: true,
                      keyboardType: TextInputType.text,
                      maxLines: 1,
                      textInputAction: TextInputAction.search,
                      controller: searchController,
                    ),
                  ),
                  SizedBox(height: 0.02.sh),
                  BlocBuilder<SuperHeroBloc, SuperHeroState>(
                      builder: (context, state) {
                    return state.status.isLoading || state.status.isInitial
                        ? CircularProgressIndicator()
                        : state.status.isError
                            ? Text("Error getting sups")
                            : GridView.builder(
                                shrinkWrap: true,
                                itemCount: state.supers.length,
                                physics: const PageScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 26,
                                        mainAxisSpacing: 13,
                                        childAspectRatio: 0.7),
                                itemBuilder: (context, index) {
                                  supsModel.SuperHeroModel superHero =
                                      state.supers.elementAt(index);
                                  return InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SupDetailsPage(superHero)));
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(15)),
                                          border: Border.all(
                                              color: Colors.black12,
                                              width: 1.5)),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CachedNetworkImage(
                                            imageUrl: superHero.image!.url
                                                .toString(),
                                            progressIndicatorBuilder: (context, url, downloadProgress) =>
                                                Transform.scale(
                                                  scale: 0.3, child: CircularProgressIndicator(value: downloadProgress.progress,)),
                                            errorWidget: (context, url, error) => const Icon(Icons.error),
                                            width: 0.42.sw,
                                            height: 0.2.sh,
                                            imageBuilder: (context, imageProvider) => Container(
                                              width: 0.42.sw,
                                              height: 0.2.sh,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    fit: BoxFit.fill,
                                                    image: imageProvider),
                                                borderRadius:
                                                const BorderRadius.only(
                                                    topLeft:
                                                    Radius.circular(15.0),
                                                    topRight: Radius.circular(
                                                        15.0)),
                                              ),
                                            ),
                                          ),

                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0,
                                                  right: 8.0,
                                                  top: 20),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(superHero.name!,
                                                      style: TextStyle(
                                                          fontSize: 12.sp),
                                                      overflow: TextOverflow
                                                          .ellipsis),
                                                  SizedBox(
                                                    height: 0.005.sh,
                                                  ),
                                                  Text(
                                                      superHero
                                                          .biography!.publisher
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 10.sp),
                                                      overflow: TextOverflow
                                                          .ellipsis),
                                                ],
                                              )),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
