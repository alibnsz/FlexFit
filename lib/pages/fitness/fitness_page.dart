import 'package:flutter/material.dart';
import '../../components/tabBar.dart';
import 'details_page.dart';

List<ImageDetails> _images = [
  ImageDetails(
    imagePath: 'assets/fitness/chest.jpg',
    title: 'CHEST',
    details:
        'Bench Press: Lift and lower a barbell on a bench.\nPush-Ups: Lower and push back up from the ground.\nChest Flyes: Lift and lower dumbbells out to the sides.\nIncline Bench Press: Perform bench press on an inclined bench.\nDips: Lower and push up on parallel bars.\nCable Crossovers: Pull cables across body on a pulley machine.\nPush-Up Variations: Wide grip, diamond, or decline push-ups.',
  ),
  ImageDetails(
    imagePath: 'assets/fitness/back.jpg',
    title: 'BACK',
    details:
        'Deadlifts: Lift barbell from ground, engaging back muscles.\nRows: Pull weights towards body, targeting back muscles.\nPull-Ups: Grip bar, pull body up, engaging back muscles.\nLat Pulldowns: Pull bar to chest, targeting lats.\nBack Extensions: Lift upper body, engaging back muscles.\nReverse Flyes: Lift arms out to sides, targeting rear delts.\nSuperman Pose: Extend arms and legs off ground, engaging back muscles.',
  ),
  ImageDetails(
    imagePath: 'assets/fitness/arms.jpg',
    title: 'ARMS ',
    details:
        'Bicep Curls: Curl weights towards shoulders.\nTricep Dips: Lower and push up on parallel bars.\nOverhead Press: Push weight overhead.\nTricep Pushdowns: Extend elbows with cable machine.\nHammer Curls: Curl weights with palms facing inward.\nSkull Crushers: Lower and extend barbell above forehead.\nPull-Ups/Chin-Ups: Pull body up on bar.\nCableRows: Pull cable handle towards abdomen.',
  ),
  ImageDetails(
    imagePath: 'assets/fitness/abs.jpg',
    title: 'ABS ',
    details:
        'Crunches: Perform abdominal crunches by lying on your back and curling your upper body towards your knees.\nPlanks: Hold a plank position by resting on your forearms and toes, keeping your body in a straight line.',
  ),
  ImageDetails(
    imagePath: 'assets/fitness/shoulders.jpg',
    title: 'SHOULDERS',
    details:
        'Shoulder Press: Push weights overhead, targeting shoulder muscles.\nLateral Raises: Lift weights out to sides, targeting side delts.\nFront Raises: Lift weights in front of you, targeting front delts.\nArnold Press: Rotate weights as you press overhead, engaging shoulder muscles.\nUpright Rows: Pull weights up towards chin, targeting upper traps and shoulders.\nShrugs: Lift and lower weights with shoulders, targeting traps.\nPush Press: Use leg drive to help push weights overhead, engaging shoulders.\nRemember to use proper form, start with lighter weights, and gradually increase the intensity as you progress.',
  ),
  ImageDetails(
      imagePath: 'assets/fitness/legs.jpg',
      title: 'LEGS',
      details:
          'Squats: Bend your knees and lower your hips as if sitting down, then push back up, targeting the leg muscles.\nLunges: Take a step forward, lower your body by bending both knees, then push back up. Repeat with the other leg.\nDeadlifts: Lift a barbell from the ground by extending your hips and knees, targeting the posterior chain muscles.\nLeg Press: Sit on a leg press machine, push the weight away with your legs, targeting the leg muscles.\nCalf Raises: Stand on the edge of a step or a raised surface, lift your heels to raise your body, targeting the calf muscles.\nLeg Extensions: Sit on a leg extension machine, extend your legs to lift the weight, targeting the quadriceps.')
];

class FitPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              const MyTabBarIcon(
                text: 'WORKOUT',
                image: 'assets/tabbar/gym.png',
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 20,
                    childAspectRatio: 400 / 140, // Genişlik:Yükseklik oranı
                  ),
                  itemBuilder: (context, index) {
                    return RawMaterialButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsPage(
                              imagePath: _images[index].imagePath,
                              title: _images[index].title,
                              details: _images[index].details,
                              index: index,
                            ),
                          ),
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Stack(
                          children: [
                            Hero(
                              tag: 'logo$index',
                              child: Image.asset(
                                _images[index].imagePath,
                                fit: BoxFit.cover,
                                height: 140,
                                width: 400,
                              ),
                            ),
                            Center(
                              child: Text(
                                _images[index].title,
                                style: const TextStyle(
                                  fontSize: 45,
                                  fontFamily: 'FugazOne',
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: _images.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ImageDetails {
  final String imagePath;

  final String title;
  final String details;
  ImageDetails({
    required this.imagePath,
    required this.title,
    required this.details,
  });
}
