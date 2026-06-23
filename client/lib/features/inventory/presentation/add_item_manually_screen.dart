import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class AddItemManuallyScreen extends HookWidget {
  const AddItemManuallyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = useTextEditingController();
    final quantity = useState(1);
    final selectedCategory = useState('Dairy & Eggs');
    final expiryDate = useState<DateTime?>(null);
    final autoAddToList = useState(true);

    final categories = [
      'Dairy & Eggs',
      'Vegetables',
      'Fruits',
      'Meat & Poultry',
      'Beverages',
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFFEFAE7),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFEFAE7).withOpacity(0.7),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF49672F)),
          onPressed: () => context.pop(),
        ),
        title: Text(
          'Add Item',
          style: GoogleFonts.plusJakartaSans(
            color: const Color(0xFF49672F),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Color(0xFF44483D)),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              // Progress Steps
              const _ProgressSteps(currentStep: 1),
              const SizedBox(height: 32),
              // Hero Image
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Stack(
                  children: [
                    Image.network(
                      'https://lh3.googleusercontent.com/aida-public/AB6AXuA7YS8LhKBTQRpR4nCc0L_VFuKo1Kv98m7jaIGokfWalqbpMEZoUCoYqITowsBVWYFrFEL2gxnjr49-df5Im_QfPpErSvrDxL4Gu49ZPTuXazwr3DmX8lihci2GWLIkSbOIB4ZnSK1IKoydBpvkBNIWIlFXLVQqWx1TrXcDbbnZ2ndGkmXu580b_EfzS8H7ROeW0r_RH0xJnFfoaf-eoSpcY5IsEAq6ViliUCGQc1LkkT66hv19DUijuRISKftGl18aSTKcXBpAuB2D',
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      height: 180,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            const Color(0xFFFEFAE7).withOpacity(0.8),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: TextButton.icon(
                  onPressed: () => context.push('/scanner'),
                  icon: const Icon(Icons.barcode_scanner, size: 18),
                  label: const Text(
                    'SCAN RECEIPT',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                  style: TextButton.styleFrom(foregroundColor: const Color(0xFF49672F)),
                ),
              ),
              const SizedBox(height: 24),
              // Form Fields
              _InputFieldLabel(label: 'PRODUCT NAME'),
              _CustomTextField(
                controller: nameController,
                hintText: 'e.g. Organic Whole Milk',
              ),
              const SizedBox(height: 24),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _InputFieldLabel(label: 'CATEGORY'),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: const BoxDecoration(
                            color: Color(0xFFE7E3D0),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                            ),
                            border: Border(
                              bottom: BorderSide(color: Color(0xFFC4C8BA), width: 2),
                            ),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: selectedCategory.value,
                              isExpanded: true,
                              icon: const Icon(Icons.expand_more),
                              onChanged: (val) => selectedCategory.value = val!,
                              items: categories
                                  .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                                  .toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _InputFieldLabel(label: 'QUANTITY'),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: const BoxDecoration(
                            color: Color(0xFFE7E3D0),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                            ),
                            border: Border(
                              bottom: BorderSide(color: Color(0xFFC4C8BA), width: 2),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove, size: 20),
                                onPressed: () {
                                  if (quantity.value > 1) quantity.value--;
                                },
                                constraints: const BoxConstraints(),
                                padding: EdgeInsets.zero,
                                color: const Color(0xFF49672F),
                              ),
                              Text(
                                '${quantity.value}',
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              IconButton(
                                icon: const Icon(Icons.add, size: 20),
                                onPressed: () => quantity.value++,
                                constraints: const BoxConstraints(),
                                padding: EdgeInsets.zero,
                                color: const Color(0xFF49672F),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              _InputFieldLabel(label: 'EXPIRY DATE'),
              InkWell(
                onPressed: () async {
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now().add(const Duration(days: 7)),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 365)),
                  );
                  if (picked != null) expiryDate.value = picked;
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  decoration: const BoxDecoration(
                    color: Color(0xFFE7E3D0),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                    border: Border(
                      bottom: BorderSide(color: Color(0xFFC4C8BA), width: 2),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        expiryDate.value == null
                            ? 'Select Date'
                            : DateFormat('yyyy-MM-dd').format(expiryDate.value!),
                        style: TextStyle(
                          color: expiryDate.value == null
                              ? const Color(0xFF44483D).withOpacity(0.4)
                              : const Color(0xFF1D1C11),
                        ),
                      ),
                      const Icon(Icons.calendar_today, size: 18, color: Color(0xFF44483D)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
              // Toggle Section
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFF8F4E1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: const BoxDecoration(
                        color: Color(0xFFCFE3EE),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.shopping_cart_checkout, color: Color(0xFF4F616B)),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Auto-Add to Shopping List',
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            'Add when item is out of stock',
                            style: TextStyle(fontSize: 12, color: Color(0xFF44483D)),
                          ),
                        ],
                      ),
                    ),
                    Switch(
                      value: autoAddToList.value,
                      onChanged: (val) => autoAddToList.value = val,
                      activeColor: const Color(0xFF49672F),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              // Action Buttons
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () => context.go('/inventory'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF49672F),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                    elevation: 4,
                  ),
                  child: const Text(
                    'Next Step',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Center(
                child: TextButton(
                  onPressed: () => context.pop(),
                  child: const Text(
                    'Cancel and discard',
                    style: TextStyle(color: Color(0xFF44483D), fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProgressSteps extends StatelessWidget {
  final int currentStep;
  const _ProgressSteps({required this.currentStep});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _StepIcon(step: 1, label: 'DETAILS', isActive: currentStep >= 1),
        Expanded(child: Container(height: 2, color: const Color(0xFFE7E3D0))),
        _StepIcon(step: 2, label: 'STORAGE', isActive: currentStep >= 2),
        Expanded(child: Container(height: 2, color: const Color(0xFFE7E3D0))),
        _StepIcon(step: 3, label: 'REVIEW', isActive: currentStep >= 3),
      ],
    );
  }
}

class _StepIcon extends StatelessWidget {
  final int step;
  final String label;
  final bool isActive;

  const _StepIcon({required this.step, required this.label, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: isActive ? const Color(0xFF49672F) : const Color(0xFFE7E3D0),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              '$step',
              style: TextStyle(
                color: isActive ? Colors.white : const Color(0xFF44483D),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            color: isActive ? const Color(0xFF49672F) : const Color(0xFF44483D).withOpacity(0.4),
            letterSpacing: 1.2,
          ),
        ),
      ],
    );
  }
}

class _InputFieldLabel extends StatelessWidget {
  final String label;
  const _InputFieldLabel({required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 8),
      child: Text(
        label,
        style: GoogleFonts.plusJakartaSans(
          fontSize: 10,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
          color: const Color(0xFF49672F),
        ),
      ),
    );
  }
}

class _CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const _CustomTextField({required this.controller, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(
        color: Color(0xFFE7E3D0),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
        border: Border(
          bottom: BorderSide(color: Color(0xFFC4C8BA), width: 2),
        ),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(color: const Color(0xFF44483D).withOpacity(0.4)),
        ),
      ),
    );
  }
}
