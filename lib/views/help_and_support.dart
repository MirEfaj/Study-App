import 'package:flutter/material.dart';
import '../widgets/appBar.dart';
import '../widgets/gradient_background.dart';
import '../widgets/section_title.dart';

class HelpAndSupport extends StatefulWidget {
  const HelpAndSupport({super.key});

  static const String name = 'help-support-page';

  @override
  State<HelpAndSupport> createState() => _HelpAndSupportState();
}

class _HelpAndSupportState extends State<HelpAndSupport> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  final List<Map<String, String>> _faqList = [
    {
      "question": "How can I reset my password?",
      "answer": "Go to Profile > Security section, enter your current password and new password, then tap 'Update Password'."
    },
    {
      "question": "Where can I view my certificates?",
      "answer": "You can find all your earned certificates under Dashboard > My Certificates."
    },
    {
      "question": "How can I contact instructors?",
      "answer": "Open any enrolled course and use the 'Ask Instructor' button under the discussion section."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const AppBarWidget(appBarTitle: 'Help & Support'),
      body: GradientBackground(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🧭 Header
              const Text("Need Help?", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),),
              const SizedBox(height: 8),
              const Text(
                "We’re here to help you with any questions or issues.",
                style: TextStyle(color: Colors.white70, fontSize: 16),),
              const SizedBox(height: 30),

              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  _buildHelpCard(Icons.question_answer_rounded, "FAQs", "Common questions answered",),
                  _buildHelpCard(Icons.support_agent, "Contact Us", "Reach out to our support team",),
                  _buildHelpCard(Icons.chat_bubble_outline, "Live Chat", "Get instant help from our team",),
                  _buildHelpCard(Icons.bug_report_outlined, "Report Issue", "Let us know if something’s wrong",),
                ],
              ),

              const SizedBox(height: 40),

              //  FAQ Section
              const SectionTitle(title: "Frequently Asked Questions"),
              const SizedBox(height: 15),
              ..._faqList.map((faq) => _buildFaqTile(faq)).toList(),

              const SizedBox(height: 40),

              //  Contact Form
              const SectionTitle(title: "Contact Support"),
              const SizedBox(height: 10),
              _buildTextField("Full Name", _nameController),
              _buildTextField("Email Address", _emailController),
              _buildTextField("Your Message", _messageController, maxLines: 4),
              const SizedBox(height: 15),
              _buildSubmitButton(),

              const SizedBox(height: 40),

              //  Footer
              Center(
                child: Column(
                  children: [
                    const Text(
                      "Need urgent help?",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text("📧 support@skillwave.com\n📞 +880 1679828659",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white.withAlpha(200), fontSize: 14),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  // 🧩 Widgets

  Widget _buildHelpCard(IconData icon, String title, String subtitle) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width / 2) - 28,
      child: Card(
        color: Colors.white,
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: const Color(0xFF7B61FF), size: 36),
              const SizedBox(height: 10),
              Text(title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(color: Colors.black54, fontSize: 13),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFaqTile(Map<String, String> faq) {
    return ExpansionTile(
      tilePadding: const EdgeInsets.symmetric(horizontal: 10),
      iconColor: Colors.white,
      collapsedIconColor: Colors.white70,
      title: Text(
        faq["question"]!,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Text(
            faq["answer"]!,
            style: const TextStyle(color: Colors.white70),
          ),
        ),
      ],
    );
  }

  Widget _buildTextField(String label, TextEditingController controller,
      {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.white,
          labelStyle: const TextStyle(color: Colors.black54),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:
            const BorderSide(width: 1.2, color: Color(0xFF7B61FF)),
          ),
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF7B61FF),
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Message submitted successfully!")),
          );
        },
        icon: const Icon(Icons.send),
        label: const Text("Submit Message",
            style: TextStyle(fontSize: 16, color: Colors.white)),
      ),
    );
  }
}

