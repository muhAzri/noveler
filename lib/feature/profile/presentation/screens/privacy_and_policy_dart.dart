import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noveler/constant/constant.dart';
import 'package:noveler/feature/profile/presentation/widgets/app_bar.dart';
import 'package:noveler/feature/profile/presentation/widgets/pnc_item.dart';
import 'package:noveler/utils/styles.dart';

List<Map> topPNCList = [
  {
    "content":
        "Noveler handles users personal information according to the following policies.",
  },
  {
    "content":
        'Company respects the privacy rights of its users and protects the personal information collected, stored and used in connection with our service (our "Service"). To further this commitment, we have adopted this Privacy Policy ("Privacy Policy") to guide how we collect, store, and use the information you provide us.',
  },
  {
    "content":
        'By accessing our Service, including registering for a Noveler account, downloading and using software made available by Noveler, or by clicking the “I accept” button (or its equivalent), you are accepting the practices described in this Privacy Policy. If you do not agree to this Privacy Policy, please do not register for an account with Noveler, download software made available by Noveler, or otherwise access our Service.',
  },
  {
    "content":
        'YOU AFFIRM THAT YOU ARE OVER THE AGE OF 18 (OR, IF GREATER THAN 18, THE AGE OF MAJORITY IN YOUR JURISDICTION) AND ARE OF LEGAL AGE IN YOUR JURISDICTION OR RESIDENCE, OR POSSESS LEGAL PARENTAL OR GUARDIAN CONSENT TO ENTER INTO A BINDING CONTRACT. IN ANY CASE, YOU AFFIRM THAT YOU ARE OVER THE AGE OF 13. IF YOU ARE 13 OR UNDER, YOU ARE PROHIBITED FROM USING OUR SERVICE.',
    "fontWeigth": bold,
  }
];

