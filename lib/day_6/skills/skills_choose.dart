import 'package:flutter/material.dart';
class ChooseSkills extends StatefulWidget {
  final Function(List<String>) onSkillChanged;

  const ChooseSkills({required this.onSkillChanged});

  @override
  _ChooseSkillsState createState() => _ChooseSkillsState();
}

class _ChooseSkillsState extends State<ChooseSkills> {
  List<String> _selectedSkills = [];

  void _toggleSkill(String skill) {
    setState(() {
      if (_selectedSkills.contains(skill)) {
        _selectedSkills.remove(skill);
      } else {
        _selectedSkills.add(skill);
      }
    });
    widget.onSkillChanged(_selectedSkills);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Skills"),
            Wrap(
              children: [
                SkillChips("Flutter"),
                SkillChips("React"),
                SkillChips("Python"),
                SkillChips("UI/UX"),
                SkillChips("Kotlin"),
                SkillChips("Java"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget SkillChips(String skill) {
    final bool isSelected = _selectedSkills.contains(skill);

    return ChoiceChip(
      avatar: CircleAvatar(
        child: Icon(Icons.check_circle),
      ),
      label: Text(skill),
      selected: isSelected,
      onSelected: (_) => _toggleSkill(skill),
      selectedColor: Colors.red,
      labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.white),
      backgroundColor: Colors.blue,

    );
  }
}

