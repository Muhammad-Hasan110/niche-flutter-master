import 'dart:async';

import 'package:flutter/material.dart';
import 'package:login_niche2/about/widget/customCard.dart';

class AboutScreen extends StatelessWidget {
  final List<String> sectionTitles = [
    'Welcome to Butterpply - Your One-Stop Services Marketplace!',
    'Our Mission',
    'Our Vision',
  ];

  final List<String> sectionDescriptions = [
    'At Butterpply, we\'ve created a convenient platform that connects skilled professionals with users seeking top-notch services. Whether you need a quick touch-up for your appearance, a thorough cleaning for your living spaces, a new employee or expert,  our diverse community of suppliers (sellers) is here to cater to all your needs. Say goodbye to the hassle of searching for multiple service providers - we bring the experts right to your fingertips',
    'At Butterpply, our mission is to create a thriving marketplace that simplifies and enhances the process of finding and providing all general services. We aim to empower skilled professionals by giving them a platform to showcase their talents and grow their businesses. Simultaneously, we strive to offer users a seamless and reliable experience in finding top-quality services so they don\'t have to.',
    'Our vision is to become the leading online destination for all general services, where customers can easily access a wide array of services from trusted sellers. We envision a world where home & business owners can effortlessly find skilled professionals, and sellers can expand their reach and prosper through our user-friendly platform. By fostering a community built on security, trust and excellence, we aim to revolutionize the way people access and provide services, making it a hassle-free and enjoyable experience for all.',
  ];