List<Map> privacyList = [
  {
    "title": "SCOPE OF PRIVACY POLICY",
    "content":
        "This Privacy Policy describes ${Constant.privacyAndPolicyProjectName} collection and use of personal information submitted and collected through our Service. Personal information includes any individually identifiable information about you, such as your name, address, telephone number, or e-mail address, and information concerning you collected and/or maintained in personally identifiable form. Please be aware that advertisers or websites with links to and from our Service may collect personal information about you. This Privacy Policy does not apply to, and cannot control the activities of, those other advertisers or websites."
  },
  {
    "title": "INFORMATION WE COLLECT",
    "content":
        "We may collect and process the following data about you:\n\nPersonal information such as your name, e-mail address when you register for an account with ${Constant.privacyAndPolicyProjectName}, make sales inquiries, request support, or make a purchase or payment.\nWe collect certain information automatically and store it in log files. This information may include internet protocol (IP) addresses, operating system, browser type, date/time stamp, and/or program or system error messages and other system information. We may combine this automatically collected log information with other information we collect about you to improve our Service, to improve marketing, analytics, or website functionality.\nIf you contact us or respond to messages and communications that we send to you, we may keep a record of that correspondence.\nWe collect details of your use of our Service and the resources that you access. Such usage information includes information about how, when and from where you access or use our Service.\nUser feedback, community discussions, chats and other interactions on our Service.\nIf you access our Service on your mobile telephone or other mobile device, including tablets, we collect mobile device identifiers, and IP Address. Certain aspects of our Service will create and assign to your device an identifier that is similar to an account number. We may collect the name you have associated with your device, device type, telephone number, country, and any other information you choose to provide or allow us to access, such as geo-location."
  },
  {
    "title": "TRACKING TECHNOLOGIES & COOKIES",
    "content":
        "${Constant.privacyAndPolicyProjectName} and our partners, such as marketing partners and analytics providers, may use tracking technologies such as cookies, beacons, tags and scripts. These technologies are used in analyzing trends, administering our websites, tracking users’ movements around the websites, and to gather demographic information about our user base as a whole. We use cookies for various purposes including our shopping cart, to remember users’ settings, and for authentication. Users can control the use of cookies by adjusting individual browser settings. However, if you reject cookies, you may still use our websites, but your ability to use some features or areas of our websites may be limited. We may also use clear gifs in our HTML-based emails to let us know which emails have been opened by recipients. This allows us to gauge the effectiveness of certain communications and the effectiveness of our marketing campaigns. For this reason, these types of clear gifs are tied to personally identifiable information.\n\nWe may also use tools or third party analytical software to automatically collect and use certain non-personal information that does not directly enable ${Constant.privacyAndPolicyProjectName} to identify you."
  },
  {
    "title": "USE AND SHARING OF INFORMATION COLLECTED",
    "content":
        "We use your personal information and non-personal information, both individually or combined together:\n\nTo help us manage, operate and deliver our Service to you\nTo improve your experience with our Service\nTo develop new products or services for you\nTo provide you with customer and technical support\nTo provide you with software updates\nTo communicate with you about our Service (unless you have not consented to allow us to use your information for these purposes)\nFor marketing and promotional purposes\nFor internal training purposes and statistical analysis\n${Constant.privacyAndPolicyProjectName} does not sell or rent your personal information to third-parties for marketing purposes without your consent. However, you hereby agree that ${Constant.privacyAndPolicyProjectName} may share your personal information with our affiliates to provide you our Service or information about other services and promotional materials. In addition, ${Constant.privacyAndPolicyProjectName} may share personal information with third party service providers that assist Light Novel World in providing you our Service. As a result, your information may be transferred to countries outside your residence.\n\nWhen we share your personal information with third party vendors and suppliers, we require them to adhere to confidentiality and non-disclosure obligations."
  },
  {
    "title": "SAFEGUARDS",
    "content":
        "${Constant.privacyAndPolicyProjectName} maintains appropriate safeguards that ensure the security, integrity, and privacy of the personal information we collect and store about our account holders. Personal information collected by ${Constant.privacyAndPolicyProjectName} is stored in secure operating environments that are not available to the public and that are only accessible by authorized employees. We also have security measures in place to protect the loss, misuse, and alteration of the information under our control (i.e., maintain data quality). Before we allow users to access their personal information, for example, we verify their identity by requesting that they submit information such as their username and password. We also take reasonable steps to ensure that third parties to whom we transfer personal information provide sufficient protection of such data.\n\nYour personal information may be transferred to, and stored at, a destination outside the country of your residence. It may also be processed by personnel of our affiliates and third party service providers who may operate outside the country of your residence. In such case, we will take reasonable steps to require such third party in possession of your personal information to take commercially reasonable security measures to protect the information.\n\nHowever, unfortunately, no data transmission over the internet or any wireless network can be guaranteed to be secure. As a result, while we strive to protect your personal information, you acknowledge that: (a) the security, integrity and privacy of any and all information and data exchanged between you and us through our Service cannot be guaranteed; and (b) any such information and data may be viewed or tampered with in transit by a third party."
  },
  {
    "title": "LINKS TO THIRD PARTY SITES OR SERVICES",
    "content":
        "You should be aware that our Service may from time to time contain links to third-party sites, products or services. ${Constant.privacyAndPolicyProjectName} is not responsible for the privacy practices or the content of such sites or services. If you are concerned about the privacy policy of a certain third party, you should read the privacy policy of the site or service to which you link before you submit any personal information.\n\nWe may also use Google remarketing services, which allow third parties, including Google, to serve advertisements to you on our behalf based on your activity on our Service. This involves placing in certain areas of our Service a small piece of code provided by Google. This code enables third parties, including Google, to place a cookie on your computer that tells them about your use of our Service and allows them to recognize you and display relevant advertisements when you visit other websites within the Google Display Network. We may also use similar remarketing services from other companies. If you would like to opt-out of Google Analytics collecting data from your browser when you visit websites, you can download and install the Google Analytics Opt-out Browser Add-on https://tools.google.com/dlpage/gaoptout"
  },
  {
    "title": "ACCESS TO PERSONAL INFORMATION",
    "content":
        "${Constant.privacyAndPolicyProjectName} makes good faith efforts to enable you to review, update or correct your personal information in our possession. In order to do so, please log into your account or contact our Privacy Policy Administrator at ${Constant.email}. If you contact us, we will need sufficient information from you to establish your identity and to verify your access request, and also to assist us in handling your request. Please note that even if personal information is changed or deleted according to your request, ${Constant.privacyAndPolicyProjectName} may still retain some of your personal information to resolve disputes, enforce ${Constant.privacyAndPolicyProjectName} user agreement(s), and comply with technical and legal requirements and constraints related to the security, integrity and operation of our Service."
  },
  {
    "title": "DEACTIVATED OR TERMINATED ACCOUNTS",
    "content":
        "A request to delete and/or terminate your account will not result in the removal of information collected and already put in aggregate form or information that cannot, in our sole discretion, be removed without undue burden to us. We are not able nor are we obligated to remove any of your information from a third party provider or platform. Moreover, please be aware that even after you delete your account or your account is terminated, your information may not be deleted in its entirety from our servers and servers of the third party with whom such information has been shared."
  },
  {
    "title": "Right to request deletion of your personal information",
    "content":
        "You may also request that we delete any personal information that we have collected from/about you. However, we may retain personal information as authorized under applicable law, such as personal information required as necessary to provide our services, protect our business and systems from fraudulent activity, to debug and identify errors that impair existing functionality, as necessary for us, or others, to exercise their free speech or other rights, comply with law enforcement requests pursuant to lawful process, for scientific or historical research, for our own internal purposes reasonably related to your relationship with us, or to comply with legal obligations. We need certain types of information so that we can provide our services. If you ask us to delete it, you may no longer be able to access or use our services."
  },
  {
    "title": "How to exercise your access and deletion rights",
    "content":
        "You can exercise your right to privacy by sending your deletion request via email at ${Constant.email}. For security purposes, we may ask you for additional information to verify your identity when you request to exercise your privacy rights. If you have an online account with us, logging into your account will serve to verify your identity and request, although we may request additional information if we believe your account has been compromised. If you do not have an account with us, or if we have reason to suspect that the security of your account is compromised, we will request additional information from you to match with our existing records to verify your identity, depending on the nature of the request and the sensitivity of the information sought."
  },
  {
    "title": "INQUIRIES",
    "content":
        "If you have any questions, please feel free to e-mail us at ${Constant.email}."
  }
];

class PrivacyAndPolicy extends StatelessWidget {
  const PrivacyAndPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrivacyAndPolicyAppBar(),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 24.h),
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: topPNCList.length,
            itemBuilder: (context, index) {
              return TopPNCItem(
                text: topPNCList[index]['content'],
                fontWeight: topPNCList[index]['fontWeigth'],
              );
            },
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: privacyList.length,
            itemBuilder: (context, index) {
              return PNCItem(
                index: index + 1,
                title: privacyList[index]['title'],
                content: privacyList[index]['content'],
              );
            },
          ),
        ],
      ),
    );
  }
}
