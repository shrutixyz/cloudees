import 'package:flutter/material.dart';

class Privacy extends StatelessWidget {
  const Privacy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: EdgeInsets.all(25),
      child: Container(
          child: SingleChildScrollView(
        child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Privacy Policy",
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.w200, fontSize: 40),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                  "Zanie Co built the Cloudees app as a Free app. This service is provided by Zanie Co at no cost and is intended for use as is.\nThis page is used to inform visitors regarding our policies with the collection, use, and disclosure of Personal Information if anyone decided to use our Service.\nIf you choose to use our Service, then you agree to the collection and use of information in relation to this policy. The Personal Information that we collect is not stored for more than the lifecycle of the prediction, which is not more than 10 seconds in most cases.\nThe terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which are accessible at Cloudees unless otherwise defined in this Privacy Policy."),
              SizedBox(
                height: 50,
              ),
              Text(
                "Information Collection and Use",
                style: TextStyle(fontWeight: FontWeight.w200, fontSize: 25),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  "For running the application efficiently, we require you to provide us with images that we'll be using for our prediction. The information that we request will be retained by us just temporarily for a very short period of time.\nThe app does use third-party services that may collect information used to identify you.\nLink to the privacy policy of third-party service providers used by the app\nGoogle Play Services\nLog Data\n\nWe want to inform you that whenever you use our Service, in a case of an error in the app we collect data and information (through third-party products) on your phone called Log Data. This Log Data may include information such as your device Internet Protocol (“IP”) address, device name, operating system version, the configuration of the app when utilizing our Service, the time and date of your use of the Service, and other statistics."),
              SizedBox(height: 50),
              Text(
                "Cookies",
                style: TextStyle(fontWeight: FontWeight.w200, fontSize: 25),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  "Cookies are files with a small amount of data that are commonly used as anonymous unique identifiers. These are sent to your browser from the websites that you visit and are stored on your device's internal memory.\n\nThis Service does not use these “cookies” explicitly. However, the app may use third-party code and libraries that use “cookies” to collect information and improve their services. You have the option to either accept or refuse these cookies and know when a cookie is being sent to your device. If you choose to refuse our cookies, you may not be able to use some portions of this Service."),
              SizedBox(height: 50),
              Text(
                "Service Providers",
                style: TextStyle(fontWeight: FontWeight.w200, fontSize: 25),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  "We may employ third-party companies and individuals due to the following reasons:\n\nTo facilitate our Service;\nTo provide the Service on our behalf;\nTo perform Service-related services; or\nTo assist us in analyzing how our Service is used.\n\nWe want to inform users of this Service that these third parties have access to their Personal Information. The reason is to perform the tasks assigned to them on our behalf. However, they are obligated not to disclose or use the information for any other purpose."),
              SizedBox(
                height: 50,
              ),
              Text(
                "Security",
                style: TextStyle(fontWeight: FontWeight.w200, fontSize: 25),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  "We value your trust in providing us your Personal Information, thus we are striving to use commercially acceptable means of protecting it. But remember that no method of transmission over the internet, or method of electronic storage is 100% secure and reliable, and we cannot guarantee its absolute security."),
              SizedBox(
                height: 50,
              ),
              Text(
                "Link To Other Sites",
                style: TextStyle(fontWeight: FontWeight.w200, fontSize: 25),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  "This Service may contain links to other sites. If you click on a third-party link, you will be directed to that site. Note that these external sites are not operated by us. Therefore, we strongly advise you to review the Privacy Policy of these websites. We have no control over and assume no responsibility for the content, privacy policies, or practices of any third-party sites or services."),
              SizedBox(height: 50),
              Text(
                "Changes to This Privacy Policy",
                style: TextStyle(fontWeight: FontWeight.w200, fontSize: 25),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  "We may update our Privacy Policy from time to time. Thus, you are advised to review this page periodically for any changes. We will notify you of any changes by posting the new Privacy Policy on this page.\n\nThis policy is effective as of 2022-02-25"),
              SizedBox(
                height: 50,
              ),
              Text(
                "Contact Us",
                style: TextStyle(fontWeight: FontWeight.w200, fontSize: 25),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  "If you have any questions or suggestions about our Privacy Policy, contact us at zaniecompany@gmail.com."),
            ]),
      )),
    )));
  }
}
