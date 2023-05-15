import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:superheroes/models/superhero_model.dart' as sups;

class SupDetailsPage extends StatelessWidget {

  sups.SuperHeroModel superHeroModel;

   SupDetailsPage(this.superHeroModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
/*
    sups.SuperHeroModel superHeroModel = sups.SuperHeroModel.fromJson({
      "response": "success",
      "id": "70",
      "name": "Batman",
      "powerstats": {
        "intelligence": "100",
        "strength": "26",
        "speed": "27",
        "durability": "50",
        "power": "47",
        "combat": "100"
      },
      "biography": {
        "full-name": "Bruce Wayne",
        "alter-egos": "No alter egos found.",
        "aliases": ["Insider", "Matches Malone"],
        "place-of-birth": "Crest Hill, Bristol Township; Gotham County",
        "first-appearance": "Detective Comics #27",
        "publisher": "DC Comics",
        "alignment": "good"
      },
      "appearance": {
        "gender": "Male",
        "race": "Human",
        "height": ["6'2", "188 cm"],
        "weight": ["210 lb", "95 kg"],
        "eye-color": "blue",
        "hair-color": "black"
      },
      "work": {
        "occupation": "Businessman",
        "base":
            "Batcave, Stately Wayne Manor, Gotham City; Hall of Justice, Justice League Watchtower"
      },
      "connections": {
        "group-affiliation":
            "Batman Family, Batman Incorporated, Justice League, Outsiders, Wayne Enterprises, Club of Heroes, formerly White Lantern Corps, Sinestro Corps",
        "relatives":
            "Damian Wayne (son), Dick Grayson (adopted son), Tim Drake (adopted son), Jason Todd (adopted son), Cassandra Cain (adopted ward)\nMartha Wayne (mother, deceased), Thomas Wayne (father, deceased), Alfred Pennyworth (former guardian), Roderick Kane (grandfather, deceased), Elizabeth Kane (grandmother, deceased), Nathan Kane (uncle, deceased), Simon Hurt (ancestor), Wayne Family"
      },
      "image": {
        "url": "https://www.superherodb.com/pictures2/portraits/10/100/639.jpg"
      }
    });
*/

    return Scaffold(
      // appBar: AppBar(),
      body: Column(
        children: [

          Stack(
            children: [
              Image.network(
                superHeroModel.image!.url.toString(),
                width: 1.sw,
                height: 0.4.sh,
                fit: BoxFit.fill,
              ),
              AppBar(backgroundColor: Colors.transparent),
            ],
          ),
          SizedBox(
            height: 0.6.sh,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      superHeroModel.name.toString(),
                      style: TextStyle(fontSize: 16.sp),
                    ),
                    SizedBox(
                      height: 0.01.sh,
                    ),
                    Text(
                      superHeroModel.biography!.alignment == "good"
                          ? "Good"
                          : "Bad",
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: superHeroModel.biography!.alignment == "good"
                              ? Colors.green
                              : Colors.red),
                    ),
                    SizedBox(
                      height: 0.02.sh,
                    ),
                    buildPowerStats(superHeroModel),
                    SizedBox(
                      height: 0.02.sh,
                    ),
                    buildBiography(superHeroModel),
                    SizedBox(
                      height: 0.02.sh,
                    ),
                    buildAppearance(superHeroModel),
                    SizedBox(
                      height: 0.02.sh,
                    ),
                    buildWork(superHeroModel),
                    SizedBox(
                      height: 0.02.sh,
                    ),
                    buildConnections(superHeroModel),
                    SizedBox(
                      height: 0.1.sh,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Column buildPowerStats(sups.SuperHeroModel superHeroModel) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "PowerStats",
              style: TextStyle(fontSize: 14.sp),
            ),
            // const Icon(Icons.keyboard_arrow_down_sharp)
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              buildPowerStatItem(
                  "Intelligence",
                  double.parse(superHeroModel.powerstats!.intelligence!),
                  Colors.blue),
              SizedBox(
                height: 0.015.sh,
              ),
              buildPowerStatItem(
                  "Strength",
                  double.parse(superHeroModel.powerstats!.strength!),
                  Colors.red),
              SizedBox(
                height: 0.015.sh,
              ),
              buildPowerStatItem(
                  "Speed",
                  double.parse(superHeroModel.powerstats!.speed!),
                  Colors.purpleAccent),
              SizedBox(
                height: 0.015.sh,
              ),
              buildPowerStatItem(
                  "Durability",
                  double.parse(superHeroModel.powerstats!.durability!),
                  Colors.green),
              SizedBox(
                height: 0.015.sh,
              ),
              buildPowerStatItem(
                  "Power",
                  double.parse(superHeroModel.powerstats!.power!),
                  Colors.orange),
              SizedBox(
                height: 0.015.sh,
              ),
              buildPowerStatItem(
                  "Combat",
                  double.parse(superHeroModel.powerstats!.combat!),
                  Colors.deepPurple),
            ],
          ),
        ),
      ],
    );
  }

  Column buildPowerStatItem(String power, double stat, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          power,
          style: TextStyle(fontSize: 12.sp),
        ),
        SizedBox(
          height: 0.01.sh,
        ),
        LinearProgressIndicator(
          backgroundColor: color.withOpacity(0.2),
          valueColor: AlwaysStoppedAnimation<Color>(color),
          value: stat / 100,
        )
      ],
    );
  }

  Column buildBiography(sups.SuperHeroModel superHeroModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Biography",
              style: TextStyle(fontSize: 14.sp),
            ),
            // const Icon(Icons.keyboard_arrow_down_sharp)
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            buildBiographyItem(
                "Full name", superHeroModel.biography!.fullName!),
            buildBiographyItem(
                "Alter egos", superHeroModel.biography!.alterEgos!),
            buildBiographyItem(
                "Aliases", superHeroModel.biography!.aliases!.join(", ")),
            buildBiographyItem(
                "Place of birth", superHeroModel.biography!.placeOfBirth!),
            buildBiographyItem(
                "First appearance", superHeroModel.biography!.firstAppearance!),
            buildBiographyItem(
                "Publisher", superHeroModel.biography!.publisher!),
          ]),
        ),
      ],
    );
  }

  Column buildBiographyItem(String item, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$item : ",
          style: TextStyle(fontSize: 12.sp),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            value,
            style: TextStyle(fontSize: 12.sp),
          ),
        ),
      ],
    );
  }

  Column buildAppearance(sups.SuperHeroModel superHeroModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Appearance",
              style: TextStyle(fontSize: 14.sp),
            ),
            // const Icon(Icons.keyboard_arrow_down_sharp)
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            buildBiographyItem("Gender", superHeroModel.appearance!.gender!),
            buildBiographyItem("Race", superHeroModel.appearance!.race!),
            buildBiographyItem(
                "Height", superHeroModel.appearance!.height!.join(", ")),
            buildBiographyItem(
                "Weight", superHeroModel.appearance!.weight!.join(", ")),
            buildBiographyItem(
                "Eye color", superHeroModel.appearance!.eyeColor!),
            buildBiographyItem(
                "Hair color", superHeroModel.appearance!.hairColor!),
          ]),
        ),
      ],
    );
  }

  Column buildWork(sups.SuperHeroModel superHeroModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Work",
              style: TextStyle(fontSize: 14.sp),
            ),
            // const Icon(Icons.keyboard_arrow_down_sharp)
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildBiographyItem(
                  "Occupation", superHeroModel.work!.occupation!),
              buildBiographyItem("Base", superHeroModel.work!.base!),
            ],
          ),
        )
      ],
    );
  }

  Column buildConnections(sups.SuperHeroModel superHeroModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Connections",
              style: TextStyle(fontSize: 14.sp),
            ),
            // const Icon(Icons.keyboard_arrow_down_sharp)
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildBiographyItem("Group-affiliation",
                  superHeroModel.connections!.groupAffiliation!),
              buildBiographyItem(
                  "Relatives", superHeroModel.connections!.relatives!),
            ],
          ),
        )
      ],
    );
  }
}
