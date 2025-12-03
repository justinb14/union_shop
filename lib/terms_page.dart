import 'package:flutter/material.dart';
import 'main.dart'; // For buildShopAppBar
import 'footer.dart'; // For buildShopFooter

class TermsPage extends StatelessWidget {
  const TermsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildShopAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 32),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                '📜 Placeholder Terms and Conditions Policy',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 24),
              Text(
                'Last Updated: December 3, 2025\n\n'
                '1. Acceptance of Terms\n'
                'By accessing or using the services provided by Acme Placeholder Solutions, Inc. ("The Company," "we," "us," or "our") through the website at www.projectplaceholder.com (the "Service"), you agree to be bound by these Terms and Conditions ("Terms"). If you disagree with any part of the terms, then you do not have permission to access the Service. These Terms apply to all visitors, users, and others who wish to access or use the Service.\n\n'
                '2. Intellectual Property Rights\n'
                'The Service and its original content (excluding content provided by users), features, and functionality are and will remain the exclusive property of The Company and its licensors. Our trademarks and trade dress may not be used in connection with any product or service without the prior written consent of The Company. This content is protected by copyright and other intellectual property laws.\n\n'
                '3. User Accounts (If Applicable)\n'
                'You must be at least 18 years of age to use the Service.\n\n'
                'You are responsible for maintaining the confidentiality of your account and password and for restricting access to your computer or device.\n\n'
                'You agree to accept responsibility for all activities that occur under your account or password.\n\n'
                'You must notify us immediately upon becoming aware of any breach of security or unauthorized use of your account.\n\n'
                '4. Links to Other Websites\n'
                'Our Service may contain links to third-party websites or services that are not owned or controlled by The Company.\n\n'
                'The Company has no control over and assumes no responsibility for the content, privacy policies, or practices of any third-party websites or services. You further acknowledge and agree that The Company shall not be responsible or liable, directly or indirectly, for any damage or loss caused or alleged to be caused by or in connection with use of or reliance on any such content, goods, or services available on or through any such websites or services.\n\n'
                '5. Termination\n'
                'We may terminate or suspend your access to the Service immediately, without prior notice or liability, under our sole discretion, for any reason whatsoever, including without limitation if you breach the Terms. All provisions of the Terms which by their nature should survive termination shall survive termination, including, without limitation, ownership provisions, warranty disclaimers, indemnity, and limitations of liability.\n\n'
                '6. Limitation of Liability\n'
                'In no event shall The Company, nor its directors, employees, partners, agents, suppliers, or affiliates, be liable for any indirect, incidental, special, consequential, or punitive damages, including without limitation, loss of profits, data, use, goodwill, or other intangible losses, resulting from:\n\n'
                '(i) your access to or use of or inability to access or use the Service;\n\n'
                '(ii) any conduct or content of any third party on the Service;\n\n'
                '(iii) any content obtained from the Service; and\n\n'
                '(iv) unauthorized access, use, or alteration of your transmissions or content, whether based on warranty, contract, tort (including negligence), or any other legal theory.\n\n'
                '7. Governing Law\n'
                'These Terms shall be governed and construed in accordance with the laws of the Fictional State of Placeholder, without regard to its conflict of law provisions.\n\n'
                '8. Changes to Terms\n'
                'We reserve the right, at our sole discretion, to modify or replace these Terms at any time. We will try to provide at least 30 days notice prior to any new terms taking effect. What constitutes a material change will be determined at our sole discretion. By continuing to access or use our Service after any revisions become effective, you agree to be bound by the revised terms.\n\n'
                '9. Contact Information\n'
                'If you have any questions about these Terms, please contact us at contact@projectplaceholder.com.',
                style: TextStyle(fontSize: 16, color: Colors.black87, height: 1.6),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: buildShopFooter(context),
    );
  }
}
