import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recruitment_space/core/scroll_behaviour.dart';
import 'package:recruitment_space/data_models/landing_menu_type.dart';
import 'package:recruitment_space/view/painters/collapsed_painter.dart';
import 'package:recruitment_space/view/painters/curved_painter.dart';
import 'package:recruitment_space/view/colors/tomisha_colors.dart';
import 'package:recruitment_space/view/widgets/icons/icons_path.dart';
import 'package:recruitment_space/view/widgets/spacers/spacers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
      scrollBehavior: MyCustomScrollBehavior(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static LandingMenuType _selectedMenuType = const LandingMenuType.first();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          _buildLoginButton(),
        ],
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          MediaQuery.of(context).size.width < 1005
              ? _buildMobileStack()
              : _buildWebStack()
        ],
      ),
      bottomNavigationBar: MediaQuery.of(context).size.width < 900
          ? Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5,
                  ),
                ],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12.0),
                    topRight: Radius.circular(12.0)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: _buildRegistrationButton(),
                  ),
                ],
              ),
            )
          : null,
    );
  }

  Widget _buildLoginButton() => TextButton(
        child: Text(
          'Login',
          style: Theme.of(context).textTheme.headline6?.copyWith(
                color: TomishaColors.cyanShade,
                fontSize: 14,
              ),
        ),
        onPressed: () {},
      );

  Widget _buildWelcomeMessage({TextAlign? textAlign}) => SizedBox(
        width: 320,
        child: Text(
          'Deine Job\nwebsite',
          style: Theme.of(context).textTheme.headline2?.copyWith(
                color: TomishaColors.darkDesaturatedBlue,
              ),
          textAlign: textAlign,
        ),
      );

  Widget _buildJobMessage() => Text(
        'Drei einfache Schritte\nzu deinem neuen Job',
        style: Theme.of(context).textTheme.headline3?.copyWith(
              color: TomishaColors.darkDesaturatedBlue,
            ),
        textAlign: TextAlign.center,
      );

  Widget _buildRegistrationButton() => Container(
        height: 40,
        width: 320,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            TomishaColors.cyanShade,
            TomishaColors.strongBlue,
          ]),
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
        ),
        child: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              Colors.transparent,
            ),
            shadowColor: MaterialStateProperty.all(
              Colors.transparent,
            ),
          ),
          child: const Text('Kostenlos Registrieren'),
        ),
      );

  Widget _buildAgreementImageWithDecoration() => Container(
        height: 405,
        width: 405,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: _buildAgreementImage(),
        ),
      );

  Widget _buildAgreementImage() => SvgPicture.asset(
        TomishaIconPaths.agreement,
      );

  Widget _buildFirstStepImage() => SvgPicture.asset(
        TomishaIconPaths.personalData,
      );

  Widget _buildSecondStepImage() => SvgPicture.asset(
        TomishaIconPaths.task,
      );

  Widget _buildThirdStepImage() => SvgPicture.asset(
        TomishaIconPaths.personalFile,
      );

  Widget _buildWebAgreementRow() => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Column(
            children: [
              spaceH40,
              _buildWelcomeMessage(),
              spaceH50,
              _buildRegistrationButton(),
            ],
          ),
          spaceW140,
          Column(
            children: [
              spaceH70,
              _buildAgreementImageWithDecoration(),
            ],
          ),
          const Spacer(flex: 2),
        ],
      );

  Widget _buildMobileAgreementImage() => SizedBox(
        width: MediaQuery.of(context).size.width,
        child: _buildAgreementImage(),
      );

  Widget _buildMobileAgreementRow() => Row(
        children: [
          const Spacer(),
          Column(
            children: [
              spaceH40,
              _buildWelcomeMessage(textAlign: TextAlign.center),
              _buildMobileAgreementImage(),
            ],
          ),
          const Spacer(),
        ],
      );

  Widget _buildWebFirstStepRow() => Row(
        children: [
          const Spacer(),
          Stack(
            children: [
              Container(
                height: 208,
                width: 208,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: TomishaColors.aliceWhite,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 30,
                  top: 40,
                ),
                child: Text(
                  '1.',
                  style: Theme.of(context).textTheme.headline1?.copyWith(
                        color: TomishaColors.darkGrayishBlue,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 140,
                  top: 110,
                ),
                child: Text(
                  'Erstellen dein Lebenslauf',
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                        color: TomishaColors.darkGrayishBlue,
                      ),
                ),
              )
            ],
          ),
          spaceW40,
          _buildFirstStepImage(),
          const Spacer(
            flex: 2,
          ),
        ],
      );

  Widget _buildMobileFirstStepRow() => Stack(
        children: [
          Container(
            height: 208,
            width: 208,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: TomishaColors.aliceWhite,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 30,
              top: 70,
            ),
            child: Text(
              '1.',
              style: Theme.of(context).textTheme.headline1?.copyWith(
                    color: TomishaColors.darkGrayishBlue,
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 120,
              top: 160,
            ),
            child: Text(
              'Erstellen dein Lebenslauf',
              style: Theme.of(context).textTheme.headline6?.copyWith(
                    color: TomishaColors.darkGrayishBlue,
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 90),
            child: SizedBox(
              height: 150,
              child: _buildFirstStepImage(),
            ),
          ),
        ],
      );

  Widget _buildWebSecondStepRow() => Stack(
        children: [
          CustomPaint(
            size: const Size(double.infinity, 400),
            painter: CollapsedPainter(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Spacer(flex: 2),
                _buildSecondStepImage(),
                spaceW120,
                Text(
                  '2.',
                  style: Theme.of(context).textTheme.headline1?.copyWith(
                        color: TomishaColors.darkGrayishBlue,
                      ),
                ),
                spaceW30,
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    'Erstellen dein Lebenslauf',
                    style: Theme.of(context).textTheme.headline4?.copyWith(
                          color: TomishaColors.darkGrayishBlue,
                        ),
                  ),
                ),
                const Spacer(flex: 2),
              ],
            ),
          ),
        ],
      );

  Widget _buildMobileSecondStepRow() => Stack(
        children: [
          CustomPaint(
            size: const Size(double.infinity, 330),
            painter: CollapsedPainter(),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Spacer(),
                Text(
                  '2.',
                  style: Theme.of(context).textTheme.headline1?.copyWith(
                        color: TomishaColors.darkGrayishBlue,
                      ),
                ),
                spaceW10,
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    'Erstellen dein Lebenslauf',
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                          color: TomishaColors.darkGrayishBlue,
                        ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 160),
            child: Row(
              children: [
                const Spacer(),
                SizedBox(
                  height: 160,
                  child: _buildSecondStepImage(),
                ),
                const Spacer(),
              ],
            ),
          ),
        ],
      );

  Widget _buildWebThirdStepRow() => Row(
        children: [
          const Spacer(),
          Stack(
            children: [
              Container(
                height: 303,
                width: 303,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: TomishaColors.aliceWhite,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 120,
                  top: 30,
                ),
                child: Text(
                  '3.',
                  style: Theme.of(context).textTheme.headline1?.copyWith(
                        color: TomishaColors.darkGrayishBlue,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 230,
                  top: 60,
                ),
                child: Text(
                  'Mit nur einem\nKlick bewerben',
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                        color: TomishaColors.darkGrayishBlue,
                      ),
                ),
              )
            ],
          ),
          spaceW40,
          _buildThirdStepImage(),
          const Spacer(
            flex: 2,
          ),
        ],
      );

  Widget _buildMobileThirdStepRow() => Stack(
        children: [
          Container(
            height: 303,
            width: 303,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: TomishaColors.aliceWhite,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 60,
              top: 30,
            ),
            child: Text(
              '3.',
              style: Theme.of(context).textTheme.headline1?.copyWith(
                    color: TomishaColors.darkGrayishBlue,
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 160,
              top: 90,
            ),
            child: Text(
              'Mit nur einem\nKlick bewerben',
              style: Theme.of(context).textTheme.headline6?.copyWith(
                    color: TomishaColors.darkGrayishBlue,
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80, left: 90),
            child: SizedBox(
              child: _buildThirdStepImage(),
            ),
          ),
        ],
      );

  Widget _buildMobileStack() => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Stack(
            children: [
              CustomPaint(
                size: const Size(double.infinity, 600),
                painter: CurvedPainter(),
              ),
              _buildMobileAgreementRow(),
            ],
          ),
          spaceH40,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const ScrollPhysics(),
              child: _buildMenuButtons(),
            ),
          ),
          spaceH30,
          _buildMobileFirstStepRow(),
          spaceH30,
          _buildMobileSecondStepRow(),
          _buildMobileThirdStepRow(),
        ],
      );

  Widget _buildMenuButton(
    LandingMenuType menuType,
  ) {
    return InkWell(
      child: Container(
        height: 40,
        width: 150,
        decoration: menuType.decoration(
          menuType == _selectedMenuType ? TomishaColors.riptide : null,
        ),
        alignment: Alignment.center,
        child: Text(
          menuType.toString(),
          style: Theme.of(context).textTheme.headline6?.copyWith(
                color: menuType != _selectedMenuType
                    ? TomishaColors.riptide
                    : Colors.white,
                fontSize: 14,
              ),
        ),
      ),
      onTap: () {
        setState(() {
          _selectedMenuType = menuType;
        });
      },
    );
  }

  Widget _buildMenuButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildMenuButton(const LandingMenuType.first()),
        _buildMenuButton(const LandingMenuType.second()),
        _buildMenuButton(const LandingMenuType.third()),
      ],
    );
  }

  Widget _buildWebStack() => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Stack(
            children: [
              CustomPaint(
                size: const Size(double.infinity, 600),
                painter: CurvedPainter(),
              ),
              _buildWebAgreementRow(),
            ],
          ),
          _buildMenuButtons(),
          spaceH50,
          _buildJobMessage(),
          spaceH70,
          _buildWebFirstStepRow(),
          Padding(
            padding: const EdgeInsets.only(right: 150),
            child: SvgPicture.asset(
              TomishaIconPaths.stepRight,
            ),
          ),
          _buildWebSecondStepRow(),
          Padding(
            padding: const EdgeInsets.only(right: 120),
            child: SvgPicture.asset(
              TomishaIconPaths.stepLeft,
            ),
          ),
          _buildWebThirdStepRow(),
          spaceH70,
        ],
      );
}
