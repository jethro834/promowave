import 'package:flutter/material.dart';

class CreateCampaignScreen extends StatefulWidget {
  const CreateCampaignScreen({super.key});

  @override
  State<CreateCampaignScreen> createState() => _CreateCampaignScreenState();
}

class _CreateCampaignScreenState extends State<CreateCampaignScreen> {
  int step = 0;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final TextEditingController budgetController = TextEditingController();

  String selectedCountry = "Nigeria";
  String selectedGender = "All";

  List<String> countries = ["Nigeria", "Ghana", "Kenya", "South Africa"];
  List<String> genders = ["All", "Male", "Female"];

  void nextStep() {
    if (step < 3) {
      setState(() => step++);
    }
  }

  void prevStep() {
    if (step > 0) {
      setState(() => step--);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Campaign"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            LinearProgressIndicator(
              value: (step + 1) / 4,
            ),

            const SizedBox(height: 20),

            Expanded(child: _buildStep()),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (step > 0)
                  ElevatedButton(
                    onPressed: prevStep,
                    child: const Text("Back"),
                  )
                else
                  const SizedBox(),

                ElevatedButton(
                  onPressed: step == 3 ? _submitCampaign : nextStep,
                  child: Text(step == 3 ? "Create Campaign" : "Next"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildStep() {
    switch (step) {
      case 0:
        return _campaignInfo();
      case 1:
        return _adContent();
      case 2:
        return _audienceTargeting();
      case 3:
        return _budgetAndSchedule();
      default:
        return Container();
    }
  }

  Widget _campaignInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Campaign Info",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        TextField(
          controller: nameController,
          decoration: const InputDecoration(
            labelText: "Campaign Name",
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }

  Widget _adContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Ad Content",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),

        TextField(
          controller: titleController,
          decoration: const InputDecoration(
            labelText: "Ad Title",
            border: OutlineInputBorder(),
          ),
        ),

        const SizedBox(height: 10),

        TextField(
          controller: descController,
          maxLines: 4,
          decoration: const InputDecoration(
            labelText: "Description",
            border: OutlineInputBorder(),
          ),
        ),

        const SizedBox(height: 10),

        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Text("Upload Media (Image/Video) - Coming Soon"),
        ),
      ],
    );
  }

  Widget _audienceTargeting() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Audience Targeting",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),

        DropdownButtonFormField(
          value: selectedCountry,
          items: countries
              .map((c) => DropdownMenuItem(value: c, child: Text(c)))
              .toList(),
          onChanged: (value) {
            setState(() {
              selectedCountry = value.toString();
            });
          },
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Country",
          ),
        ),

        const SizedBox(height: 10),

        DropdownButtonFormField(
          value: selectedGender,
          items: genders
              .map((g) => DropdownMenuItem(value: g, child: Text(g)))
              .toList(),
          onChanged: (value) {
            setState(() {
              selectedGender = value.toString();
            });
          },
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Gender",
          ),
        ),
      ],
    );
  }

  Widget _budgetAndSchedule() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Budget & Schedule",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),

        TextField(
          controller: budgetController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: "Budget (₦)",
            border: OutlineInputBorder(),
          ),
        ),

        const SizedBox(height: 20),

        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.blueAccent.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Text(
            "Payment will be handled via Flutterwave after campaign creation",
          ),
        ),
      ],
    );
  }

  void _submitCampaign() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Campaign Created"),
        content: const Text(
          "Your campaign has been created successfully. Payment integration comes next.",
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, '/dashboard');
            },
            child: const Text("OK"),
          )
        ],
      ),
    );
  }
}
