import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noveler/constant/constant.dart';
import 'package:noveler/feature/profile/presentation/widgets/app_bar.dart';
import 'package:noveler/utils/styles.dart';

final String dmcaContent = """
If you have reason to believe that one of our content is violating your copyrights or some of Search Results references to illegal contents, please send a email for us. Please allow up to a 1-5 business days for an email response. Note that emailing your complaint to other parties such as our Internet Service Provider, Hosting Provider, and other third party will not expedite your request and may result in a delayed response due to the complaint not being filed properly.

Required information

Please note that we deal only with messages that meet the following requirements:

\u2013 Please Provide us with your name, address and telephone number. We reserve the right to verify this information. \n
\u2013 Explain which copyrighted material is affected.\n
\u2013 Please provide the exact and complete to the url link.\n
\u2013 If it a case of files with illegal contents, please describe the contents briefly in two or three points.\n
\u2013 Please ensure that you can receive further enquiries from us at the e-mail address you are writing from.\n
\u2013 Please write to us only in English.\n

Notice:

Anonymous or incomplete messages will not be deal with it. Thank you for your understanding.

DISCLAIMER:
None of the all files and video listed in this website are hosted on the server of ${Constant.privacyAndPolicyProjectName} all point to content hosted on third party websites. ${Constant.privacyAndPolicyProjectName} does not accept responsibility for content hosted on third party websites and does not have any involvement in the downloading/uploading of pictures. We just post links available in internet. If you think any of the contents of this site infringes any intellectual property law and you hold the copyright of that content please report it to ${Constant.email} the content will be immediately removed.
Thank you.

""";

class DMCAScreen extends StatelessWidget {
  const DMCAScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DMCAAppBar(),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 24.h),
        children: [
          Text(
            dmcaContent,
            style: blackTextStyle.copyWith(fontWeight: medium),
          ),
        ],
      ),
    );
  }
}