  final List<String> imageUrls = [
    'https://images.unsplash.com/photo-1562259920-47afc3030ba2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80',
    'https://images.unsplash.com/photo-1638866411782-5f59287c19e1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=920&q=80',
    'https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          title: Text(
            'About Us',
            style: TextStyle(
              fontFamily: 'Montserrat',
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
            ),
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            // Positioned.fill(
            //   child: Image.network(
            //     imageUrls[0], // Alternate images
            //     fit: BoxFit.cover,
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: CustomCard(
            //     title: sectionTitles[0],
            //     description: sectionDescriptions[0],
            //     imageUrl: imageUrls[0],
            //   ),
            // ),
            RequestCard(title: sectionTitles[0], desc: sectionDescriptions[0]),
            HowItWorksScreen(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InteractiveCardList(),
            ),
            RequestCard(
                title: "Tell Us What You Need",
                desc:
                    "Initiating looking for a professional and not sure where to start? Tell us about your project and we'll send you a list of Health & Wellness professionals to review. There's no pressure to hire, so you can compare profiles, read previous reviews and ask for more information before you make your decision. Best of all - it's completely free!"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomCard(
                title: sectionTitles[1],
                description: sectionDescriptions[1],
                imageUrl: imageUrls[1],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomCard(
                title: sectionTitles[2],
                description: sectionDescriptions[2],
                imageUrl: imageUrls[2],
              ),
            ),
            // Line Separator
            Divider(
              height: 30.0,
              color: Colors.black,
            ),

            // Copyright Text
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "© Butterpply",
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}

class InteractiveCardList extends StatefulWidget {
  @override
  _InteractiveCardListState createState() => _InteractiveCardListState();
}

class _InteractiveCardListState extends State<InteractiveCardList> {
  List<Map<String, dynamic>> categories = [
    {
      'title': 'Salon Services',
      'description':
          'Treat yourself to a pampering session from our skilled and experienced hairstylists, beauticians, and makeup artists. Our salon services include haircuts, hair styling, facials, waxing, threading, manicures, pedicures, and much more. Whether you want a glamorous makeover for a special occasion or just need to relax and unwind, our salon professionals are here to cater to your needs.',
      'imageUrl':
          'https://images.unsplash.com/photo-1633681926035-ec1ac984418a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80',
      'services': [
        // List of services for this category
      ],
    },
    {
      'title': 'Home Cleaning',
      'description':
          'Leave the cleaning to the experts and experience the joy of a spotless  space. Our cleaning services cover every nook and cranny, ensuring that everything remains fresh and tidy. From A-La-Carte to regular or deep cleaning maintenance, our meticulous cleaning specialists will make your space shine.',
      'imageUrl':
          'https://images.unsplash.com/photo-1581578731548-c64695cc6952?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80',
      'services': [
        // List of services for this category
      ],
    },
    {
      'title': 'Carpentry Services',
      'description':
          'Got a broken cabinet, squeaky door, or in need of custom-made furniture? Our skilled carpenters are at your service! From repairs to installations and everything in between, we\'ll help you transform your house into a home with our expert carpentry services.',
      'imageUrl':
          'https://images.unsplash.com/photo-1626081063434-79a2169791b1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=876&q=80',
      'services': [],
    },
    {
      'title': 'Electrical Service',
      'description':
          'Safety is our priority, and so is your convenience. Our experienced electricians are ready to assist with electrical repairs, installations, and upgrades. Trust us to handle your electrical requirements with expertise and precision.',
      'imageUrl':
          'https://images.unsplash.com/photo-1581092921461-eab62e97a780?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80',
      'services': [],
    },
    {
      'title': 'Pest Control Services:',
      'description':
          'Keep unwanted guests at bay with our effective pest control solutions. Our team of professionals will rid your home of pests and ensure a pest-free environment for you and your family.',
      'imageUrl':
          'https://plus.unsplash.com/premium_photo-1682126104327-ef7d5f260cf7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80',
      'services': [],
    },
    {
      'title': 'Wedding & Events',
      'description':
          'Experience the pinnacle of elegance and skill with our Wedding & Events services. Indulge in exquisite catering and captivating photography, all flawlessly orchestrated by our experts. From seamless event planning to top-tier security, we transform your vision into an unforgettable reality.',
      'imageUrl':
          'https://images.unsplash.com/photo-1464366400600-7168b8af9bc3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=869&q=80',
      'services': [],
    },
    {
      'title': 'Business Necessities',
      'description':
          '''Empower your business with our array of essential services. From precise Accounting and efficient Card Processing to captivating Web Designing and tailor-made Application Building, we offer streamlined Bookkeeping, strategic Advertising, compelling Logo Design, and comprehensive Business Plans for your success.''',
      'imageUrl':
          'https://images.unsplash.com/photo-1522071820081-009f0129c71c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80',
      'services': [],
    },
    {
      'title': 'Video Service',
      'description':
          'Unlock captivating visuals with our video services. From Explainer to Promotional Videos, we cover your marketing needs. Elevate teams with Training Videos and create impact through Video Design. Share your vision, and we\'ll bring it to life through the power of video.',
      'imageUrl':
          'https://images.unsplash.com/photo-1530712024539-ecd73dfb1c9d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80',
      'services': [],
    },

    // Add more categories here
  ];

  int selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 240.0,
          child: PageView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            onPageChanged: (index) {
              setState(() {
                selectedCategoryIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Container(
                width: MediaQuery.of(context).size.width * 0.95,
                child: CustomCard(
                  title: categories[index]['title'],
                  description: categories[index]['description'],
                  imageUrl: categories[index]['imageUrl'],
                ),
              );
            },
          ),
        ),
        // Show the selected category services here
        Column(
          children: [
            for (var service in categories[selectedCategoryIndex]['services'])
              ListTile(
                title: Text(service),
              ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        // Indicator circles
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: categories.map((category) {
            int index = categories.indexOf(category);
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 2.0),
              width: 8.0,
              height: 8.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: selectedCategoryIndex == index
                    ? Colors.blueAccent
                    : Colors.grey,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class HowItWorksScreen extends StatelessWidget {
  final List<String> buyerSteps = [
    'Browse Services',
    'Purchase Services',
    'Enjoy at Home',
    'Post Job Requests',
  ];

  final List<String> sellerSteps = [
    'Register and List Services',
    'Apply to Job Requests',
    'Deliver Services',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            'https://images.unsplash.com/photo-1574169208507-84376144848b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=579&q=80',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(16.0),
        color: Colors.black.withOpacity(0.6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'How It Works:',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'For Sellers:',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 12.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (final step in sellerSteps)
                            HowItWorksStep(
                              text: step,
                              icon: Icons.check_circle,
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 24.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'For Buyers:',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 12.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (final step in buyerSteps)
                            HowItWorksStep(
                              text: step,
                              icon: Icons.check_circle,
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HowItWorksStep extends StatelessWidget {
  final String text;
  final IconData icon;

  HowItWorksStep({required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: Colors.blue,
          size: 20,
        ),
        SizedBox(width: 12.0),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'Montserrat',
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
        ),
      ],
    );
  }
}

class RequestCard extends StatelessWidget {
  String title, desc;
  RequestCard({
    required this.title,
    required this.desc,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 12.0),
          Text(
            desc,
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }
}
