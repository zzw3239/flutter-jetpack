import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jetpack/data/beans.dart';
import 'package:jetpack/data/const.dart';
import 'package:jetpack/widgets/responsive_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class WidgetMenuAbout extends StatefulWidget {
  @override
  _WidgetMenuAboutState createState() => _WidgetMenuAboutState();
}

class _WidgetMenuAboutState extends State<WidgetMenuAbout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: _buildLargeScreen(),
      ),
    );
  }

  _buildLargeScreen() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _buildIllustration(),
        SizedBox(
          height: 8,
        ),
        _buildhomeMe(),
        SizedBox(
          height: 8,
        ),
        _buildSocialIcons(),
        SizedBox(
          height: 8,
        ),
        _buildHeadline(),
        SizedBox(
          height: 8,
        ),
        _buildEducation(),
        SizedBox(
          height: 8,
        ),
        _buildSkills(),

      ],
    );
  }

  Widget _buildIllustration() {
    return Align(
      alignment: Alignment.center,
      child: Image.asset(
        programmer3,
        height: 360,
      ),
    );
  }

  Widget _buildEducation() {
    return Column(
      children: <Widget>[
        _buildEducationContainerHeading(),
        SizedBox(height: 8.0),
        _buildEducationSummary(),
        SizedBox(height: 8.0),
        _buildEducationTimeline(),
      ],
    );
  }

  Widget _buildEducationContainerHeading() {
    return Text(experience, style: Theme.of(context).textTheme.subtitle1);
  }

  Widget _buildEducationSummary() {
    return Text('性能的关键是精简，而不是一堆的优化用例。除非有真正显著的效果，否则一定要忍住你那些蠢蠢欲动的小微调的企图。',
        style: Theme.of(context).textTheme.subtitle2);
  }

  Widget _buildEducationTimeline() {
    final List<Widget> widgets = educationList
        .map((education) => _buildEducationTile(education))
        .toList();
    return Column(children: widgets);
  }

  Widget _buildEducationTile(Education education) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: <Widget>[
          Text('${education.post}',
              style: Theme.of(context).textTheme.bodyText2),
          Text('${education.organization}',
              style: Theme.of(context).textTheme.bodyText2),
          Text('${education.from}-${education.to}',
              style: Theme.of(context).textTheme.bodyText2),
        ],
      ),
    );
  }

  Widget _buildSkills() {
    final List<Widget> widgets = skills
        .map((skill) => Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: _buildSkillChip(context, skill),
            ))
        .toList();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _buildSkillsContainerHeading(),
        ResponsiveWidget.isLargeScreen(context)
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(),
                  ),
                  Expanded(flex: 4, child: Wrap(children: widgets)),
                  Expanded(
                    flex: 1,
                    child: Container(),
                  )
                ],
              )
            : Wrap(children: widgets),
      ],
    );
  }

  Widget _buildSkillsContainerHeading() {
    return Text(skills_i_have, style: Theme.of(context).textTheme.subtitle1);
  }

  Widget _buildSkillChip(BuildContext context, String label) {
    return Chip(
      label: Text(label, style: Theme.of(context).textTheme.subtitle2),
    );
  }

  Widget _buildhomeMe() {
    return RichText(
      text: TextSpan(
        // Note: Styles for TextSpans must be explicitly defined.
        // Child text spans will inherit styles from parent
        children: <TextSpan>[
          TextSpan(text: about, style: Theme.of(context).textTheme.subtitle1),
          TextSpan(text: me, style: Theme.of(context).textTheme.subtitle2),
        ],
      ),
    );
  }

  Widget _buildHeadline() {
    return Text(
      headline,
      style: Theme.of(context).textTheme.subtitle2,
    );
  }

  Widget _buildSocialIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            showDialog(
                context: context,
                child: AlertDialog(
                  title: Text("微信号"),
                  content: Text("zhanyong0425"),
                  actions: <Widget>[
                    FlatButton(
                        onPressed: () {
                          Clipboard.setData(
                              ClipboardData(text: 'zhanyong0425'));
                          Navigator.of(context).pop();
                        },
                        child: Text('复制')),
                  ],
                ));
          },
          child: Image.asset(
            weixin,
            height: 20.0,
            width: 20.0,
          ),
        ),
        SizedBox(width: 16.0),
        GestureDetector(
          onTap: () {
            showDialog(
                context: context,
                child: AlertDialog(
                  title: Text("QQ"),
                  content: Text("1608889789"),
                  actions: <Widget>[
                    FlatButton(
                        onPressed: () {
                          Clipboard.setData(ClipboardData(text: '1608889789'));
                          Navigator.of(context).pop();
                        },
                        child: Text('复制')),
                  ],
                ));
          },
          child: Image.asset(
            qq,
            height: 20.0,
            width: 20.0,
          ),
        ),
        SizedBox(width: 16.0),
        GestureDetector(
          onTap: () {
            launch("https://www.jianshu.com/u/77699cd41b28");
          },
          child: Image.asset(
            jianshu,
            height: 20.0,
            width: 20.0,
          ),
        ),
        SizedBox(width: 16.0),
        GestureDetector(
          onTap: () {
            launch("mailto:zzy0523@gmail.com");
          },
          child: Image.asset(
            gmail,
            height: 20.0,
            width: 20.0,
          ),
        ),
      ],
    );
  }


}