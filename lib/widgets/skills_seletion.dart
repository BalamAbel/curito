import 'package:flutter/material.dart';

class SkillsSelectionScreen extends StatelessWidget {
  final List<Map<String, dynamic>> skills = [
    {'name': 'Programador', 'icon': Icons.code},
    {'name': 'Diseñador gráfico', 'icon': Icons.brush_outlined},
    {'name': 'Chef', 'icon': Icons.local_dining},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selecciona una Especialidad'),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(20),
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: skills.length,
        itemBuilder: (context, index) {
          final skill = skills[index];
          return skillsCard(skill: skill['name'], icono: skill['icon']);
        },
      ),
    );
  }
}

class skillsCard extends StatelessWidget {
  const skillsCard({
    Key? key,
    required this.skill,
    required this.icono,
  }) : super(key: key);

  final String skill;
  final IconData icono;


  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.all(25),
      child: InkWell(
        splashColor: const Color.fromARGB(255,57,73,171),
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     // builder: (context) => SkillFormScreen(skill: skill),
          //   ),
          // );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.blue[50],
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Icon(
                          icono,
                          size: 60.0,
                          color:  const Color.fromARGB(255,57,73,171),
                        ),
                      ),
                      const SizedBox(width: 20),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              skill,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
